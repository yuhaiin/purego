// SPDX-License-Identifier: Apache-2.0
// SPDX-FileCopyrightText: 2026 The Ebitengine Authors

//go:build linux && (mips || mipsle) && !cgo

package purego

// syscallXABI0 is initialized by sys_mipsx.s. The function uses the
// MIPS O32 C ABI and must be called through runtime.cgocall.
var syscallXABI0 uintptr

func syscall_syscallN(fn uintptr, args ...uintptr) (r1, r2, err uintptr) {
	panic("purego: syscall_syscallN is only supported on windows")
}

// NewCallback is intentionally not offered until the MIPS C-to-Go ABI,
// signal handling and callback lifetime have been tested.
func NewCallback(_ any) uintptr {
	panic("purego: callbacks are not supported on MIPS")
}
