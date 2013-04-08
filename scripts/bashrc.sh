#.................!Umesh Pandey bashrc...............

RED='\e[1;31m'
NC='\e[0m'  
umask 077
#ulimit -c 0
stty erase '^H'
PS1='[\u@\H:> \w/] '

PATH=.:/usr/local/bin:/usr/j2se/bin:/usr/bin:/usr/ccs/bin:/usr/share/bin:/usr/share/man:/sbin:/usr/atria/bin:/usr/dt/bin:/usr/sbin:/usr/local/samba/bin:/usr/openwin/bin
export PATH
MANPATH=$MANPATH:/usr/share/man:/usr/atria/doc/man:/usr/man:/usr/local/man
export MANPATH
EDITOR=vi
export EDITOR
export MANPATH
HISTSIZE=100000
export  HISTSIZE
LD_LIBRARY_PATH=/usr/local/lib:/usr/lib
export LD_LIBRARY_PATH
alias c='clear'
alias rm='rm -i'
alias l='ls -l'
alias h='history'

#alias cd=doit
#doit()
#{
#  'cd' $1;
#   PS1="`uname -n`:$PWD% ";
#   if [ "$CLEARCASE_ROOT" ] ; then
#     PS1="[`basename $CLEARCASE_ROOT`] $PS1"
#   fi
#}

#cd $PWD

function ft()
{
  ftp sun1;
}  
function lo()
{
 rlogin -l ftest sun1 ;

} 
function vi()
{
  file=${@:-$file}
  vim   -g $file 2>/dev/null
} 
function dt()
{
 ls -l > /tmp/tmp$$
 
 awk ' /^d/  { printf "\n %s \n %s ",$9 , "|" } ' </tmp/tmp$$

 printf "\n" ;	   
}

function dirtree()
{
	find ${@:-.} -name \* -print 2> /dev/null |	sed "
				s,[^/]*/,|___,g
				s,.[^|]*|,	|,g
				s,^	,|	,"
}

function dtr()
{
 ls -lR > /tmp/tmp$$
 
 awk ' /^d/  { printf "\n   %s \n %s ",$9 , "|" }
       /^-/  { printf "\n     %s%s%s","|","--", $9 } ' < /tmp/tmp$$

 printf "\n" ;	   
}
function ct()
{
  /usr/atria/bin/cleartool ;
}

alias lspwd='stv' ;

stv()
{
 viewname=""
 cleartool setview  $viewname #2>/dev/null
}
#lspwd  
set -o notify
set -o noclobber
set -o ignoreeof
set - o nounset
function xtitle ()
{
    case $TERM in
        *term | rxvt)
            echo -n -e "\033]0;$*\007" ;;
        *)  ;;
    esac
}


function ii()   # get current host related info
{
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
#    echo -e "\n${RED}Memory stats :$NC " ; free
    my_ip 2>&- ;
    echo -e "\n${RED}Local IP Address :$NC" ; echo ${MY_IP:-"Not connected"}
 #   echo -e "\n${RED}ISP Address :$NC" ; echo ${MY_ISP:-"Not connected"}
    echo
}

function my_ip() # get IP adresses
{
    MY_IP=$(/usr/sbin/ifconfig hme0 | awk '/inet/ { print $2 } ' | sed -e s/addr://)
    MY_ISP=$(/usr/sbin/ifconfig hme0 | awk '/P-t-P/ { print $3 } ' | sed -e s/P-t-P://)
}

function fastprompt()
{
    unset PROMPT_COMMAND
    case $TERM in
        *term | rxvt )
            PS1="[\h] \W > \[\033]0;[\u@\h] \w\007\]" ;;
        *)
            PS1="[\h] \W > " ;;
    esac
}
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s mailwarn
shopt -s sourcepath
shopt -s histappend histreedit
shopt -s extglob

