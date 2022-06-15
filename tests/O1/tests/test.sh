#!/bin/bash

rougefonce='\e[0;31m'
vertfonce='\e[0;32m'
bleufonce='\e[0;33m'
neutre='\e[0;m'
jaune="\x1B[33m"
bleu="\x1B[34m"
majenta="\x1B[35m"
cyan="\x1B[36m"
blanc="\x1B[37m"

nb=0

print_perc() {
    SIZE1=$(stat -c%s ${1})
    SIZE2=$(stat -c%s ${2})
    PERC=$(bc <<< "scale=2; ($SIZE2 - $SIZE1)/$SIZE1 * 100")
    echo "with $PERC % compression"
}

make_test() {
    echo -ne "${1}" | ./mysh &> ../res_mysh
    if [ -d "moula" ]
    then
        rm -rf moula
    fi
    echo -ne "${1}" | tcsh &> ../res_tcsh
    sort ../res_mysh > ../res_mysh2
    sort ../res_tcsh > ../res_tcsh2
    Test=$(diff ../res_mysh2 ../res_tcsh2)
    if [ "$Test" = "" ]
            then
                echo -ne "${vertfonce}TEST ${nb} = ${neutre}"
                echo -n "[${1}]"
                echo -ne "${vertfonce} OK${neutre}\n"
            else
                echo -ne "${rougefonce}TEST ${nb} = ${neutre}"
                echo -n "[${1}]"
                echo -ne "${rougefonce} KO${neutre}\n"
            fi
    let 'nb=nb+1'
}

#make && make clean

echo -e "${bleufonce}1 - MINISHELL1${neutre}\n"
echo -e "${jaune}TEST BASIQUE\n"
make_test "cat main.c"
make_test "cat tests/tests.txt"
make_test "echo test"
make_test "ls nofile"
make_test "ls              -t"
make_test "ls"
make_test "\n"
make_test "../my_segfault"
make_test "ls"
make_test "azedc"
make_test "pwd"
make_test "ls -l"
make_test "./mysh"
make_test "chmod -x tests/ratio"
make_test " ls\t\t-l"
make_test "\t\tpwd\n \t\tcd\npwd"
make_test "  \tpwd\t \ncd\t    \n ls"
make_test "pwd\t\tcd      pwd\t\n"
make_test "ls -l"
make_test "./prog_with_divZero"
make_test "../directory"
make_test "./thbv"
make_test "\t\t            clear \,"
echo -e "${majenta}\nTEST SETENV ~ UNSETENV\n"
make_test "setenv patate"
make_test "setenv patate pat"
make_test "setenv patate\nunsetenv patate"
make_test "setenv coucou="
make_test "setenv hey_"
make_test "setenv DEBUG 1"
make_test "setenv DEBUG 2"
make_test "setenv eazeaez* àààà"
make_test "setenv ^aaaa ^^aaaa"
make_test "setenv HOME /"
make_test "setenv a b c d"
make_test "unsetenv DEBUG"
make_test "unsetenv pwd"
make_test "unsetenv PATH         \t"
make_test "unsetenv              |"
make_test "unsetenv PATH\n\t\t\t/\n"
make_test "unsetenv a b c d"
echo -e "${cyan}\nTEST CD\n"
make_test "cd ~/"
make_test "cd -"
make_test "cd -/~"
make_test "cd ppp"
make_test "cd\npwd"
make_test "cd/npwd"
make_test "cd zesdrfgthvf"
make_test "cd main.c"
make_test "cd include"
make_test "cd ../\n cd ../\n cd -\n"
make_test "cd ../       ls"
make_test "cat /etc/shadow"
make_test "cd aaa bbb ccc"
make_test "cd ~"
make_test "cd"
make_test "cd qsdqsdqsd"
make_test "cd /"
make_test "cd ../../../"
make_test "cd ../../../../../../../../../../../"
make_test "\t\t\tmkdir moula\t\t\nchmod 0 moula\t\t\t\ncd moula\t\t\t"
echo -e "${cyan}\nTEST ATYPIQUE\n"
make_test "/bin/ls"
make_test "/usr/bin/ls"
make_test "/usr/bin/svdojvnsd"
make_test "tests/ratio"
make_test "chmod +x tests/ratio"
make_test "tests/ratio"
make_test "include"
make_test "include/"
make_test "./include"   
make_test "/include"
make_test "list.c/"
make_test "list.c/include"
make_test "sudo ls"
make_test "exit 4n"
make_test "exit eeee"
make_test "exit"
echo -e "${cyan}\nTEST MINISHELL 2 | REDIRECTIONS\n"
make_test "ls -l > file.txt\n cat file.txt"
make_test "touch file.txt\nls -l > file.txt\ncat file.txt"
make_test "rm file.txt\ntouch file.txt\nls -l > file.txt\necho \"coucou les gens\" >> file.txt\ncat file.txt"
make_test "ls > > mdr"
make_test "echo \"salut\" < "
make_test "ls -l | cat -e"
make_test "ls -l | cat -e | cat -e"
make_test "ls -l | cat -e | cat -e > file.txt\ncat file.txt"
make_test "ls ||"
make_test "ls; echo ok"
make_test "ls; echo ok; echo ok"
make_test "unsetenv ls; setenv c; cd -"
make_test "/bin/ls; exit; cd -"
make_test "ls; echo ok; echo ok; | cat -e"
make_test ";;;;;;;echo ok; echo ok;"
make_test "ls > tester"
make_test "ls -l > tester\ncat tester"
make_test "ls;;;;;;echo $?;;;;ls;;;     regerge   ;;; \t\nrcho cc"
rm file.txt
rm tester mdr