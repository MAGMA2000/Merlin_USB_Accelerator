#!/bin/sh

###################################################################
######                USB Accelerator by Jack                ######
######                     Version 0.3.2                     ######
######                                                       ######
######     https://github.com/JackMerlin/USBAccelerator      ######
######                                                       ######
###################################################################

export PATH=/sbin:/bin:/usr/sbin:/usr/bin$PATH
VERSION='0.3.2'
SPATH='/jffs/scripts'
GITHUB_DIR='https://raw.githubusercontent.com/JackMerlin/USBAccelerator/master'
COLOR_WHITE='\033[0m'
COLOR_LIGHT_WHITE='\033[1;37m'
COLOR_GREEN='\033[0;32m'
COLOR_LIGHT_GREEN='\033[1;32m'

Select_language () {
User="1"
End_Message="1"
printf '\n___________________________________________________________________\n'
printf '請選擇語言\n'
printf 'Please choose a language.\n'
printf '\n'
printf ' %b1%b 中文%b\n' "$COLOR_LIGHT_GREEN" "$COLOR_LIGHT_WHITE" "$COLOR_WHITE"
printf ' %b2%b English%b\n' "$COLOR_LIGHT_GREEN" "$COLOR_LIGHT_WHITE" "$COLOR_WHITE"
printf '___________________________________________________________________\n'
printf '請輸入對應數字\n'
printf 'Please enter the number\n'
printf '\n'
read -r "menu0"
case "$menu0" in
	1)Welcome_message_zh
	;;
	2)Welcome_message
	;;
esac
}

Welcome_message_zh () {
Check_folder
while true; do
lang="zh"
printf '\n___________________________________________________________________\n'
printf '感謝你使用%bUSB加速器%bv%s，它可以顯著提升路由器SMB協議下的USB讀寫速度，\n' "$COLOR_GREEN" "$COLOR_WHITE" "$VERSION"
printf '根據測試，USB加速器提升效率高達百分之10~240。\n'
printf '在原始系統中一些參數被保守地鎖定在較低的值內，\n'
printf '因此加速器的原理其實是精確調教系統參數來釋放硬體應有的性能。\n' 
printf '___________________________________________________________________\n'
printf '%b注意：%b\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE"
printf '這是一個相當早期的腳本，它目前仍處在預覽階段，\n'
printf '所以，如果有任何問題請回饋給我。\n'
printf '\n'
printf '%b版權：%b\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE"
printf '(c)2019 USB加速器由Jack製作，使用GPLv3許可證發佈。\n'
printf '如果你尊重GPLv3許可證，你可以自由地使用它。\n'
printf '源碼在 https://github.com/JackMerlin/USBAccelerator\n'
printf '___________________________________________________________________\n'
if [ "$CheckEnable" = "0" ]; then
	printf '輸入 %b1%b 開啟%bUSB加速器\n' "$COLOR_LIGHT_GREEN" "$COLOR_LIGHT_WHITE" "$COLOR_WHITE"
fi
if [ "$CheckEnable" = "1" ]; then
	printf '輸入 %b2%b 關閉%bUSB加速器\n' "$COLOR_LIGHT_GREEN" "$COLOR_LIGHT_WHITE" "$COLOR_WHITE"
	printf '輸入 %b3%b 重裝%bUSB加速器（建議每次更新後重裝）\n' "$COLOR_LIGHT_GREEN" "$COLOR_LIGHT_WHITE" "$COLOR_WHITE"
fi
	printf '輸入 %b4%b 查看%b致謝名單\n' "$COLOR_LIGHT_GREEN" "$COLOR_LIGHT_WHITE" "$COLOR_WHITE"
	printf '輸入 %b9%b 卸載%bUSB加速器\n' "$COLOR_LIGHT_GREEN" "$COLOR_LIGHT_WHITE" "$COLOR_WHITE"
	printf '輸入 %be%b 退出安裝%bUSB加速器\n' "$COLOR_LIGHT_GREEN" "$COLOR_LIGHT_WHITE" "$COLOR_WHITE"
printf '___________________________________________________________________\n'
printf '請輸入對應內容\n'
printf '\n'
read -r "menu1"
case "$menu1" in
0)Error_344
break
;;
1)Select_firmware
break
;;
2)Disable
break
;;
3)Reinstall
break
;;
4)Thanks_list
break
;;
9)Validate_removal
break
;;
e)exit 0
;;
*)printf '\n請輸入正確內容。\n'
;;
esac
done
}

Welcome_message () {
Check_folder
while true; do
lang="en"
printf '\n___________________________________________________________________\n'
printf 'Welcome to use %bUSB Accelerator%b Version %s,\n' "$COLOR_GREEN" "$COLOR_WHITE" "$VERSION"
printf 'It can improve USB read and write performance when your router uses the SMB protocol.\n'
printf 'How does it work?\n'
printf 'Trust me, it does not have the magic, it just changes some settings to the best.\n' 
printf '___________________________________________________________________\n'
printf '%bWarning%b\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE"
printf 'Now it is a preview version, I mean maybe something not working for you,\n'
printf 'But, your feedback can make it be better, so let me hear your voice.\n'
printf '\n'
printf '%bCopyright%b\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE"
printf '(c)2019 USB Accelerator by Jack, Use the GPLv3 license.\n'
printf 'You can find the source code or feedback below\n'
printf 'https://github.com/JackMerlin/USBAccelerator\n'
printf '___________________________________________________________________\n'
if [ "$CheckEnable" = "0" ]; then
	printf 'Enter %b1%b to %bEnable%b USB Accelerator\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE" "$COLOR_LIGHT_WHITE" "$COLOR_WHITE"
fi
if [ "$CheckEnable" = "1" ]; then
	printf 'Enter %b2%b to %bDisable%b USB Accelerator\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE" "$COLOR_LIGHT_WHITE" "$COLOR_WHITE"
	printf 'Enter %b3%b to %bRe-install%b USB Accelerator\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE" "$COLOR_LIGHT_WHITE" "$COLOR_WHITE"
fi
	printf 'Enter %b4%b to %bShow%b thanks list\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE" "$COLOR_LIGHT_WHITE" "$COLOR_WHITE"
	printf 'Enter %b9%b to %bRemove%b USB Accelerator\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE" "$COLOR_LIGHT_WHITE" "$COLOR_WHITE"
	printf 'Enter %be%b to %bExit%b\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE" "$COLOR_LIGHT_WHITE" "$COLOR_WHITE"
printf '___________________________________________________________________\n'
printf 'Please enter\n'
printf '\n'
read -r "menu1"
case "$menu1" in
0)Error_344
break
;;
1)Select_firmware
break
;;
2)Disable
break
;;
3)Reinstall
break
;;
4)Thanks_list
break
;;
9)Validate_removal
break
;;
e)exit 0
;;
*)printf '\nPlease enter a valid option.\n'
;;
esac
done
}

Select_firmware () {
while true; do
if [ "$lang" = "zh" ]; then
printf '\n___________________________________________________________________\n'
printf '請選擇安裝模式\n'
printf '\n'
printf '輸入 %b1%b 使用%b梅林模式%b安裝（適用於原版Merlin和改版梅林固件的路由器）\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE" "$COLOR_LIGHT_WHITE" "$COLOR_WHITE"
printf '輸入 %b2%b 使用%b官方模式%b安裝（適用于華碩官方和華碩官改固件的路由器）\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE" "$COLOR_LIGHT_WHITE" "$COLOR_WHITE"
printf '輸入 %b3%b 返回上級功能表\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE"
printf '___________________________________________________________________\n'
printf '請輸入對應數字\n'
printf '\n'
read -r "menu2"
case "$menu2" in
1)Enable
break
;;
2)printf '此模式處於測試狀態，可能效果並不明顯。\n'
SFW_Enable
break
;;
3)Welcome_message_zh
break
;;
*)printf '\n請輸入正確內容。\n'
;;
esac
else
printf '\n___________________________________________________________________\n'
printf 'Does your router running %bAsuswrt-Merlin%b firmware?\n' "$COLOR_LIGHT_WHITE" "$COLOR_WHITE"
printf '\n'
printf '%by%b = Yes, it is true.\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE"
printf '%bn%b = No, this is asus stock firmware.\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE"
printf '%br%b = Return to the previous menu.\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE"
printf '___________________________________________________________________\n'
printf 'Please enter\n'
printf '\n'
read -r "menu2"
case "$menu2" in
y)Enable
break
;;
n)SFW_Enable
break
;;
r)Welcome_message
break
;;
*)printf '\nPlease enter a valid option.\n'
;;
esac
fi
done
}

Validate_removal () {
while true; do
if [ "$lang" = "zh" ]; then
printf '\n___________________________________________________________________\n'
printf '你確定卸載USB加速器嗎？\n'
printf '\n'
printf '輸入 %by%b 確定卸載\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE"
printf '輸入 %bn%b 不卸載\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE"
printf '___________________________________________________________________\n'
printf '請輸入對應字母\n'
printf '\n'
read -r "menu9"
case "$menu9" in
y)Remove
break
;;
n)Welcome_message_zh
break
;;
*)printf '\n請輸入正確內容。\n'
;;
esac
else
printf '\n___________________________________________________________________\n'
printf 'Are you sure to remove USB Accelerator?\n'
printf '\n'
printf '%by%b = Yes, I am sure\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE"
printf '%bn%b = Cancel\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE"
printf '___________________________________________________________________\n'
printf 'Please enter\n'
printf '\n'
read -r "menu9"
case "$menu9" in
y)Remove
break
;;
n)Welcome_message
break
;;
*)printf '\nPlease enter a valid option.\n'
;;
esac
fi
done
}

Thanks_list () {
Names='nyanmisaka, qiutian128, iphone8, pmc_griffon, tzh5278, samsul, 特納西特基歐, dbslsy, ricky1992, awee, Master, lesliesu255, zk0119, 全池潑灑, glk17, luoyulong, kimhai, xiaole51'
if [ "$lang" = "zh" ]; then
printf '\n___________________________________________________________________\n'
printf '%b特別感謝：%b\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE"
printf '（排名不分先後）\n'
printf 'SNBForums的Adamm發現的關鍵配置\n'
printf 'Koolshare對本專案的支持\n'
printf '52asus對本專案的支持\n'
printf '\n'
printf '%b沒有以下測試人員抽出寶貴時間去測試，就沒有這個腳本，感謝他們：%b\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE"
printf '（排名不分先後）\n'
printf '%s等人\n' "$Names"
printf '___________________________________________________________________\n'
printf '按任意鍵繼續\n'
read -r "menu5"
case "$menu5" in
	*)Welcome_message_zh
	;;
esac
else
printf '\n___________________________________________________________________\n'
printf '%bSpecial thanks%b\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE"
printf '(Names not listed in order)\n'
printf 'Adamm for SNBForums\n'
printf 'Koolshare for supports the project\n'
printf '52asus for supports the project\n'
printf '\n'
printf '%bThanks testers%b\n' "$COLOR_LIGHT_GREEN" "$COLOR_WHITE"
printf '(Names not listed in order)\n'
printf '%s and others.\n' "$Names"
printf '___________________________________________________________________\n'
printf 'Enter any key to continue\n'
read -r "menu5"
case "$menu5" in
	*)Welcome_message
	;;
esac
fi
}

Error_344 () {
#Easter egg
if [ "$lang" = "zh" ]; then
printf '\n___________________________________________________________________\n'
printf '你的路由器即將在5秒後爆炸，請享受這個煙火表演。\n'
printf '\n'
sleep 1
printf '  5\n'
sleep 1
printf '  4\n'
sleep 1
printf '  3\n'
sleep 5
printf '___________________________________________________________________\n'
printf '糟糕，代碼錯誤，引爆失敗，請向作者報告這個錯誤。\n'
printf '___________________________________________________________________\n'
printf '按任意鍵繼續\n'
read -r "menu5"
case "$menu5" in
	*)Welcome_message_zh
	;;
esac
else
printf '\n___________________________________________________________________\n'
printf 'Your router will be auto self-destruct, please enjoy a bricked router.\n'
printf '\n'
sleep 1
printf '  5\n'
sleep 1
printf '  4\n'
sleep 1
printf '  3\n'
sleep 5
printf '___________________________________________________________________\n'
printf 'Error, please feedback this error code 344 to developers,\n'
printf 'We will fix this error in the future.\n'
printf '___________________________________________________________________\n'
printf 'Enter any key to continue\n'
read -r "menu5"
case "$menu5" in
	*)Welcome_message
	;;
esac
fi
}

Check_folder () {
if [ -d "$SPATH" ]; then
	Download_files
else
	mkdir $SPATH 2>/dev/null
	chmod 755 $SPATH 2>/dev/null
	Download_files
fi
}

Download_files () {
if [ -f "$SPATH/usbstatus.png" ]; then
iconlocalmd5="$(md5sum "$SPATH/usbstatus.png" | awk '{print $1}')"
iconremotemd5="$(wget -q -c -T 30 --no-check-certificate "$GITHUB_DIR/usbstatus.png" -O /tmp/usbstatus.check && md5sum /tmp/usbstatus.check | awk '{print $1}')"
	if [ "$iconlocalmd5" != "$iconremotemd5" ]; then
		mv -f /tmp/usbstatus.check $SPATH/usbstatus.png 2>/dev/null && chmod 644 $SPATH/usbstatus.png 2>/dev/null
	else
		rm -f /tmp/usbstatus.check 2>/dev/null
	fi
else
	wget -q -c -T 30 --no-check-certificate "$GITHUB_DIR/usbstatus.png" -O "$SPATH/usbstatus.png" && chmod 644 $SPATH/usbstatus.png
fi

if [ -f "$SPATH/usbaccelerator.sh" ]; then
localmd5="$(md5sum "$SPATH/usbaccelerator.sh" | awk '{print $1}')"
remotemd5="$(wget -q -c -T 30 --no-check-certificate "$GITHUB_DIR/usbaccelerator.sh" -O /tmp/usbaccelerator.check && md5sum /tmp/usbaccelerator.check | awk '{print $1}')"
	if [ "$localmd5" != "$remotemd5" ]; then
		mv -f /tmp/usbaccelerator.check $SPATH/usbaccelerator.sh 2>/dev/null && chmod 755 $SPATH/usbaccelerator.sh 2>/dev/null
	else
		rm -f /tmp/usbaccelerator.check 2>/dev/null
	fi
else
	wget -q -c -T 30 --no-check-certificate "$GITHUB_DIR/usbaccelerator.sh" -O "$SPATH/usbaccelerator.sh" && chmod 755 $SPATH/usbaccelerator.sh
fi
}

Check_usbmode () {
USB3="$(nvram show 2>/dev/null | grep 'usb_usb3' | wc -l)"
if [ "$USB3" = "1" ]; then
	if [ "$(nvram show 2>/dev/null | grep 'usb_usb3=1')" != "usb_usb3=1" ]; then
		nvram set usb_usb3="1"
		nvram commit
		USBON="1"
			if [ "$lang" = "zh" ]; then
				printf '\n已經為你開啟USB 3.0。\n'
			fi
			if [ "$lang" = "en" ]; then
				printf '\nUSB Accelerator has enabled USB 3.0 mode for you.\n'
			fi
	fi
else
	if [ "$lang" = "zh" ]; then
		printf '\n你的路由器好像沒有USB 3.0介面。\n'
	fi
	if [ "$lang" = "en" ]; then
		printf '\nError, USB 3.0 port not found.\n'
	fi
fi
}

Umount_message () {
if [ "$(df -h | grep -c 'mnt')" -ge "1" ]; then
	if [ "$lang" = "zh" ]; then
		echo "___________________________________________________________________"
		printf '安裝完成前請不要讀寫USB。\n'
		echo "___________________________________________________________________"
	fi
	if [ "$lang" = "en" ]; then
		echo "___________________________________________________________________"
		printf 'For data security, do not read or write any data to \n'
		printf 'Router USB devices before the installation is done.\n'
		echo "___________________________________________________________________"
	fi
	
fi
}

Enable () {
Check_usbmode
if [ -f "$SPATH/smb.postconf" ]; then
	cp -f $SPATH/smb.postconf $SPATH/smb.postconf.old
fi
echo '#!/bin/sh' > $SPATH/smb.postconf
echo "#USB_Accelerator_v$VERSION" >> $SPATH/smb.postconf
echo 'CONFIG="$1"' >> $SPATH/smb.postconf
echo 'sed -i "\\~socket options~d" "$CONFIG"' >> $SPATH/smb.postconf
echo 'echo "strict locking = no" >> "$CONFIG"' >> $SPATH/smb.postconf
echo "echo '#USB_Accelerator_v$VERSION' >> /etc/smb.conf" >> $SPATH/smb.postconf
if [ "$lang" = "zh" ]; then
	echo "$SPATH/usbaccelerator.sh -DLZ" >> $SPATH/smb.postconf
else
	echo "$SPATH/usbaccelerator.sh -DL" >> $SPATH/smb.postconf
fi
echo 'sleep 10' >> $SPATH/smb.postconf
echo "$SPATH/usbaccelerator.sh -Check"  >> $SPATH/smb.postconf
chmod 755 $SPATH/smb.postconf
service restart_nasapps >/dev/null 2>&1

if [ "$End_Message" = "1" ]; then
End_Message
fi
}

SFW_Enable () {
if [ "$User" = "1" ]; then
	Umount_message
	Check_usbmode
	echo '#!/bin/sh' > $SPATH/sfsmb
	echo "#USB_Accelerator_v$VERSION" >> $SPATH/sfsmb
	echo 'sleep 5' >> $SPATH/sfsmb
	echo "$SPATH/usbaccelerator.sh -SFW" >> $SPATH/sfsmb
	if [ "$lang" = "zh" ]; then
		echo "$SPATH/usbaccelerator.sh -DLZ" >> $SPATH/sfsmb
	else
		echo "$SPATH/usbaccelerator.sh -DL" >> $SPATH/sfsmb
	fi
	echo 'sleep 10' >> $SPATH/sfsmb
	echo "$SPATH/usbaccelerator.sh -Check"  >> $SPATH/sfsmb
	chmod 755 $SPATH/sfsmb
	if [ -f "/jffs/post-mount" ]; then
		if [ "$(grep 'sfsmb' /jffs/post-mount 2>/dev/null | wc -l)" = "0" ]; then
			echo "$SPATH/sfsmb" >> /jffs/post-mount
		fi
	else
		echo '#!/bin/sh' > /jffs/post-mount
		echo "$SPATH/sfsmb" >> /jffs/post-mount
		chmod 755 /jffs/post-mount
	fi
	nvram set script_usbmount="/jffs/post-mount"
	nvram commit
fi

if [ "$(grep USB_Accelerator /etc/smb.conf 2>/dev/null | wc -l)" = "0" ]; then	
	if [ "$(ps -w | grep smbd | grep -v grep | wc -l)" -ge "1" ]; then
		while [ "$(ps -w | grep smbd | grep -v grep | wc -l)" -ge "1" ]; do
			kill $(ps -w | grep smbd | grep -v grep | head -n 1 | awk '{print $1}') 2>/dev/null
			kill $(ps -w | grep nmbd | grep -v grep | head -n 1 | awk '{print $1}') 2>/dev/null
		done
		sleep 1
		sed -i "\\~socket options~d" /etc/smb.conf
		echo "strict locking = no" >> /etc/smb.conf
		echo "#USB_Accelerator_v$VERSION" >> /etc/smb.conf
		nmbd -D -s /etc/smb.conf 2>/dev/null
		/usr/sbin/smbd -D -s /etc/smb.conf 2>/dev/null
	fi
fi

if [ "$End_Message" = "1" ]; then
End_Message
fi

if [ "$User" = "1" ]; then
	if [ "$lang" = "zh" ]; then
		Enable_logs_zh
	else
		Enable_logs
	fi
fi
}

Enable_logs_zh () {
logger -t "USB加速器" "USB加速器$(grep USB_Accelerator /etc/smb.conf | awk -F 'v' '{print $2}')已經啟動，代碼$(grep 'strict locking' /etc/smb.conf 2>/dev/null | wc -l)$(grep 'socket options' /etc/smb.conf 2>/dev/null | wc -l)。"
if [ "$(df -h | grep -c 'usbstatus.png')" = "0" ]; then
mount --bind $SPATH/usbstatus.png /www/images/New_ui/usbstatus.png
fi
}

Enable_logs () {
logger -t "USB Accelerator" "USB Accelerator$(grep USB_Accelerator /etc/smb.conf | awk -F 'v' '{print $2}') has started, code $(grep 'strict locking' /etc/smb.conf 2>/dev/null | wc -l)$(grep 'socket options' /etc/smb.conf 2>/dev/null | wc -l)."
if [ "$(df -h | grep -c 'usbstatus.png')" = "0" ]; then
mount --bind $SPATH/usbstatus.png /www/images/New_ui/usbstatus.png
fi
}

End_Message () {
printf '\n___________________________________________________________________\n'
if [ "$lang" = "zh" ]; then
	printf '已經開啟USB加速器！\n'
		if [ "$USBON" = "1" ]; then
			printf '你可能需要重新開機才能達到最佳速度。\n'
		fi
	printf '如果你需要管理USB加速器，則在SSH中輸入下方代碼\n'
else
	printf 'USB Accelerator is enabled!\n'
		if [ "$USBON" = "1" ]; then
			printf 'For get the best speed, you may need to reboot the router.\n'
		fi
	printf 'If you want to set USB Accelerator, Please enter the code below\n'
fi
printf '%b%s/usbaccelerator.sh%b\n' "$COLOR_LIGHT_WHITE" "$SPATH" "$COLOR_WHITE"
printf '___________________________________________________________________\n'
}

Disable () {
rm -f $SPATH/sfsmb 2>/dev/null
sed -i "\\~sfsmb~d" /jffs/post-mount 2>/dev/null
rm -f $SPATH/smb.postconf 2>/dev/null
#nvram set script_usbmount=""
#nvram commit
service restart_nasapps >/dev/null 2>&1
umount -f /www/images/New_ui/usbstatus.png 2>/dev/null
printf '\n___________________________________________________________________\n'
if [ "$lang" = "zh" ]; then
	printf 'USB加速器已經關閉，如果未來需要再次開啟，則在SSH裡輸入下方代碼：\n'
else
	printf 'USB Accelerator has been disabled, Enter the code below to enable it again\n'
fi
printf '%b%s/usbaccelerator.sh%b\n' "$COLOR_LIGHT_WHITE" "$SPATH" "$COLOR_WHITE"
printf '___________________________________________________________________\n'
}

Reinstall () {
umount -f /www/images/New_ui/usbstatus.png 2>/dev/null
rm -f $SPATH/sfsmb 2>/dev/null
sed -i "\\~sfsmb~d" /jffs/post-mount 2>/dev/null
rm -f $SPATH/smb.postconf 2>/dev/null
rm -f $SPATH/usbstatus.png 2>/dev/null
rm -f $SPATH/usbaccelerator.sh 2>/dev/null
#nvram set script_usbmount=""
#nvram commit
service restart_nasapps >/dev/null 2>&1
Download_files
if [ "$lang" = "zh" ]; then
	printf '\nUSB加速器已經重新安裝。\n'
else
	printf '\nUSB Accelerator has been re-install now.\n'
fi
$SPATH/usbaccelerator.sh
}

Remove () {
umount -f /www/images/New_ui/usbstatus.png 2>/dev/null
rm -f $SPATH/sfsmb 2>/dev/null
sed -i "\\~sfsmb~d" /jffs/post-mount 2>/dev/null
rm -f $SPATH/smb.postconf 2>/dev/null
rm -f $SPATH/usbstatus.png 2>/dev/null
#nvram set script_usbmount=""
#nvram commit
service restart_nasapps >/dev/null 2>&1
if [ "$lang" = "zh" ]; then
	printf '\nUSB加速器已經完全卸載，所有的一切都恢復到了安裝前的狀態。\n'
else
	printf '\nUSB Accelerator has been removed and everything changes before is restored to the default value.\n'
fi
rm -f $SPATH/usbaccelerator.sh 2>/dev/null
}

CheckEnable="0"
if [ -f "$SPATH/smb.postconf" ]; then
	if [ "$(grep USB_Accelerator_v$VERSION $SPATH/smb.postconf 2>/dev/null | wc -l)" = "0" ]; then
		Check_folder
		Enable
		CheckEnable="1"
	else
		CheckEnable="1"
	fi
fi

if [ -f "$SPATH/sfsmb" ]; then
	if [ "$(grep USB_Accelerator_v$VERSION $SPATH/sfsmb 2>/dev/null | wc -l)" = "0" ]; then
		Check_folder
		User="1"
		SFW_Enable
		CheckEnable="1"
	else
		CheckEnable="1"
	fi
fi

clear
case "$1" in
-SFW)SFW_Enable
;;
-Check)Download_files
;;
-DLZ)Enable_logs_zh
;;
-DL)Enable_logs
;;
*)Select_language
esac

