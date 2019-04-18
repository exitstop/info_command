# https://wiki.osdev.org/User:No92/Random_Bits
# Иструция по билду edk2 (нужно работать под bash, а то zsh не тянет) https://github.com/tianocore/tianocore.github.io/wiki/Common-instructions
# http://www.linux-kvm.org/downloads/lersek/ovmf-whitepaper-c770f8c.txt
# HelloWorld
# https://wiki.osdev.org/UEFI
# compile prject edk2 helloWorld https://www.basicinputoutput.com/2017/06/hello-world-quick-start-with-udk2015.html
# create makeFile efi https://www.rodsbooks.com/efi-programming/hello.html
mkdir ~/src
cd ~/src
git clone https://github.com/tianocore/edk2
git submodule update --init --recursive
cd ~/src/edk2
make -C BaseTools
bash$ . edksetup.sh
# здесь настраивать платформу
vim Conf/target.txt

cargo install uefi-run

# compile sample HelloWorld
build -m MdeModulePkg/Application/HelloWorld/HelloWorld.inf

