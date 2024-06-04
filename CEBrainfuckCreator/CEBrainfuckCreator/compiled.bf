timeout:1000
>>>>>>>>>>>>>>>>>>>>>  ;;; Reserve bf compiler memory space+[
;;💩commentcode
;; Instruction diff: 1    next: 2     counter: 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		<<<<<<<<<<<
;;	Move pointer from @💩11 (real: 10) to cebf_compiler_10@💩11 (real: 10; compiler)

+>>]<<
;;💩seperatestatemachine
;; Instruction diff: 1    next: 3     counter: 2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @💩11 (real: 10) to cebf_compiler_10@💩11 (real: 10; compiler)

+>>]<<
;;sad 0 pointer
;; Instruction diff: 1    next: 4     counter: 3
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		;; Assigned memory address pointer@0 (real: 21) the name 'pointer'
;;	Move pointer from @💩11 (real: 10) to cebf_compiler_10@💩11 (real: 10; compiler)

+>>]<<
;;sad 1 a
;; Instruction diff: 1    next: 5     counter: 4
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		;; Assigned memory address a@2 (real: 23) the name 'a'
;;	Move pointer from @💩11 (real: 10) to cebf_compiler_10@💩11 (real: 10; compiler)

+>>]<<
;;sad 3 value
;; Instruction diff: 1    next: 6     counter: 5
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		;; Assigned memory address value@6 (real: 27) the name 'value'
;;	Move pointer from @💩11 (real: 10) to cebf_compiler_10@💩11 (real: 10; compiler)

+>>]<<
;;set💩s $value abcd
;; Instruction diff: 1    next: 7     counter: 6
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @💩11 (real: 10) to @6 (real: 27)
>>>>>>>>>>>>>>>>>
;;	Set address value to 97
[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Move pointer from @6 (real: 27) to @8 (real: 29)
>>
;;	Set address value to 98
[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Move pointer from @8 (real: 29) to @10 (real: 31)
>>
;;	Set address value to 99
[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Move pointer from @10 (real: 31) to @12 (real: 33)
>>
;;	Set address value to 100
[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Move pointer from @12 (real: 33) to @14 (real: 35)
>>
;;	Set address value to 0
[-]
;;	Move pointer from @14 (real: 35) to cebf_compiler_10@💩11 (real: 10; compiler)
<<<<<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;set💩n $a 1
;; Instruction diff: 1    next: 8     counter: 7
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @💩11 (real: 10) to @2 (real: 23)
>>>>>>>>>>>>>
;;	Set address value to 1
[-]+
;;	Move pointer from @2 (real: 23) to cebf_compiler_10@💩11 (real: 10; compiler)
<<<<<<<<<<<<<
+>>]<<
;;set💩a $pointer $value
;; Instruction diff: 1    next: 9     counter: 8
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @💩11 (real: 10) to @0 (real: 21)
>>>>>>>>>>>
;;	Set address value to 3
[-]+++
;;	Move pointer from @0 (real: 21) to cebf_compiler_10@💩11 (real: 10; compiler)
<<<<<<<<<<<
+>>]<<
;;:loop
;; Instruction diff: 1    next: 10     counter: 9
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @💩11 (real: 10) to cebf_compiler_10@💩11 (real: 10; compiler)

+>>]<<
;;out💩r *$pointer
;; Instruction diff: 1    next: 11     counter: 10
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @💩11 (real: 10) to @*0 (real: 21)
;;		Copying from @0 (real: 21) to cebf_compiler_20@💩1 (real: 20; compiler)
;;				Move pointer from @💩11 (real: 10) to cebf_compiler_20@💩1 (real: 20; compiler)
>>>>>>>>>>
;;			Set address value to 0
[-]
;;					Move pointer from @💩1 (real: 20) to cebf_compiler_15@15 (real: 36; compiler)
>>>>>>>>>>>>>>>>
;;				Set address value to 0
[-]
;;				Move pointer from @15 (real: 36) to @0 (real: 21)
<<<<<<<<<<<<<<<
;;			Move value from address @0 (real: 21) into cebf_compiler_15@15 (real: 36; compiler)
[-
;;				Move pointer from @0 (real: 21) to cebf_compiler_15@15 (real: 36; compiler)
>>>>>>>>>>>>>>>+
;;				Move pointer from @15 (real: 36) to @0 (real: 21)
<<<<<<<<<<<<<<<]
;;			Move pointer from @0 (real: 21) to cebf_compiler_15@15 (real: 36; compiler)
>>>>>>>>>>>>>>>
;;		Multi💩move value from address cebf_compiler_15@15 (real: 36; compiler) into @0 (real: 21) and cebf_compiler_20@💩1 (real: 20; compiler)
[-
;;			Move pointer from @15 (real: 36) to @0 (real: 21)
<<<<<<<<<<<<<<<+
;;			Move pointer from @0 (real: 21) to cebf_compiler_20@💩1 (real: 20; compiler)
<+
;;			Move pointer from @💩1 (real: 20) to cebf_compiler_15@15 (real: 36; compiler)
>>>>>>>>>>>>>>>>]
;;		Move pointer from @15 (real: 36) to cebf_compiler_20@💩1 (real: 20; compiler)
<<<<<<<<<<<<<<<<
;;	Follow pointer and leaving a trace
[>>[-]<<[>>+<<-]+>>-]+>.
;;tracing back from pointer
<[-<<]>>
;;	Move pointer from @💩1 (real: 20) to cebf_compiler_10@💩11 (real: 10; compiler)
<<<<<<<<<<
+>>]<<
;;inc $pointer
;; Instruction diff: 1    next: 12     counter: 11
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @💩11 (real: 10) to @0 (real: 21)
>>>>>>>>>>>+
;;	Move pointer from @0 (real: 21) to cebf_compiler_10@💩11 (real: 10; compiler)
<<<<<<<<<<<
+>>]<<
;;jmp💩nz *$pointer loop
;; Instruction diff: 10    next: 9     counter: 12
;; Instruction diff: 1    next: 13     counter: 12
;; Instruction diff: 0    next: 12     counter: 12
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Doing if for @*0 (real: 21)
;;		Copying from @*0 (real: 21) to cebf_compiler_13@💩8 (real: 13; compiler)
;;				Move pointer from @💩11 (real: 10) to cebf_compiler_13@💩8 (real: 13; compiler)
>>>
;;			Set address value to 0
[-]
;;					Move pointer from @💩8 (real: 13) to cebf_compiler_15@15 (real: 36; compiler)
>>>>>>>>>>>>>>>>>>>>>>>
;;				Set address value to 0
[-]
;;				Move pointer from @15 (real: 36) to @*0 (real: 21)
;;					Copying from @0 (real: 21) to cebf_compiler_20@💩1 (real: 20; compiler)
;;							Move pointer from @15 (real: 36) to cebf_compiler_20@💩1 (real: 20; compiler)
<<<<<<<<<<<<<<<<
;;						Set address value to 0
[-]
;;								Move pointer from @💩1 (real: 20) to cebf_compiler_15@15 (real: 36; compiler)
>>>>>>>>>>>>>>>>
;;							Set address value to 0
[-]
;;							Move pointer from @15 (real: 36) to @0 (real: 21)
<<<<<<<<<<<<<<<
;;						Move value from address @0 (real: 21) into cebf_compiler_15@15 (real: 36; compiler)
[-
;;							Move pointer from @0 (real: 21) to cebf_compiler_15@15 (real: 36; compiler)
>>>>>>>>>>>>>>>+
;;							Move pointer from @15 (real: 36) to @0 (real: 21)
<<<<<<<<<<<<<<<]
;;						Move pointer from @0 (real: 21) to cebf_compiler_15@15 (real: 36; compiler)
>>>>>>>>>>>>>>>
;;					Multi💩move value from address cebf_compiler_15@15 (real: 36; compiler) into @0 (real: 21) and cebf_compiler_20@💩1 (real: 20; compiler)
[-
;;						Move pointer from @15 (real: 36) to @0 (real: 21)
<<<<<<<<<<<<<<<+
;;						Move pointer from @0 (real: 21) to cebf_compiler_20@💩1 (real: 20; compiler)
<+
;;						Move pointer from @💩1 (real: 20) to cebf_compiler_15@15 (real: 36; compiler)
>>>>>>>>>>>>>>>>]
;;					Move pointer from @15 (real: 36) to cebf_compiler_20@💩1 (real: 20; compiler)
<<<<<<<<<<<<<<<<
;;				Follow pointer and leaving a trace
[>>[-]<<[>>+<<-]+>>-]+>
;;			Move value from address @*0 (real: 21) into cebf_compiler_15@15 (real: 36; compiler)
[-
;;			tracing back from pointer
<[-<<]>>
;;				Move pointer from @💩1 (real: 20) to cebf_compiler_15@15 (real: 36; compiler)
>>>>>>>>>>>>>>>>+
;;				Move pointer from @15 (real: 36) to @*0 (real: 21)
;;					Copying from @0 (real: 21) to cebf_compiler_20@💩1 (real: 20; compiler)
;;							Move pointer from @15 (real: 36) to cebf_compiler_20@💩1 (real: 20; compiler)
<<<<<<<<<<<<<<<<
;;						Set address value to 0
[-]
;;								Move pointer from @💩1 (real: 20) to cebf_compiler_15@15 (real: 36; compiler)
>>>>>>>>>>>>>>>>
;;							Set address value to 0
[-]
;;							Move pointer from @15 (real: 36) to @0 (real: 21)
<<<<<<<<<<<<<<<
;;						Move value from address @0 (real: 21) into cebf_compiler_15@15 (real: 36; compiler)
[-
;;							Move pointer from @0 (real: 21) to cebf_compiler_15@15 (real: 36; compiler)
>>>>>>>>>>>>>>>+
;;							Move pointer from @15 (real: 36) to @0 (real: 21)
<<<<<<<<<<<<<<<]
;;						Move pointer from @0 (real: 21) to cebf_compiler_15@15 (real: 36; compiler)
>>>>>>>>>>>>>>>
;;					Multi💩move value from address cebf_compiler_15@15 (real: 36; compiler) into @0 (real: 21) and cebf_compiler_20@💩1 (real: 20; compiler)
[-
;;						Move pointer from @15 (real: 36) to @0 (real: 21)
<<<<<<<<<<<<<<<+
;;						Move pointer from @0 (real: 21) to cebf_compiler_20@💩1 (real: 20; compiler)
<+
;;						Move pointer from @💩1 (real: 20) to cebf_compiler_15@15 (real: 36; compiler)
>>>>>>>>>>>>>>>>]
;;					Move pointer from @15 (real: 36) to cebf_compiler_20@💩1 (real: 20; compiler)
<<<<<<<<<<<<<<<<
;;				Follow pointer and leaving a trace
[>>[-]<<[>>+<<-]+>>-]+>]
;;			tracing back from pointer
<[-<<]>>
;;			Move pointer from @💩1 (real: 20) to cebf_compiler_15@15 (real: 36; compiler)
>>>>>>>>>>>>>>>>
;;		Multi💩move value from address cebf_compiler_15@15 (real: 36; compiler) into @*0 (real: 21) and cebf_compiler_13@💩8 (real: 13; compiler)
[-
;;			Move pointer from @15 (real: 36) to @*0 (real: 21)
;;				Copying from @0 (real: 21) to cebf_compiler_20@💩1 (real: 20; compiler)
;;						Move pointer from @15 (real: 36) to cebf_compiler_20@💩1 (real: 20; compiler)
<<<<<<<<<<<<<<<<
;;					Set address value to 0
[-]
;;							Move pointer from @💩1 (real: 20) to cebf_compiler_15@15 (real: 36; compiler)
>>>>>>>>>>>>>>>>
;;						Set address value to 0
[-]
;;						Move pointer from @15 (real: 36) to @0 (real: 21)
<<<<<<<<<<<<<<<
;;					Move value from address @0 (real: 21) into cebf_compiler_15@15 (real: 36; compiler)
[-
;;						Move pointer from @0 (real: 21) to cebf_compiler_15@15 (real: 36; compiler)
>>>>>>>>>>>>>>>+
;;						Move pointer from @15 (real: 36) to @0 (real: 21)
<<<<<<<<<<<<<<<]
;;					Move pointer from @0 (real: 21) to cebf_compiler_15@15 (real: 36; compiler)
>>>>>>>>>>>>>>>
;;				Multi💩move value from address cebf_compiler_15@15 (real: 36; compiler) into @0 (real: 21) and cebf_compiler_20@💩1 (real: 20; compiler)
[-
;;					Move pointer from @15 (real: 36) to @0 (real: 21)
<<<<<<<<<<<<<<<+
;;					Move pointer from @0 (real: 21) to cebf_compiler_20@💩1 (real: 20; compiler)
<+
;;					Move pointer from @💩1 (real: 20) to cebf_compiler_15@15 (real: 36; compiler)
>>>>>>>>>>>>>>>>]
;;				Move pointer from @15 (real: 36) to cebf_compiler_20@💩1 (real: 20; compiler)
<<<<<<<<<<<<<<<<
;;			Follow pointer and leaving a trace
[>>[-]<<[>>+<<-]+>>-]+>+
;;		tracing back from pointer
<[-<<]>>
;;			Move pointer from @💩1 (real: 20) to cebf_compiler_13@💩8 (real: 13; compiler)
<<<<<<<+
;;			Move pointer from @💩8 (real: 13) to cebf_compiler_15@15 (real: 36; compiler)
>>>>>>>>>>>>>>>>>>>>>>>]#
;;		Move pointer from @15 (real: 36) to cebf_compiler_14@💩7 (real: 14; compiler)
<<<<<<<<<<<<<<<<<<<<<<
;;		Set address value to 1
[-]+
;;		Move pointer from @💩7 (real: 14) to cebf_compiler_13@💩8 (real: 13; compiler)
<[[-]>[-]
;;		Move pointer from cebf_compiler_14@💩7 (real: 14; compiler) to @💩11 (real: 10)
<<<<++++++++++
;;		Move pointer from cebf_compiler_14@💩11 (real: 10; compiler) to cebf_compiler_14@💩7 (real: 14; compiler)
>>>]>[[-]
;;		Move pointer from cebf_compiler_14@💩7 (real: 14; compiler) to @💩11 (real: 10)
<<<<+
;;		Move pointer from cebf_compiler_14@💩11 (real: 10; compiler) to cebf_compiler_14@💩7 (real: 14; compiler)
>>>>]<
;;	Move pointer from cebf_compiler_13@💩8 (real: 13; compiler) to cebf_compiler_10@💩11 (real: 10; compiler)
<<<
>>]<<
;;;; Hi; you seem to have entered an empty line; The compiler does not like this cause it cannot count reliably; Please not that poop emojis are better in commands than dots 💩
;; Instruction diff: 0    next: 0     counter: 13
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from cebf_compiler_13@💩11 (real: 10; compiler) to cebf_compiler_10@💩11 (real: 10; compiler)

>>]<<]
