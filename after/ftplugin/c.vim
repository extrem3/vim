com! -nargs=* -complete=file Asm call RunShellCommand('gcc -m32 -masm=intel -c -g -Wa,-a,-ad ' . expand("%"))
com! -nargs=* -complete=file Asm2 call RunShellCommand('gcc -masm=intel -c -S ' . expand("%") . ' -o .temp_asm.asm && cat .temp_asm.asm')
