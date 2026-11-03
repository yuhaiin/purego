// SPDX-License-Identifier: Apache-2.0
// SPDX-FileCopyrightText: 2026 The Ebitengine Authors

//go:build linux && !cgo && (mips || mipsle)

#include "textflag.h"

// C ABI argset* arrives in a0; Go ABI0 reads its first argument
// from 4(SP). Preserve the C callee-saved register set on return.
TEXT _cgo_purego_setegid_trampoline(SB), NOSPLIT|NOFRAME, $0-0
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
    MOVW ·x_cgo_purego_setegid_call(SB), R25
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

TEXT _cgo_purego_seteuid_trampoline(SB), NOSPLIT|NOFRAME, $0-0
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
    MOVW ·x_cgo_purego_seteuid_call(SB), R25
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

TEXT _cgo_purego_setgid_trampoline(SB), NOSPLIT|NOFRAME, $0-0
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
    MOVW ·x_cgo_purego_setgid_call(SB), R25
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

TEXT _cgo_purego_setregid_trampoline(SB), NOSPLIT|NOFRAME, $0-0
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
    MOVW ·x_cgo_purego_setregid_call(SB), R25
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

TEXT _cgo_purego_setresgid_trampoline(SB), NOSPLIT|NOFRAME, $0-0
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
    MOVW ·x_cgo_purego_setresgid_call(SB), R25
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

TEXT _cgo_purego_setresuid_trampoline(SB), NOSPLIT|NOFRAME, $0-0
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
    MOVW ·x_cgo_purego_setresuid_call(SB), R25
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

TEXT _cgo_purego_setreuid_trampoline(SB), NOSPLIT|NOFRAME, $0-0
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
    MOVW ·x_cgo_purego_setreuid_call(SB), R25
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

TEXT _cgo_purego_setuid_trampoline(SB), NOSPLIT|NOFRAME, $0-0
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
    MOVW ·x_cgo_purego_setuid_call(SB), R25
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

TEXT _cgo_purego_setgroups_trampoline(SB), NOSPLIT|NOFRAME, $0-0
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
    MOVW ·x_cgo_purego_setgroups_call(SB), R25
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

