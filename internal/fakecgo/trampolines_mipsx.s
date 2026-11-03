// SPDX-License-Identifier: Apache-2.0
// SPDX-FileCopyrightText: 2026 The Ebitengine Authors

//go:build linux && !cgo && (mips || mipsle)

#include "textflag.h"

// Each C-to-Go trampoline preserves all O32 callee-saved registers,
// including g and floating-point callee-saved registers on hardfloat.
// R29 stays 8-byte aligned; the first 16 bytes form O32's outgoing home area.
//
TEXT x_cgo_init_trampoline(SB), NOSPLIT|NOFRAME, $0-0
    SUBU $128, R29
    MOVW R16, 24(R29)
    MOVW R17, 28(R29)
    MOVW R18, 32(R29)
    MOVW R19, 36(R29)
    MOVW R20, 40(R29)
    MOVW R21, 44(R29)
    MOVW R22, 48(R29)
    MOVW R23, 52(R29)
    MOVW g, 56(R29)
    MOVW R31, 60(R29)
#ifndef GOMIPS_softfloat
    MOVD F20, 64(R29)
    MOVD F22, 72(R29)
    MOVD F24, 80(R29)
    MOVD F26, 88(R29)
    MOVD F28, 96(R29)
    MOVD F30, 104(R29)
#endif
    MOVW R4, 4(R29)
    MOVW R5, 8(R29)
    MOVW ·x_cgo_init_call(SB), R25
    MOVW (R25), R25
    JAL (R25)
#ifndef GOMIPS_softfloat
    MOVD 64(R29), F20
    MOVD 72(R29), F22
    MOVD 80(R29), F24
    MOVD 88(R29), F26
    MOVD 96(R29), F28
    MOVD 104(R29), F30
#endif
    MOVW 24(R29), R16
    MOVW 28(R29), R17
    MOVW 32(R29), R18
    MOVW 36(R29), R19
    MOVW 40(R29), R20
    MOVW 44(R29), R21
    MOVW 48(R29), R22
    MOVW 52(R29), R23
    MOVW 56(R29), g
    MOVW 60(R29), R31
    ADDU $128, R29
    RET

TEXT x_cgo_thread_start_trampoline(SB), NOSPLIT|NOFRAME, $0-0
    SUBU $128, R29
    MOVW R16, 24(R29)
    MOVW R17, 28(R29)
    MOVW R18, 32(R29)
    MOVW R19, 36(R29)
    MOVW R20, 40(R29)
    MOVW R21, 44(R29)
    MOVW R22, 48(R29)
    MOVW R23, 52(R29)
    MOVW g, 56(R29)
    MOVW R31, 60(R29)
#ifndef GOMIPS_softfloat
    MOVD F20, 64(R29)
    MOVD F22, 72(R29)
    MOVD F24, 80(R29)
    MOVD F26, 88(R29)
    MOVD F28, 96(R29)
    MOVD F30, 104(R29)
#endif
    MOVW R4, 4(R29)
    MOVW ·x_cgo_thread_start_call(SB), R25
    MOVW (R25), R25
    JAL (R25)
#ifndef GOMIPS_softfloat
    MOVD 64(R29), F20
    MOVD 72(R29), F22
    MOVD 80(R29), F24
    MOVD 88(R29), F26
    MOVD 96(R29), F28
    MOVD 104(R29), F30
#endif
    MOVW 24(R29), R16
    MOVW 28(R29), R17
    MOVW 32(R29), R18
    MOVW 36(R29), R19
    MOVW 40(R29), R20
    MOVW 44(R29), R21
    MOVW 48(R29), R22
    MOVW 52(R29), R23
    MOVW 56(R29), g
    MOVW 60(R29), R31
    ADDU $128, R29
    RET

TEXT x_cgo_setenv_trampoline(SB), NOSPLIT|NOFRAME, $0-0
    SUBU $128, R29
    MOVW R16, 24(R29)
    MOVW R17, 28(R29)
    MOVW R18, 32(R29)
    MOVW R19, 36(R29)
    MOVW R20, 40(R29)
    MOVW R21, 44(R29)
    MOVW R22, 48(R29)
    MOVW R23, 52(R29)
    MOVW g, 56(R29)
    MOVW R31, 60(R29)
#ifndef GOMIPS_softfloat
    MOVD F20, 64(R29)
    MOVD F22, 72(R29)
    MOVD F24, 80(R29)
    MOVD F26, 88(R29)
    MOVD F28, 96(R29)
    MOVD F30, 104(R29)
#endif
    MOVW R4, 4(R29)
    MOVW ·x_cgo_setenv_call(SB), R25
    MOVW (R25), R25
    JAL (R25)
#ifndef GOMIPS_softfloat
    MOVD 64(R29), F20
    MOVD 72(R29), F22
    MOVD 80(R29), F24
    MOVD 88(R29), F26
    MOVD 96(R29), F28
    MOVD 104(R29), F30
#endif
    MOVW 24(R29), R16
    MOVW 28(R29), R17
    MOVW 32(R29), R18
    MOVW 36(R29), R19
    MOVW 40(R29), R20
    MOVW 44(R29), R21
    MOVW 48(R29), R22
    MOVW 52(R29), R23
    MOVW 56(R29), g
    MOVW 60(R29), R31
    ADDU $128, R29
    RET

TEXT x_cgo_unsetenv_trampoline(SB), NOSPLIT|NOFRAME, $0-0
    SUBU $128, R29
    MOVW R16, 24(R29)
    MOVW R17, 28(R29)
    MOVW R18, 32(R29)
    MOVW R19, 36(R29)
    MOVW R20, 40(R29)
    MOVW R21, 44(R29)
    MOVW R22, 48(R29)
    MOVW R23, 52(R29)
    MOVW g, 56(R29)
    MOVW R31, 60(R29)
#ifndef GOMIPS_softfloat
    MOVD F20, 64(R29)
    MOVD F22, 72(R29)
    MOVD F24, 80(R29)
    MOVD F26, 88(R29)
    MOVD F28, 96(R29)
    MOVD F30, 104(R29)
#endif
    MOVW R4, 4(R29)
    MOVW ·x_cgo_unsetenv_call(SB), R25
    MOVW (R25), R25
    JAL (R25)
#ifndef GOMIPS_softfloat
    MOVD 64(R29), F20
    MOVD 72(R29), F22
    MOVD 80(R29), F24
    MOVD 88(R29), F26
    MOVD 96(R29), F28
    MOVD 104(R29), F30
#endif
    MOVW 24(R29), R16
    MOVW 28(R29), R17
    MOVW 32(R29), R18
    MOVW 36(R29), R19
    MOVW 40(R29), R20
    MOVW 44(R29), R21
    MOVW 48(R29), R22
    MOVW 52(R29), R23
    MOVW 56(R29), g
    MOVW 60(R29), R31
    ADDU $128, R29
    RET

TEXT x_cgo_notify_runtime_init_done_trampoline(SB), NOSPLIT|NOFRAME, $0-0
    SUBU $128, R29
    MOVW R16, 24(R29)
    MOVW R17, 28(R29)
    MOVW R18, 32(R29)
    MOVW R19, 36(R29)
    MOVW R20, 40(R29)
    MOVW R21, 44(R29)
    MOVW R22, 48(R29)
    MOVW R23, 52(R29)
    MOVW g, 56(R29)
    MOVW R31, 60(R29)
#ifndef GOMIPS_softfloat
    MOVD F20, 64(R29)
    MOVD F22, 72(R29)
    MOVD F24, 80(R29)
    MOVD F26, 88(R29)
    MOVD F28, 96(R29)
    MOVD F30, 104(R29)
#endif
    JAL ·x_cgo_notify_runtime_init_done(SB)
#ifndef GOMIPS_softfloat
    MOVD 64(R29), F20
    MOVD 72(R29), F22
    MOVD 80(R29), F24
    MOVD 88(R29), F26
    MOVD 96(R29), F28
    MOVD 104(R29), F30
#endif
    MOVW 24(R29), R16
    MOVW 28(R29), R17
    MOVW 32(R29), R18
    MOVW 36(R29), R19
    MOVW 40(R29), R20
    MOVW 44(R29), R21
    MOVW 48(R29), R22
    MOVW 52(R29), R23
    MOVW 56(R29), g
    MOVW 60(R29), R31
    ADDU $128, R29
    RET

TEXT x_cgo_bindm_trampoline(SB), NOSPLIT|NOFRAME, $0-0
    SUBU $128, R29
    MOVW R16, 24(R29)
    MOVW R17, 28(R29)
    MOVW R18, 32(R29)
    MOVW R19, 36(R29)
    MOVW R20, 40(R29)
    MOVW R21, 44(R29)
    MOVW R22, 48(R29)
    MOVW R23, 52(R29)
    MOVW g, 56(R29)
    MOVW R31, 60(R29)
#ifndef GOMIPS_softfloat
    MOVD F20, 64(R29)
    MOVD F22, 72(R29)
    MOVD F24, 80(R29)
    MOVD F26, 88(R29)
    MOVD F28, 96(R29)
    MOVD F30, 104(R29)
#endif
    MOVW R4, 4(R29)
    JAL ·x_cgo_bindm(SB)
#ifndef GOMIPS_softfloat
    MOVD 64(R29), F20
    MOVD 72(R29), F22
    MOVD 80(R29), F24
    MOVD 88(R29), F26
    MOVD 96(R29), F28
    MOVD 104(R29), F30
#endif
    MOVW 24(R29), R16
    MOVW 28(R29), R17
    MOVW 32(R29), R18
    MOVW 36(R29), R19
    MOVW 40(R29), R20
    MOVW 44(R29), R21
    MOVW 48(R29), R22
    MOVW 52(R29), R23
    MOVW 56(R29), g
    MOVW 60(R29), R31
    ADDU $128, R29
    RET

TEXT threadentry_trampoline(SB), NOSPLIT|NOFRAME, $0-0
    SUBU $128, R29
    MOVW R16, 24(R29)
    MOVW R17, 28(R29)
    MOVW R18, 32(R29)
    MOVW R19, 36(R29)
    MOVW R20, 40(R29)
    MOVW R21, 44(R29)
    MOVW R22, 48(R29)
    MOVW R23, 52(R29)
    MOVW g, 56(R29)
    MOVW R31, 60(R29)
#ifndef GOMIPS_softfloat
    MOVD F20, 64(R29)
    MOVD F22, 72(R29)
    MOVD F24, 80(R29)
    MOVD F26, 88(R29)
    MOVD F28, 96(R29)
    MOVD F30, 104(R29)
#endif
    MOVW R4, 4(R29)
    MOVW ·threadentry_call(SB), R25
    MOVW (R25), R25
    JAL (R25)
    MOVW $0, R2 // void* return value for pthread_create
#ifndef GOMIPS_softfloat
    MOVD 64(R29), F20
    MOVD 72(R29), F22
    MOVD 80(R29), F24
    MOVD 88(R29), F26
    MOVD 96(R29), F28
    MOVD 104(R29), F30
#endif
    MOVW 24(R29), R16
    MOVW 28(R29), R17
    MOVW 32(R29), R18
    MOVW 36(R29), R19
    MOVW 40(R29), R20
    MOVW 44(R29), R21
    MOVW 48(R29), R22
    MOVW 52(R29), R23
    MOVW 56(R29), g
    MOVW 60(R29), R31
    ADDU $128, R29
    RET

// setg_trampoline is called from Go; setg is a C function
// accepting the g pointer in a0/R4.
// func setg_trampoline(setg uintptr, G uintptr)
TEXT ·setg_trampoline(SB), NOSPLIT|NOFRAME, $0-8
    MOVW setg+0(FP), R25
    MOVW G+4(FP), R4
    SUBU $24, R29
    MOVW R31, 20(R29)
    JAL (R25)
    MOVW 20(R29), R31
    ADDU $24, R29
    RET

// call5 uses Go ABI0 on entry and the O32 ABI for the C call.
// The fifth argument must be at 16(SP), after the register home area.
// func call5(fn, a1, a2, a3, a4, a5 uintptr) uintptr
TEXT ·call5(SB), NOSPLIT|NOFRAME, $0-28
    MOVW fn+0(FP), R25
    MOVW a1+4(FP), R4
    MOVW a2+8(FP), R5
    MOVW a3+12(FP), R6
    MOVW a4+16(FP), R7
    MOVW a5+20(FP), R8
    SUBU $32, R29
    MOVW R31, 28(R29)
    MOVW R8, 16(R29)
    JAL (R25)
    MOVW 28(R29), R31
    ADDU $32, R29
    MOVW R2, ret+24(FP)
    RET
