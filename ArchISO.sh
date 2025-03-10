
#!/usr/bin/env bash
clear
echo -e "\033[32m"  # Start green text

# ==================================================================================

# [[ START :: header]]

# ==================================================================================



installArchLicenseKey="
====================================================================================================================================================

[[ 1. install key ]]

====================================================================================================================================================
"

createPartitions="
====================================================================================================================================================

[[ 3. CREATE-PARTITIONS ]]

====================================================================================================================================================
"

userInput="
====================================================================================================================================================

[[ 2. USER-INPUT ]]

====================================================================================================================================================
"

formatPartitions="
====================================================================================================================================================

[[  4. FORMAT-PARTITIONS ]]

====================================================================================================================================================
"


mountFileSystem="
====================================================================================================================================================

[[ 5. MOUNT-FILE-SYSTEM ]]

====================================================================================================================================================
"

installKernalBaseApp="
====================================================================================================================================================

[[ 6. INSTALL-KERNAL-BASE-PACKAGES ]]

====================================================================================================================================================
"

storingMount="
====================================================================================================================================================

[[ 7. STORING-MOUNT]]

====================================================================================================================================================
"

ArchChroot="
====================================================================================================================================================

[[ 8. ARCH-CHROOT]]

====================================================================================================================================================
"

createChrootScript="
====================================================================================================================================================

[[ 9. CREATE-CHROOT-SCRIPT ]]

====================================================================================================================================================
"

changeUserPermission="
====================================================================================================================================================

[[ 10. USER-PERMISSION ]]

====================================================================================================================================================
"

setDateAndTime="
====================================================================================================================================================

[[ 11. GENERATE-LANG-AND-TIME ]]

====================================================================================================================================================
"

createUser="
====================================================================================================================================================

[[ 12. CREATE-USER ]]

====================================================================================================================================================
"

configHost="
====================================================================================================================================================

[[ 13. HOST-CONFIG ]]

====================================================================================================================================================
"

installGrubAndDependancy="
====================================================================================================================================================

[[ 14. INSTALL-GRUB-AND-DEPENDANCY ]]

====================================================================================================================================================
"

installGrubBootloader="
====================================================================================================================================================

[[ 15. INSTALL-GRUB-BOOTLOADER ]]

====================================================================================================================================================
"

EnablingSystemApps="
====================================================================================================================================================

[[ 16. ENABLING-SYSTEMES ]]

====================================================================================================================================================
"


# ==================================================================================

# [[ END :: header]]

# ==================================================================================

clear
echo -e "\033[32m"  # Start green text
echo "$installArchLicenseKey"

echo -e "\nkey_activation for arch linux && updating.....\n"
pacman-key --init && pacman-key --populate
echo -e "\033[32m"  # Start green text
echo -e "================================================="
echo -e ""
echo -e "\nInstalling keys....\n"
echo -e ""
pacman -Syy archlinux-keyring --needed --noconfirm


echo -e "================================================="
echo -e ""
echo -e "\033[32m"  # Start green text
echo -e "\nSuccessfully archlinux keyring attached....!!!!!\n"
echo -e ""
echo -e "\033[32m"  # Start green text
echo -e "================================================="

time sleep 3


# ==================================================================================
# [[ 2. CREATE-PARTITIONS ]]
# ==================================================================================
clear
echo -e "\033[32m"  # Start green text
echo "$createPartitions"


echo -e "\nCheck and configured Partiion....\n"
sudo cfdisk
clear
time sleep 3









# ==================================================================================
# [[ 3. USER-INPUT ]]
# ==================================================================================
clear
echo -e "\033[32m"  # Start green text
echo "$userInput"
echo -e ""


echo "Please enter EFI paritition: (example /dev/sda1 or /dev/nvme0n1p1)"
read EFI

echo "Please enter SWAP paritition: (example /dev/sda2)"
read SWAP

echo "Please enter Root(/) paritition: (example /dev/sda3)"
read ROOT

echo "Please enter your username"
read USER

echo "Please enter your password"
read PASSWORD


echo "Please enter your HostName"
read HostName

echo -e "\nSuccessfully Store user input....\n"
time sleep 3


clear



# ==================================================================================
# [[  4. FORMAT-PARTITIONS ]]
# ==================================================================================
# make filesystems
clear
echo -e "\033[32m"  # Start green text
echo "$formatPartitions"



echo -e "\nCreating Filesystems...\n"
echo -e "\nFormatting Desks\n"
mkfs.fat -F32 /dev/"${EFI}"
mkswap /dev/"${SWAP}"
swapon /dev/"${SWAP}"
mkfs.ext4 /dev/"${ROOT}"
echo -e "\nSuccessfully Formatted\n"
time sleep 3




# ==================================================================================
# [[ 5. MOUNT-FILE-SYSTEM ]]
# ==================================================================================
clear
echo -e "\033[32m"  # Start green text
echo "$installKernalBaseApp"


echo -e "\nstarted Mounting\n"
mount  /dev/"${ROOT}" /mnt
mkdir /boot/efi
mount  /dev/"${EFI}" /boot/efi
echo -e "\nSuccessfully Mounted\n"
time sleep 3

clear


# ==========================================================================
# [[ 6. INSTALL-KERNAL-BASE-PACKAGES ]]
# ==========================================================================
clear
echo -e "\033[32m"  # Start green text
echo "$installKernalBaseApp"

echo -e  ""
echo -e "Installing Base system into Linux kernal ..."

echo -e  ""
echo -e  ""
echo -e "Installing Arch Linux base..."

pacstrap -K /mnt base linux linux-firmware sudo nano

 echo -e "\033[32m"  # Start green text
echo "Installed successsfly  Base system into Linux kernal !!!!"
time sleep 3





# ==========================================================================
# [[ 7. STORING-MOUNT]]
# ==========================================================================
echo -e "\033[32m"  # Start green text
echo "$storingMount"


# Generate Mount
echo " Storring mount"
genfstab -U /mnt >> /mnt/etc/fstab
echo "Successfly storred all mount"
time sleep 3

clear


# ==========================================================================

# ==========================================================================
# [[ 8. ARCH-CHROOT ]]
# ==========================================================================
echo -e "\033[32m"  # Start green text
echo "$ArchChroot"




echo "copy arch-chroot scripts"
# curl https://raw.githubusercontent.com/xconfcode/scritp2/main/archControlPanel.sh -o /mnt/archControlPanel.sh && chmod +x  /mnt/archControlPanel.sh
echo
time sleep 3

# ============================================
# copy arch-chroot
# ============================================
clear
echo -e "\033[32m"  # Start green text
echo "$createChrootScript"





cat <<REALEND > /mnt/archControlPanel.sh

#!/usr/bin/env bash
clear


# ============================================
# copy arch-chroot
# ============================================

echo -e "\033[32m"  # Start green text
echo "$changeUserPermission"


echo "uncomment for profile wheels"
#
echo -e "\n changing Permission"

sudo sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers.tmp
echo -e "\nUncommented s/^# %wheel ALL=(ALL:ALL) successfully \n"
time sleep 5
echo -e "\nCheck if Uncommented s/^# %wheel ALL=(ALL:ALL) successfully \n"
time sleep 3
EDITOR=nano visudo






echo -e "\n Storred succefully\n"
time sleep 3
#pacman -Syy archlinux-keyring --needed --noconfirm

clear


# ==========================================================================
#  [[ 11. GENERATE-LANG-AND-TIME ]]
# ==========================================================================

# Time

clear
echo -e "\033[32m"  # Start green text
echo "$setDateAndTime"


echo -e "\nSetting Times...\n"
ln -sf /usr/share/zoneinfo/America/New_York   /etc/localtime
clear
echo -e "\nSuccessfly configure Times....\n"

time sleep 3
clear



echo -e "\033[32m"  # Start green text




sudo sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
sudo sed -i 's/^#en_US ISO-8859-1/en_US ISO-8859-1/' /etc/locale.gen
echo -e "\nSuccessfly Uncomment for locale-gen....\n"

time sleep 3
clear


echo -e "\033[32m"  # Start green text




locale-gen
hwclock --systohc
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo arch-pc > /etc/hostname
echo -e "\nSuccessfly Uncomment for locale-gen....\n"

time sleep 3
clear





# ==========================================================================
# [[ 12. CREATE-USER ]]
# ==========================================================================
clear
echo -e "\033[32m"  # Start green text
echo "$createUser"


echo -e "\nEnter root password"  # Newline with echo -e
passwd
echo -e "\nstart creating user...\n"
useradd -m -s /bin/bash "$USER"
echo "$USER:$PASSWORD" | chpasswd
usermod -aG wheel "$USER"
echo -e "\nSuccessfly user created...\n "




clear

# ==========================================================================
# [[ 13. HOST-CONFIG ]]
# ==========================================================================
clear
echo -e "\033[32m"  # Start green text
echo "$configHost"







echo -e "\nConfigure hostname...\n"
# Configure hostname and hosts file


echo "$HostName" > /etc/hostname
cat << EOF > /etc/hosts
127.0.0.1   localhost
::1     localhost
127.0.1.1   $HostName
EOF
echo -e "\nHostName successfully Configure...\n"


time sleep 3

clear


# ==========================================================================
# [[ 14. INSTALL-GRUB-AND-DEPENDANCY ]]
# ==========================================================================

echo -e "\033[32m"  # Start green text
echo "$installGrubAndDependancy"


#  Create boot dir and mount in it

echo -e "\nInstalling grub and dependencies...\n"
# pacman -S grub efibootmgr os-prober mtools networkmanager network-manager-applet wpa_supplicant dialog base-devel linux-headers  cups openssh blueman git intel-ucode nano vim neovim   --noconfirm
pacman -S grub efibootmgr os-prober mtools networkmanager    --noconfirm

echo -e "\nSuccessfly installed grub & dependancy....\n"

time sleep 3
clear


echo "Creating boot directory"
mkdir /boot/efi
mount  /dev/sda1 /boot/efi
echo "Successfly Mounted & created /boot/efi directory !!!!"
time sleep 3
clear



#  installing grub and dependency by pacman
echo "installing grub and dependancy"
time sleep 3


# ==========================================================================
#  [[ 15. INSTALL-GRUB-BOOTLOADER ]]
# ==========================================================================
clear


echo -e "\033[32m"  # Start green text
echo "$installGrubBootloader"





# Bootloader installation (UEFI systems)
echo -e "\n install by grub...\n"
grub-install --target=x86_64-efi --bootloader-id=grub_uefi

echo -e "\nggrub install bootloader !!!!....\n"

time sleep 3
clear



echo -e "\033[32m"  # Start green text






echo -e "\nget grub confinguration...\n"
grub-mkconfig -o /boot/grub/grub.cfg
echo -e "\ngrub take configuration !!!!....\n"

time sleep 3
clear






# ==========================================================================
#  [[ 15. INSTALL-GRAPHIC ]]
# ==========================================================================
clear


echo -e "\033[32m"  # Start green text
echo "$installGrubBootloader"


pacman -S nvidia nvidia-utils  xf86-video-intel --needed --noconfirm
echo -e "\ninstalled video driver !!!!....\n"

time sleep 3
clear

# ==========================================================================
# [[ 16. ENABLING-SYSTEMES ]]
# ==========================================================================
clear
echo -e "\033[32m"  # Start green text
echo "$EnablingSystemApps"

# Enable essential services
systemctl enable NetworkManager bluetooth cups sshd

clear
echo -e "\nenabled NetworkManager !!!!....\n"
echo -e "\nenabled bluetooth !!!!....\n"
echo -e "\nenabled cups !!!!....\n"
echo -e "\nenabled sshd !!!!....\n"

echo -e "\nAll system enabled !!!!....\n"
echo -e "\nInstallation complete. Reboot using 'reboot' !!!!....\n"
echo -e "\nDont forget typr umount -R /mnt.....!!!!....\n"

time sleep 3

EOF

REALEND

# =========================================
# END-CHROOT
# =========================================
# Chroot and execute configuration script
echo -e "\033[32m"  # Start green text
chmod +x  /mnt/archControlPanel.sh
echo -e "\narch-chroot scipt excuteded successfully !!!!....\n"
time sleep 3
arch-chroot /mnt /bin/bash /archControlPanel.sh
time sleep 3
