#!/bin/bash

file="/var/log/sincroniza.log"
destino="10.193.9.147"

echo "`date  +%x" "%X` SINCRONIZANDO DIRECTORIO /USR" >> $file
rsync -e ssh axvzKHS --delete    --exclude="local/sbin/sincroniza.sh"  /usr/ $destino:/usr/ >> $file

echo "`date  +%x" "%X` SINCRONIZANDO DIRECTORIO /ETC" >> $file
rsync -e ssh axvzKHS --delete  --exclude="modprobe*" --exclude="modules*" --exclude="ssh/*"  --exclude="ssh/" --exclude="fstab" --exclude="crontab"  --exclude="sysconfig/network/" --exclude="sysconfig/network/*" /etc/ $destino:/etc/ >> $file

echo "`date  +%x" "%X` SINCRONIZANDO DIRECTORIO /TMP" >> $file
rsync -e ssh axvzKHS --delete    /tmp/ $destino:/tmp/ >> $file

echo "`date  +%x" "%X` SINCRONIZANDO DIRECTORIO /BIN" >> $file
rsync -e ssh axvzKHS --delete    /bin/ $destino:/bin/ >> $file

echo "`date  +%x" "%X` SINCRONIZANDO DIRECTORIO /SBIN" >> $file
rsync -e ssh axvzKHS --delete    /sbin/ $destino:/sbin/ >> $file

echo "`date  +%x" "%X` SINCRONIZANDO DIRECTORIO /OPT" >> $file
rsync -e ssh axvzKHS --delete    /opt/ $destino:/opt/ >> $file

echo "`date  +%x" "%X` SINCRONIZANDO DIRECTORIO /MNT" >> $file
rsync -e ssh axvzKHS --delete    /mnt/ $destino:/mnt/ >> $file

echo "`date  +%x" "%X` SINCRONIZANDO DIRECTORIO /MISC" >> $file
rsync -e ssh axvzKHS --delete    /misc/ $destino:/misc/ >> $file

echo "`date  +%x" "%X` SINCRONIZANDO DIRECTORIO /HOME" >> $file
rsync -e ssh axvzKHS --delete    /home/ $destino:/home/ >> $file

echo "`date  +%x" "%X` SINCRONIZANDO DIRECTORIO /VAR" >> $file
rsync -e ssh axvzKHS --delete   --exclude="lock" --exclude="proc" /var/ $destino:/var/ >> $file

echo "`date  +%x" "%X` SINCRONIZANDO DIRECTORIO /INITRD" >> $file
rsync -e ssh axvzKHS --delete    /initrd/ $destino:/initrd/ >> $file

echo "`date  +%x" "%X` SINCRONIZANDO DIRECTORIO /LIB" >> $file
rsync -e ssh axvzKHS --delete   --exclude="modules" /lib/ $destino:/lib/ >> $file

echo "`date  +%x" "%X` SINCRONIZANDO DIRECTORIO /ROOT" >> $file
rsync -e ssh axvzKHS --delete    --exclude=".ssh/" --exclude=".ssh/*" /root/ $destino:/root/ >> $file

echo -ne "\n\n`date  +%x" "%X` \t SINCRONIZACION FINALIZADA!!!\n\n" >> $file

