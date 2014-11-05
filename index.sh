#Index for Kankotix_Guide
#References: 
#
# http://www.linuxquestions.org/questions/linux-newbie-8/formatting-find-output-817438/
# http://superuser.com/questions/236601/how-do-i-execute-multiple-commands-when-using-find
# http://www.cyberciti.biz/faq/linux-unix-bsd-xargs-construct-argument-lists-utility/

echo
echo "$0: Kanotix Guide contents index as of: $(date)"
echo
echo maintainer: frtorres
echo
find . -type f -name "*.txt" -printf '%32f-:' -exec head -1 {} \;

