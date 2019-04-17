# https://wiki.osdev.org/User:No92/Random_Bits
# https://github.com/tianocore/tianocore.github.io/wiki/Common-instructions
# http://www.linux-kvm.org/downloads/lersek/ovmf-whitepaper-c770f8c.txt
# HelloWorld
# https://wiki.osdev.org/UEFI
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

