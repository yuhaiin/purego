// SPDX-License-Identifier: Apache-2.0
// SPDX-FileCopyrightText: 2026 The Ebitengine Authors

//go:build linux && !cgo && (mips || mipsle)

#include "textflag.h"
#include "go_asm.h"
#include "funcdata.h"

// MIPS32 O32: a0-a3 = R4-R7, arguments 5+ start at 16(SP).
// The caller owns the first 16 bytes of the argument area. The
// function pointer must be placed in t9/R25 for PIC callees.
// syscallX is called by runtime.cgocall using the C ABI on g0.
//
// 0..127: 32-word O32 argument area (including the 16-byte home area)
// 152: saved s0 / R16
// 156: saved ra / R31
#define MIPS_FRAME 160

GLOBL ·syscallXABI0(SB), NOPTR|RODATA, $4
DATA ·syscallXABI0(SB)/4, $syscallX(SB)

TEXT syscallX(SB), NOSPLIT|NOFRAME, $0-0
    SUBU $MIPS_FRAME, R29
    MOVW R16, 152(R29)
    MOVW R31, 156(R29)
    MOVW R4, R16 // syscallArgs pointer

    // Populate all stack arguments before loading the first four.
    MOVW syscallArgs_a5(R16), R8
    MOVW R8, 16(R29)
    MOVW syscallArgs_a6(R16), R8
    MOVW R8, 20(R29)
    MOVW syscallArgs_a7(R16), R8
    MOVW R8, 24(R29)
    MOVW syscallArgs_a8(R16), R8
    MOVW R8, 28(R29)
    MOVW syscallArgs_a9(R16), R8
    MOVW R8, 32(R29)
    MOVW syscallArgs_a10(R16), R8
    MOVW R8, 36(R29)
    MOVW syscallArgs_a11(R16), R8
    MOVW R8, 40(R29)
    MOVW syscallArgs_a12(R16), R8
    MOVW R8, 44(R29)
    MOVW syscallArgs_a13(R16), R8
    MOVW R8, 48(R29)
    MOVW syscallArgs_a14(R16), R8
    MOVW R8, 52(R29)
    MOVW syscallArgs_a15(R16), R8
    MOVW R8, 56(R29)
    MOVW syscallArgs_a16(R16), R8
    MOVW R8, 60(R29)
    MOVW syscallArgs_a17(R16), R8
    MOVW R8, 64(R29)
    MOVW syscallArgs_a18(R16), R8
    MOVW R8, 68(R29)
    MOVW syscallArgs_a19(R16), R8
    MOVW R8, 72(R29)
    MOVW syscallArgs_a20(R16), R8
    MOVW R8, 76(R29)
    MOVW syscallArgs_a21(R16), R8
    MOVW R8, 80(R29)
    MOVW syscallArgs_a22(R16), R8
    MOVW R8, 84(R29)
    MOVW syscallArgs_a23(R16), R8
    MOVW R8, 88(R29)
    MOVW syscallArgs_a24(R16), R8
    MOVW R8, 92(R29)
    MOVW syscallArgs_a25(R16), R8
    MOVW R8, 96(R29)
    MOVW syscallArgs_a26(R16), R8
    MOVW R8, 100(R29)
    MOVW syscallArgs_a27(R16), R8
    MOVW R8, 104(R29)
    MOVW syscallArgs_a28(R16), R8
    MOVW R8, 108(R29)
    MOVW syscallArgs_a29(R16), R8
    MOVW R8, 112(R29)
    MOVW syscallArgs_a30(R16), R8
    MOVW R8, 116(R29)
    MOVW syscallArgs_a31(R16), R8
    MOVW R8, 120(R29)
    MOVW syscallArgs_a32(R16), R8
    MOVW R8, 124(R29)

    MOVW syscallArgs_a1(R16), R4
    MOVW syscallArgs_a2(R16), R5
    MOVW syscallArgs_a3(R16), R6
    MOVW syscallArgs_a4(R16), R7

    MOVW syscallArgs_fn(R16), R25
    JAL (R25)

    // O32 integer/pointer results live in v0 and v1.
    // The word order of 64-bit results is interpreted in Go.
    MOVW R2, syscallArgs_a1(R16)
    MOVW R3, syscallArgs_a2(R16)
    MOVW $0, R8
    MOVW R8, syscallArgs_a3(R16) // Linux SyscallN doesn't capture errno

    MOVW 152(R29), R16
    MOVW 156(R29), R31
    ADDU $MIPS_FRAME, R29
    RET
