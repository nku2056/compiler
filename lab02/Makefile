PHONY:
	assemble, run
assemble:
	@echo "-------start-asm-------"
	@echo "---------array.s-------"
	arm-linux-gnueabihf-gcc try/array.s sylib.c -o try/array -static
	@echo "---------available.s---"
	arm-linux-gnueabihf-gcc try/available.s sylib.c -o try/available -static
	@echo "---------float.s-------"
	arm-linux-gnueabihf-gcc try/float.s sylib.c -o try/float -static
	@echo "---------function.s----"
	arm-linux-gnueabihf-gcc try/function.s sylib.c -o try/function -static
	@echo "---------if.s----------"
	arm-linux-gnueabihf-gcc try/if.s sylib.c -o try/if -static
	@echo "---------while.s-------"
	arm-linux-gnueabihf-gcc try/while.s sylib.c -o try/while -static
	@echo "---------frac.s--------"
	arm-linux-gnueabihf-gcc try/frac.s sylib.c -o try/frac -static
	@echo "-------end-asm---------"	
run:
	@echo "-------start-run-------"
	@echo "---------array---------"
	@echo "---------available-----"
	qemu-arm try/available
	@echo "---------float---------"
	qemu-arm try/float
	@echo "---------function------"
	qemu-arm try/function
	@echo "---------if------------"
	qemu-arm try/if
	@echo "---------while---------"
	qemu-arm try/while
	@echo "---------frac----------"
	qemu-arm try/frac
	@echo "-------end-run---------"