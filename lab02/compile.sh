echo "---------start---------"
echo "---------array.c-------"
arm-linux-gnueabihf-gcc array.c sylib.c -S
echo "---------available.c---"
arm-linux-gnueabihf-gcc available.c sylib.c -S
echo "---------float.c-------"
arm-linux-gnueabihf-gcc float.c sylib.c -S
echo "---------function.c----"
arm-linux-gnueabihf-gcc function.c sylib.c -S
echo "---------if.c----------"
arm-linux-gnueabihf-gcc if.c sylib.c -S
echo "---------while.c-------"
arm-linux-gnueabihf-gcc while.c sylib.c -S
echo "---------end-----------"