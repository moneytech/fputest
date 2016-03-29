#The following built-in functions are available when -mfxsr is used. All of them generate the machine instruction that is part of the name.
#
#     void __builtin_ia32_fxsave (void *)
#     void __builtin_ia32_fxrstor (void *)
#     void __builtin_ia32_fxsave64 (void *)
#     void __builtin_ia32_fxrstor64 (void *)
#The following built-in functions are available when -mxsave is used. All of them generate the machine instruction that is part of the name.
#
#     void __builtin_ia32_xsave (void *, long long)
#     void __builtin_ia32_xrstor (void *, long long)
#     void __builtin_ia32_xsave64 (void *, long long)
#     void __builtin_ia32_xrstor64 (void *, long long)
#The following built-in functions are available when -mxsaveopt is used. All of them generate the machine instruction that is part of the name.
#
#     void __builtin_ia32_xsaveopt (void *, long long)
#     void __builtin_ia32_xsaveopt64 (void *, long long)
#
fputest: fputest.c
	gcc -Wall -Werror -Ofast -mfxsr -mxsave -mxsaveopt -o fputest fputest.c linux.c

gfputest: fputest.c
	gcc -Wall -Werror -g -mfxsr -mxsave -mxsaveopt -o gfputest fputest.c linux.c

akfputest: fputest.c
	x86_64-ucb-akaros-gcc -Wall -Werror -Ofast -mfxsr -mxsave -mxsaveopt -o fputest fputest.c akaros.c

all: fputest gfputest akfputest
