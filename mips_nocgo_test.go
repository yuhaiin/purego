// SPDX-License-Identifier: Apache-2.0
// SPDX-FileCopyrightText: 2026 The Ebitengine Authors

//go:build linux && !cgo && (mips || mipsle)

package purego_test

import (
    "bytes"
    "runtime"
    "sync"
    "testing"
    "unsafe"

    "github.com/ebitengine/purego"
)

// These tests require a glibc MIPS32 userland; cross-build alone is not
// sufficient to prove that Go's runtime and the O32 C ABI interact safely.
func TestMIPSO32Libc(t *testing.T) {
    libc, err := purego.Dlopen("libc.so.6", purego.RTLD_NOW|purego.RTLD_LOCAL)
    if err != nil {
        t.Fatal(err)
    }
    defer purego.Dlclose(libc)

    var strlen func(string) uintptr
    purego.RegisterLibFunc(&strlen, libc, "strlen")
    if got := strlen("mipsle-or-mips"); got != 14 {
        t.Errorf("strlen = %d, want 14", got)
    }

    var strcmp func(string, string) int32
    purego.RegisterLibFunc(&strcmp, libc, "strcmp")
    if got := strcmp("same", "same"); got != 0 {
        t.Errorf("strcmp = %d, want 0", got)
    }

    // Arguments 5 and later must be spilled above the O32 register home area.
    var snprintf func(*byte, uintptr, string, int32, int32, int32, int32) int32
    purego.RegisterLibFunc(&snprintf, libc, "snprintf")
    var buf [64]byte
    n := snprintf(&buf[0], uintptr(len(buf)), "%d/%d/%d/%d", 11, 22, 33, 44)
    if n != 11 || !bytes.Equal(buf[:11], []byte("11/22/33/44")) {
        t.Fatalf("snprintf returned %d, wrote %q", n, buf[:])
    }

    // A 64-bit scalar result uses v0:v1 and differs by endianness.
    var strtoull func(string, unsafe.Pointer, int32) uint64
    purego.RegisterLibFunc(&strtoull, libc, "strtoull")
    const large = uint64(0x1234567890abcdef)
    if got := strtoull("1311768467294899695", nil, 10); got != large {
        t.Errorf("strtoull = %#x, want %#x", got, large)
    }

    var malloc func(uintptr) unsafe.Pointer
    var free func(unsafe.Pointer)
    purego.RegisterLibFunc(&malloc, libc, "malloc")
    purego.RegisterLibFunc(&free, libc, "free")
    ptr := malloc(64)
    if ptr == nil {
        t.Fatal("malloc returned nil")
    }
    free(ptr)

    // Exercise threaded libc entry from different Go-managed OS threads.
    var wg sync.WaitGroup
    for range 8 {
        wg.Add(1)
        go func() {
            defer wg.Done()
            runtime.LockOSThread()
            defer runtime.UnlockOSThread()
            for range 32 {
                if got := strlen("thread"); got != 6 {
                    t.Errorf("concurrent strlen = %d, want 6", got)
                    return
                }
            }
        }()
    }
    wg.Wait()
}

func TestMIPSRejectUnsupportedABIs(t *testing.T) {
    assertPanic := func(label string, f func()) {
        t.Helper()
        defer func() {
            if recover() == nil {
                t.Errorf("%s: expected panic", label)
            }
        }()
        f()
    }
    assertPanic("callback", func() { purego.NewCallback(func(uintptr) uintptr { return 0 }) })
    assertPanic("float argument", func() {
        var fn func(float64) uintptr
        purego.RegisterFunc(&fn, 1)
    })
    assertPanic("float return", func() {
        var fn func(uintptr) float64
        purego.RegisterFunc(&fn, 1)
    })
}
