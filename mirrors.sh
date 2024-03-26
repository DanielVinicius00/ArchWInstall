pacman -Sy pacman-contrib

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup

awk '/^## Country Name$/{f=1; next}f==0{next}/^$/{exit}{print substr($0, 1);}' /etc/pacman.d/mirrorlist.backup

sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup

rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist