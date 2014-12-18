echo -e "\e[00;34m"
echo "------------------------------------------------------------------------------"
echo "         ____        _   _                     ___             _ _   "
echo "        |  _ \ _   _| |_| |__   ___  _ __     ( _ )       __ _(_) |_ "
echo "        | |_) | | | | __| '_ \ / _ \| '_ \    / _ \/\    / _\` | | __|"
echo "        |  __/| |_| | |_| | | | (_) | | | |  | (_>  <   | (_| | | |_ "
echo "        |_|    \__, |\__|_| |_|\___/|_| |_|   \___/\/    \__, |_|\__|"
echo "               |___/                                     |___/       "
echo ""
echo "      Please have patience while Pipulate is installed, along with its"
echo "          dependencies. When complete, visit http://localhost:8888"
echo ""
echo "-------------------------------------------------------------------------------"
echo -e "\e[1;37m"

# everything necessary to make it a development platform
tce-load -wi python > /dev/null
tce-load -wi python-distribute > /dev/null
tce-load -wi git > /dev/null
echo "easy_install flask..."
sudo easy_install flask > /dev/null 2>&1
echo "easy_install flask_wtf..."
sudo easy_install flask_wtf > /dev/null 2>&1
echo "easy_install gspread..."
sudo easy_install gspread > /dev/null 2>&1
cd /home/tc/
echo "clone https://github.com/miklevin/pipulate.git..."
git clone https://github.com/miklevin/pipulate.git > /dev/null

# Back up things installed with Python-distribute easy_install
echo "usr/local/lib/python2.7/site-packages/" >> /opt/.filetool.lst
head -n -1 /opt/bootsync.sh > /opt/bootsync2.sh
mv /opt/bootsync2.sh /opt/bootsync.sh
cd /home/tc/pipulate/
nohup python pipulate.py > /dev/null &
echo -e "cd /home/tc/pipulate/\nnohup python pipulate.py > /dev/null &\nsh /etc/rc.local" >> /opt/bootsync.sh
filetool.sh -b >> /dev/null
exit

