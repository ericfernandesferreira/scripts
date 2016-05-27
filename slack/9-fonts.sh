# Script que instala as fontes Droid Sans e Ubuntu e Cantarell
cd /home/backup/fonts/Arial
cp * /usr/share/fonts/TTF/

cd /home/backup/fonts/Cantarell
cp * /usr/share/fonts/TTF/

cd /home/backup/fonts/Droid_Sans
cp * /usr/share/fonts/TTF/

cd /home/backup/fonts/Roboto
cp * /usr/share/fonts/TTF/

cd /home/backup/fonts/Times
cp * /usr/share/fonts/TTF/

cd /home/backup/fonts/Ubuntu
cp * /usr/share/fonts/TTF/

fc-cache -fv
