timeout:1000
>>>>>>>>>>>>>>>>  ;;; Reserve bf compiler memory space+[
;;💩commentcode
;; Instruction diff: 1    next: 2     counter: 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		<<<<<<
;;	Move pointer from @💩6 (real: 10) to @💩6 (real: 10; compiler)

+>>]<<
;;💩seperatestatemachine
;; Instruction diff: 1    next: 3     counter: 2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @💩6 (real: 10) to @💩6 (real: 10; compiler)

+>>]<<
;;sad 0 pointer
;; Instruction diff: 1    next: 4     counter: 3
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		;; Assigned memory address @0 (real: 16) the name 'pointer'
;;	Move pointer from @💩6 (real: 10) to @💩6 (real: 10; compiler)

+>>]<<
;;sad 1 a
;; Instruction diff: 1    next: 5     counter: 4
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		;; Assigned memory address @2 (real: 18) the name 'a'
;;	Move pointer from @💩6 (real: 10) to @💩6 (real: 10; compiler)

+>>]<<
;;sad 3 value
;; Instruction diff: 1    next: 6     counter: 5
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		;; Assigned memory address @6 (real: 22) the name 'value'
;;	Move pointer from @💩6 (real: 10) to @💩6 (real: 10; compiler)

+>>]<<
;;set💩s $value abcd
;; Instruction diff: 1    next: 7     counter: 6
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @💩6 (real: 10) to @6 (real: 22)
>>>>>>>>>>>>
;;	Set address value to 97
[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Move pointer from @6 (real: 22) to @8 (real: 24)
>>
;;	Set address value to 98
[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Move pointer from @8 (real: 24) to @10 (real: 26)
>>
;;	Set address value to 99
[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Move pointer from @10 (real: 26) to @12 (real: 28)
>>
;;	Set address value to 100
[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Move pointer from @12 (real: 28) to @14 (real: 30)
>>
;;	Set address value to 0
[-]
;;	Move pointer from @14 (real: 30) to @💩6 (real: 10; compiler)
<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;set💩n $a 1
;; Instruction diff: 1    next: 8     counter: 7
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @💩6 (real: 10) to @2 (real: 18)
>>>>>>>>
;;	Set address value to 1
[-]+
;;	Move pointer from @2 (real: 18) to @💩6 (real: 10; compiler)
<<<<<<<<
+>>]<<
;;set💩a $pointer $value
;; Instruction diff: 1    next: 9     counter: 8
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @💩6 (real: 10) to @0 (real: 16)
>>>>>>
;;	Set address value to 3
[-]+++
;;	Move pointer from @0 (real: 16) to @💩6 (real: 10; compiler)
<<<<<<
+>>]<<
;;:loop
;; Instruction diff: 1    next: 10     counter: 9
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @💩6 (real: 10) to @💩6 (real: 10; compiler)

+>>]<<
;;out💩r *$pointer
;; Instruction diff: 1    next: 11     counter: 10
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @💩6 (real: 10) to @*0 (real: 16)
;;		Copying from @0 (real: 16) to @💩1 (real: 15; compiler)
;;					Move pointer from @💩6 (real: 10) to @💩7 (real: 9; compiler)
<
;;				Set address value to 0
[-]
;;				Move pointer from @💩7 (real: 9) to @0 (real: 16)
>>>>>>>
;;			Move value from address @0 (real: 16) into @💩7 (real: 9; compiler)
[-
;;				Move pointer from @0 (real: 16) to @💩7 (real: 9; compiler)
<<<<<<<+
;;				Move pointer from @💩7 (real: 9) to @0 (real: 16)
>>>>>>>]
;;			Move pointer from @0 (real: 16) to @💩7 (real: 9; compiler)
<<<<<<<
;;		Multi💩move value from address @💩7 (real: 9; compiler) into @0 (real: 16) and @💩1 (real: 15; compiler)
[-
;;			Move pointer from @💩7 (real: 9) to @0 (real: 16)
>>>>>>>+
;;			Move pointer from @0 (real: 16) to @💩1 (real: 15; compiler)
<+
;;			Move pointer from @💩1 (real: 15) to @💩7 (real: 9; compiler)
<<<<<<]
;;		Move pointer from @💩7 (real: 9) to @💩1 (real: 15; compiler)
>>>>>>
;;	Follow pointer and leaving a trace
[>>[-]<<[>>+<<-]+>>-]+>.
;;tracing back from pointer
<[-<<]>>
;;	Move pointer from @💩1 (real: 15) to @💩6 (real: 10; compiler)
<<<<<
+>>]<<
;;add $a $pointer $pointer
;; Instruction diff: 1    next: 12     counter: 11
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;		Copying from @2 (real: 18) to @💩16 (real: 0; compiler)
;;					Move pointer from @💩6 (real: 10) to @💩7 (real: 9; compiler)
<
;;				Set address value to 0
[-]
;;				Move pointer from @💩7 (real: 9) to @2 (real: 18)
>>>>>>>>>
;;			Move value from address @2 (real: 18) into @💩7 (real: 9; compiler)
[-
;;				Move pointer from @2 (real: 18) to @💩7 (real: 9; compiler)
<<<<<<<<<+
;;				Move pointer from @💩7 (real: 9) to @2 (real: 18)
>>>>>>>>>]
;;			Move pointer from @2 (real: 18) to @💩7 (real: 9; compiler)
<<<<<<<<<
;;		Multi💩move value from address @💩7 (real: 9; compiler) into @2 (real: 18) and @💩16 (real: 0; compiler)
[-
;;			Move pointer from @💩7 (real: 9) to @2 (real: 18)
>>>>>>>>>+
;;			Move pointer from @2 (real: 18) to @💩16 (real: 0; compiler)
<<<<<<<<<<<<<<<<<<+
;;			Move pointer from @💩16 (real: 0) to @💩7 (real: 9; compiler)
>>>>>>>>>]
;;		Copying from @0 (real: 16) to @💩15 (real: 1; compiler)
;;					Move pointer from @💩7 (real: 9) to @💩7 (real: 9; compiler)
;;				Set address value to 0
[-]
;;				Move pointer from @💩7 (real: 9) to @0 (real: 16)
>>>>>>>
;;			Move value from address @0 (real: 16) into @💩7 (real: 9; compiler)
[-
;;				Move pointer from @0 (real: 16) to @💩7 (real: 9; compiler)
<<<<<<<+
;;				Move pointer from @💩7 (real: 9) to @0 (real: 16)
>>>>>>>]
;;			Move pointer from @0 (real: 16) to @💩7 (real: 9; compiler)
<<<<<<<
;;		Multi💩move value from address @💩7 (real: 9; compiler) into @0 (real: 16) and @💩15 (real: 1; compiler)
[-
;;			Move pointer from @💩7 (real: 9) to @0 (real: 16)
>>>>>>>+
;;			Move pointer from @0 (real: 16) to @💩15 (real: 1; compiler)
<<<<<<<<<<<<<<<+
;;			Move pointer from @💩15 (real: 1) to @💩7 (real: 9; compiler)
>>>>>>>>]
;;		Move pointer from @💩7 (real: 9) to @💩16 (real: 0; compiler)
<<<<<<<<<[->+<]
;;	Add current address to next address
;;		Copying from @💩15 (real: 1; compiler) to @0 (real: 16)
;;					Move pointer from @💩16 (real: 0) to @💩7 (real: 9; compiler)
>>>>>>>>>
;;				Set address value to 0
[-]
;;				Move pointer from @💩7 (real: 9) to @💩15 (real: 1; compiler)
<<<<<<<<
;;			Move value from address @💩15 (real: 1; compiler) into @💩7 (real: 9; compiler)
[-
;;				Move pointer from @💩15 (real: 1) to @💩7 (real: 9; compiler)
>>>>>>>>+
;;				Move pointer from @💩7 (real: 9) to @💩15 (real: 1; compiler)
<<<<<<<<]
;;			Move pointer from @💩15 (real: 1) to @💩7 (real: 9; compiler)
>>>>>>>>
;;		Multi💩move value from address @💩7 (real: 9; compiler) into @💩15 (real: 1; compiler) and @0 (real: 16)
[-
;;			Move pointer from @💩7 (real: 9) to @💩15 (real: 1; compiler)
<<<<<<<<+
;;			Move pointer from @💩15 (real: 1) to @0 (real: 16)
>>>>>>>>>>>>>>>+
;;			Move pointer from @0 (real: 16) to @💩7 (real: 9; compiler)
<<<<<<<]
;;			Move pointer from @💩7 (real: 9) to @💩16 (real: 0; compiler)
<<<<<<<<<
;;		Set address value to 0
[-]
;;			Move pointer from @💩16 (real: 0) to @💩15 (real: 1; compiler)
>
;;		Set address value to 0
[-]
;;	Move pointer from @💩15 (real: 1) to @💩6 (real: 10; compiler)
>>>>>>>>>
+>>]<<
;;jmp💩nz *$pointer loop
;; Instruction diff: 10    next: 9     counter: 12
;; Instruction diff: 1    next: 13     counter: 12
;; Instruction diff: 0    next: 12     counter: 12
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Doing if for @*0 (real: 16)
;;		Copying from @*0 (real: 16) to @💩16 (real: 0; compiler)
;;					Move pointer from @💩6 (real: 10) to @💩7 (real: 9; compiler)
<
;;				Set address value to 0
[-]
;;				Move pointer from @💩7 (real: 9) to @*0 (real: 16)
;;					Copying from @0 (real: 16) to @💩1 (real: 15; compiler)
;;								Move pointer from @💩7 (real: 9) to @💩7 (real: 9; compiler)
;;							Set address value to 0
[-]
;;							Move pointer from @💩7 (real: 9) to @0 (real: 16)
>>>>>>>
;;						Move value from address @0 (real: 16) into @💩7 (real: 9; compiler)
[-
;;							Move pointer from @0 (real: 16) to @💩7 (real: 9; compiler)
<<<<<<<+
;;							Move pointer from @💩7 (real: 9) to @0 (real: 16)
>>>>>>>]
;;						Move pointer from @0 (real: 16) to @💩7 (real: 9; compiler)
<<<<<<<
;;					Multi💩move value from address @💩7 (real: 9; compiler) into @0 (real: 16) and @💩1 (real: 15; compiler)
[-
;;						Move pointer from @💩7 (real: 9) to @0 (real: 16)
>>>>>>>+
;;						Move pointer from @0 (real: 16) to @💩1 (real: 15; compiler)
<+
;;						Move pointer from @💩1 (real: 15) to @💩7 (real: 9; compiler)
<<<<<<]
;;					Move pointer from @💩7 (real: 9) to @💩1 (real: 15; compiler)
>>>>>>
;;				Follow pointer and leaving a trace
[>>[-]<<[>>+<<-]+>>-]+>
;;			Move value from address @*0 (real: 16) into @💩7 (real: 9; compiler)
[-
;;			tracing back from pointer
<[-<<]>>
;;				Move pointer from @💩1 (real: 15) to @💩7 (real: 9; compiler)
<<<<<<+
;;				Move pointer from @💩7 (real: 9) to @*0 (real: 16)
;;					Copying from @0 (real: 16) to @💩1 (real: 15; compiler)
;;								Move pointer from @💩7 (real: 9) to @💩7 (real: 9; compiler)
;;							Set address value to 0
[-]
;;							Move pointer from @💩7 (real: 9) to @0 (real: 16)
>>>>>>>
;;						Move value from address @0 (real: 16) into @💩7 (real: 9; compiler)
[-
;;							Move pointer from @0 (real: 16) to @💩7 (real: 9; compiler)
<<<<<<<+
;;							Move pointer from @💩7 (real: 9) to @0 (real: 16)
>>>>>>>]
;;						Move pointer from @0 (real: 16) to @💩7 (real: 9; compiler)
<<<<<<<
;;					Multi💩move value from address @💩7 (real: 9; compiler) into @0 (real: 16) and @💩1 (real: 15; compiler)
[-
;;						Move pointer from @💩7 (real: 9) to @0 (real: 16)
>>>>>>>+
;;						Move pointer from @0 (real: 16) to @💩1 (real: 15; compiler)
<+
;;						Move pointer from @💩1 (real: 15) to @💩7 (real: 9; compiler)
<<<<<<]
;;					Move pointer from @💩7 (real: 9) to @💩1 (real: 15; compiler)
>>>>>>
;;				Follow pointer and leaving a trace
[>>[-]<<[>>+<<-]+>>-]+>]
;;			tracing back from pointer
<[-<<]>>
;;			Move pointer from @💩1 (real: 15) to @💩7 (real: 9; compiler)
<<<<<<
;;		Multi💩move value from address @💩7 (real: 9; compiler) into @*0 (real: 16) and @💩16 (real: 0; compiler)
[-
;;			Move pointer from @💩7 (real: 9) to @*0 (real: 16)
;;				Copying from @0 (real: 16) to @💩1 (real: 15; compiler)
;;							Move pointer from @💩7 (real: 9) to @💩7 (real: 9; compiler)
;;						Set address value to 0
[-]
;;						Move pointer from @💩7 (real: 9) to @0 (real: 16)
>>>>>>>
;;					Move value from address @0 (real: 16) into @💩7 (real: 9; compiler)
[-
;;						Move pointer from @0 (real: 16) to @💩7 (real: 9; compiler)
<<<<<<<+
;;						Move pointer from @💩7 (real: 9) to @0 (real: 16)
>>>>>>>]
;;					Move pointer from @0 (real: 16) to @💩7 (real: 9; compiler)
<<<<<<<
;;				Multi💩move value from address @💩7 (real: 9; compiler) into @0 (real: 16) and @💩1 (real: 15; compiler)
[-
;;					Move pointer from @💩7 (real: 9) to @0 (real: 16)
>>>>>>>+
;;					Move pointer from @0 (real: 16) to @💩1 (real: 15; compiler)
<+
;;					Move pointer from @💩1 (real: 15) to @💩7 (real: 9; compiler)
<<<<<<]
;;				Move pointer from @💩7 (real: 9) to @💩1 (real: 15; compiler)
>>>>>>
;;			Follow pointer and leaving a trace
[>>[-]<<[>>+<<-]+>>-]+>+
;;		tracing back from pointer
<[-<<]>>
;;			Move pointer from @💩1 (real: 15) to @💩16 (real: 0; compiler)
<<<<<<<<<<<<<<<+
;;			Move pointer from @💩16 (real: 0) to @💩7 (real: 9; compiler)
>>>>>>>>>]#
;;	Move pointer from @💩7 (real: 9) to @💩6 (real: 10; compiler)
>
>>]<<
;;;; Hi; you seem to have entered an empty line; The compiler does not like this cause it cannot count reliably; Please not that poop emojis are better in commands than dots 💩
;; Instruction diff: 0    next: 0     counter: 13
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @💩6 (real: 10) to @💩6 (real: 10; compiler)

>>]<<]
