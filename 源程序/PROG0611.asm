;PROG0611.ASM
.386
.model     	flat,stdcall
option       	casemap:none
includelib    	msvcrt.lib
printf       	PROTO C :dword,:vararg
SubProc      	PROTO stdcall :dword, :dword  	; SubProc位于其他模块中
public     	result                            	; 允许其他模块使用result
.data
szOutputFmtStr	byte  	'%d%d=%d', 0ah, 0 	; 输出结果
oprd1       	dword 	70                  	; 被减数        
oprd2       	dword   	40                  	; 减数
result       	dword   	?                   	; 差
.code
main     	proc     	C argc, argv
		invoke   	SubProc, oprd1, oprd2  	; 调用其他模块中的函数
      	invoke   	printf, offset szOutputFmtStr, \	; 输出结果
                     	oprd1, \
                      	oprd2, \
                      	result                 	; result由SubProc设置
        	ret
main   	endp
		end