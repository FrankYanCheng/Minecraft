R=$/FTP # Minecraft Directory. Plz Modify this line before running. 先在这里修改你的MC目录，然后运行此脚本
 
M_OLDPWD=$OLDPWD
 
M_PWD=$PWD
 
LOGDIR=$DIR/srvlog
 
LOG=$LOGDIR/launcher.log
 
[[ -d "$LOGDIR" ]] || ( mkdir "$LOGDIR" ; echo "$(date)[Info]Created log directory.">>$LOG )
 
cd "$DIR"
 
echo "$(date)[Info]Launching.">>$LOG
 
MCSTAT=0
 
false
 
while [[ "$?" != "0" || -f "$DIR/restart.lck" ]]; do
 
    if [[ "$MCSTAT" == "0" ]]; then
 
        echo "$(date)[Info]Start server.">>$LOG
 
        MCSTAT=1
 
    elif [[ -f "$DIR/restart.lck" ]]; then
 
        echo "$(date)[Info]Restart server.">>$LOG
 
        sleep 2
 
    else
 
        echo "$(date)[Warn]Crashed. Restart server.">>$LOG
 
        sleep 10
 
    fi
 
    if [[ -f "$DIR/restart.lck" ]]; then
 
        rm "$DIR/restart.lck"
 
   fi
 
    # Commands here will execute before launch
 
java -Xms128M -Xmx512M -jar minecraft_server.jar nogui
done
echo "$(date)[Info]Exit.">>$LOG
 
cd "$M_PWD"
 
OLDPWD=$M_OLDPWD
 
~

