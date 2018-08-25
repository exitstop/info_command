gcc -O3 -masm=intel main.cpp -S # компиляция получить asm листинг, с диалектом intel
gcc -S -masm=intel -O2 libAsm.cpp -I. # превратить *.cpp в Asm листинг -I. нужен чтобы подключить текующую деррикторию  
