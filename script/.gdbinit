# Перехватываем ptrace в gdb чтобы он возвращал 0
set auto-load safe-path /
catch syscall ptrace
commands 1
set ($eax) = 0
continue
end
