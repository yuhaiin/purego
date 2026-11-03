# Experimental Linux MIPS32 O32 backend

This branch adds a first-pass MIPS/MIPSLE integer-only C ABI and fakecgo
implementation for `CGO_ENABLED=0`, but **the native path is not yet usable
with stock Go**. Do not merge or declare the architecture supported until the
toolchain and runtime checks below are resolved.

## Confirmed toolchain blocker

The Go internal linker for `linux/mips` and `linux/mipsle` does not implement
`adddynrel`; it exits with:

```
/usr/local/go/pkg/tool/linux_amd64/link: adddynrel currently unimplemented for MIPS
```

Source: https://github.com/golang/go/blob/master/src/cmd/link/internal/mips/obj.go

PureGo's `//go:cgo_import_dynamic` declarations are indispensable for
`dlopen`, `dlsym`, `libc`, `pthread` and other symbols. Thus, merely
writing MIPS O32 call trampolines does not solve the link step.

A minimal demonstration (also reproduced with Go 1.23):

```go
package main
import _ "unsafe"

//go:cgo_import_dynamic purego_dlopen dlopen "libdl.so.2"
//go:cgo_import_dynamic _ _ "libdl.so.2"

//go:linkname dlopen dlopen
var dlopen byte

func main() { _ = &dlopen }
```

When linked with an assembly trampoline that branches to
`purego_dlopen(SB)`, this fails with the error above. Verify on the
target Go release as well.

Possible next steps:

1. Implement and validate MIPS32 dynamic relocation support in the Go
   linker, similar in concept (but **not identical in ABI/relocation
   details**) to `cmd/link/internal/mips64`. This requires a separate
   Go toolchain change.
2. Investigate whether external linking with an appropriate MIPS C
   toolchain is viable; pay attention to the fact that Go may bring
   `runtime/cgo` into externally linked builds, defeating this
   project's no-Cgo runtime expectation.
3. Only then exercise the new PureGo trampolines on a real MIPS32 Linux
   userland or QEMU; successful `go build ./...` package compilation
   alone does not prove correctness.

## Scope of this implementation

- GOOS=linux, GOARCH=mips or mipsle, O32 ABI.
- Initial intended configuration: GOMIPS=softfloat.
- Integer, pointer, string calls and scalar integer returns.
- Register/stack argument placement and 64-bit integer word order.
- NewCallback, float arguments/results, and structs by value unsupported.
- glibc intended first. musl/OpenWrt needs separate handling for
  `libdl.so.2`, `libpthread.so.0`, ABI, TLS and symbol lookup.

## After solving linker support

```sh
CGO_ENABLED=0 GOOS=linux GOARCH=mips GOMIPS=softfloat go build ./...
CGO_ENABLED=0 GOOS=linux GOARCH=mipsle GOMIPS=softfloat go build ./...
```

For QEMU, use target-specific toolchain/sysroot and run the
`TestMIPSO32Libc` and `TestMIPSRejectUnsupportedABIs` tests.
The tests cover calls, stack spill, large integer return,
malloc/free and threading. Also verify the correct ABI of all
`runtime.cgocall` and fakecgo entry/return paths (including g register,
FPR preservation and stack alignment). Repeat with both endiannesses.

The original `CGO_ENABLED=1` fallback is unchanged in intent.
