    echo "-------start-asm-------"
    echo "---------array.s-------"
    arm-linux-gnueabihf-gcc try/array.s sylib.c -o try/array -static
    echo "---------available.s---"
    arm-linux-gnueabihf-gcc try/available.s sylib.c -o try/available -static
    echo "---------float.s-------"
    arm-linux-gnueabihf-gcc try/float.s sylib.c -o try/float -static
    echo "---------function.s----"
    arm-linux-gnueabihf-gcc try/function.s sylib.c -o try/function -static
    echo "---------if.s----------"
    arm-linux-gnueabihf-gcc try/if.s sylib.c -o try/if -static
    echo "---------while.s-------"
    arm-linux-gnueabihf-gcc try/while.s sylib.c -o try/while -static
    echo "-------end-asm---------"
    echo "-----------------------"
    echo "-------start-run-------"
    echo "---------array---------"
    try/array
    echo ""
    echo "---------available-----"
    try/available
    echo ""
    echo "---------float---------"
    try/float
    echo ""
    echo "---------function------"
    try/function
    echo ""
    echo "---------if------------"
    try/if
    echo ""
    echo "---------while---------"
    try/while
    echo ""
    echo "-------end-run---------"
