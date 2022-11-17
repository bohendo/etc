
nix-shell -p wget zstd

wget https://hydra.nixos.org/build/197954899/download/1/nixos-sd-image-22.11pre424902.09326850228-aarch64-linux.img.zst

unzstd -d nixos-sd-image-22.11pre424902.09326850228-aarch64-linux.img.zst

echo "run 'dmesg --follow' and watch server logs while plugging the sd card in to idenify X in /dev/sdX"

echo "run 'sudo dd if=nixos-sd-image-22.05pre335501.c71f061c68b-aarch64-linux.img of=/dev/sdX bs=4096 conv=fsync status=progress' to copy the iso image to your sd card"
