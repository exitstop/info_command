ctrl+m # чтобы можно было выделять в консоли

# утилиты для windows
https://docs.microsoft.com/ru-ru/sysinternals/downloads/

# dll injector
https://www.dllinjector.com/

# тестовый вирус для виндовс, созхранить в файл Virus.com без ковычек 
"X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*"

# Копировать текс из приложений
https://rammichael.com/textify
https://github.com/RaMMicHaeL/Textify

# Приложухи инспектирования приложений
https://github.com/blackrosezy/gui-inspect-tool

# редактор PE фалов
Stud_PE
CFF Explorer

# установка ssh
# https://winitpro.ru/index.php/2019/10/17/windows-openssh-server/
Add-WindowsCapability -Online -Name OpenSSH.Server*

Приложения -> Управление дополнительными компонентами -> Добавить компонент). Найдите в списке Open SSH Server и нажмите кнопку Install).

#Чтобы проверить, что OpenSSH сервер установлен, выполните:
Get-WindowsCapability -Online | ? Name -like 'OpenSSH.Ser*'

Set-Service -Name sshd -StartupType 'Automatic'
Start-Service sshd

# woe usb
https://www.how2shout.com/linux/how-to-install-woeusb-on-ubuntu-20-04-lts/
