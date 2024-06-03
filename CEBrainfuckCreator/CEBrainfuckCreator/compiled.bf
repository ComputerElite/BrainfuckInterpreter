timeout:200
>>>>>>>>>>>>>>>  ;;; Reserve bf compiler memory space+[
;;💩commentcode
;; Instruction diff: 1    next: 2     counter: 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		<<<<<
;;	Move pointer from @-5 (real: 10) to @-5 (real: 10)

+>>]<<
;;💩seperatestatemachine
;; Instruction diff: 1    next: 3     counter: 2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @-5 (real: 10) to @-5 (real: 10)

+>>]<<
;;sad 0 pointer
;; Instruction diff: 1    next: 4     counter: 3
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		;; Assigned memory address @1 (real: 16) the name 'pointer'
;;	Move pointer from @-5 (real: 10) to @-5 (real: 10)

+>>]<<
;;sad 1 value
;; Instruction diff: 1    next: 5     counter: 4
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		;; Assigned memory address @3 (real: 18) the name 'value'
;;	Move pointer from @-5 (real: 10) to @-5 (real: 10)

+>>]<<
;;set💩s $value test
;; Instruction diff: 1    next: 6     counter: 5
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @-5 (real: 10) to @3 (real: 18)
>>>>>>>>
;;	Set address value to 116
[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Move pointer from @3 (real: 18) to @5 (real: 20)
>>
;;	Set address value to 101
[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Move pointer from @5 (real: 20) to @7 (real: 22)
>>
;;	Set address value to 115
[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Move pointer from @7 (real: 22) to @9 (real: 24)
>>
;;	Set address value to 116
[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Move pointer from @9 (real: 24) to @11 (real: 26)
>>
;;	Set address value to 0
[-]
;;	Move pointer from @11 (real: 26) to @-5 (real: 10)
<<<<<<<<<<<<<<<<
+>>]<<
;;set💩a $pointer $value
;; Instruction diff: 1    next: 7     counter: 6
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @-5 (real: 10) to @1 (real: 16)
>>>>>>
;;	Set address value to 1
[-]+
;;	Move pointer from @1 (real: 16) to @-5 (real: 10)
<<<<<<
+>>]<<
;;:loop
;; Instruction diff: 1    next: 8     counter: 7
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @-5 (real: 10) to @-5 (real: 10)

+>>]<<
;;out💩r *$pointer
;; Instruction diff: 1    next: 9     counter: 8
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @-5 (real: 10) to @*1 (real: 16)
;;		Copying from @1 (real: 16) to @0 (real: 15)
;;					Move pointer from @-5 (real: 10) to @-6 (real: 9)
<
;;				Set address value to 0
[-]
;;				Move pointer from @-6 (real: 9) to @1 (real: 16)
>>>>>>>
;;			Move value from address @1 (real: 16) into @-6 (real: 9)
[-
;;				Move pointer from @1 (real: 16) to @-6 (real: 9)
<<<<<<<+
;;				Move pointer from @-6 (real: 9) to @1 (real: 16)
>>>>>>>]
;;			Move pointer from @1 (real: 16) to @-6 (real: 9)
<<<<<<<
;;		Move value from address @-6 (real: 9) into @1 (real: 16) and @0 (real: 15)
[-
;;			Move pointer from @-6 (real: 9) to @1 (real: 16)
>>>>>>>+
;;			Move pointer from @1 (real: 16) to @0 (real: 15)
<+
;;			Move pointer from @0 (real: 15) to @-6 (real: 9)
<<<<<<]
;;		Move pointer from @-6 (real: 9) to @0 (real: 15)
>>>>>>[[>>+<<-]+>>-]+>.<[-<<]>>
;;	Move pointer from @0 (real: 15) to @-5 (real: 10)
<<<<<
+>>]<<
;;inc $pointer
;; Instruction diff: 1    next: 10     counter: 9
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @-5 (real: 10) to @1 (real: 16)
>>>>>>+
;;	Move pointer from @1 (real: 16) to @-5 (real: 10)
<<<<<<
+>>]<<
;;jmp💩nz *$pointer loop
;; Instruction diff: 3    next: 7     counter: 10
;; Instruction diff: 1    next: 11     counter: 10
;; Instruction diff: 0    next: 10     counter: 10
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;		Copying from @*1 (real: 16) to @-15 (real: 0)
;;					Move pointer from @-5 (real: 10) to @-6 (real: 9)
<
;;				Set address value to 0
[-]
;;				Move pointer from @-6 (real: 9) to @*1 (real: 16)
;;					Copying from @1 (real: 16) to @0 (real: 15)
;;								Move pointer from @-6 (real: 9) to @-6 (real: 9)
;;							Set address value to 0
[-]
;;							Move pointer from @-6 (real: 9) to @1 (real: 16)
>>>>>>>
;;						Move value from address @1 (real: 16) into @-6 (real: 9)
[-
;;							Move pointer from @1 (real: 16) to @-6 (real: 9)
<<<<<<<+
;;							Move pointer from @-6 (real: 9) to @1 (real: 16)
>>>>>>>]
;;						Move pointer from @1 (real: 16) to @-6 (real: 9)
<<<<<<<
;;					Move value from address @-6 (real: 9) into @1 (real: 16) and @0 (real: 15)
[-
;;						Move pointer from @-6 (real: 9) to @1 (real: 16)
>>>>>>>+
;;						Move pointer from @1 (real: 16) to @0 (real: 15)
<+
;;						Move pointer from @0 (real: 15) to @-6 (real: 9)
<<<<<<]
;;					Move pointer from @-6 (real: 9) to @0 (real: 15)
>>>>>>[[>>+<<-]+>>-]+>
;;			Move value from address @*1 (real: 16) into @-6 (real: 9)
[-<[-<<]>>
;;				Move pointer from @0 (real: 15) to @-6 (real: 9)
<<<<<<+
;;				Move pointer from @-6 (real: 9) to @*1 (real: 16)
;;					Copying from @1 (real: 16) to @0 (real: 15)
;;								Move pointer from @-6 (real: 9) to @-6 (real: 9)
;;							Set address value to 0
[-]
;;							Move pointer from @-6 (real: 9) to @1 (real: 16)
>>>>>>>
;;						Move value from address @1 (real: 16) into @-6 (real: 9)
[-
;;							Move pointer from @1 (real: 16) to @-6 (real: 9)
<<<<<<<+
;;							Move pointer from @-6 (real: 9) to @1 (real: 16)
>>>>>>>]
;;						Move pointer from @1 (real: 16) to @-6 (real: 9)
<<<<<<<
;;					Move value from address @-6 (real: 9) into @1 (real: 16) and @0 (real: 15)
[-
;;						Move pointer from @-6 (real: 9) to @1 (real: 16)
>>>>>>>+
;;						Move pointer from @1 (real: 16) to @0 (real: 15)
<+
;;						Move pointer from @0 (real: 15) to @-6 (real: 9)
<<<<<<]
;;					Move pointer from @-6 (real: 9) to @0 (real: 15)
>>>>>>[[>>+<<-]+>>-]+>]<[-<<]>>
;;			Move pointer from @0 (real: 15) to @-6 (real: 9)
<<<<<<
;;		Move value from address @-6 (real: 9) into @*1 (real: 16) and @-15 (real: 0)
[-
;;			Move pointer from @-6 (real: 9) to @*1 (real: 16)
;;				Copying from @1 (real: 16) to @0 (real: 15)
;;							Move pointer from @-6 (real: 9) to @-6 (real: 9)
;;						Set address value to 0
[-]
;;						Move pointer from @-6 (real: 9) to @1 (real: 16)
>>>>>>>
;;					Move value from address @1 (real: 16) into @-6 (real: 9)
[-
;;						Move pointer from @1 (real: 16) to @-6 (real: 9)
<<<<<<<+
;;						Move pointer from @-6 (real: 9) to @1 (real: 16)
>>>>>>>]
;;					Move pointer from @1 (real: 16) to @-6 (real: 9)
<<<<<<<
;;				Move value from address @-6 (real: 9) into @1 (real: 16) and @0 (real: 15)
[-
;;					Move pointer from @-6 (real: 9) to @1 (real: 16)
>>>>>>>+
;;					Move pointer from @1 (real: 16) to @0 (real: 15)
<+
;;					Move pointer from @0 (real: 15) to @-6 (real: 9)
<<<<<<]
;;				Move pointer from @-6 (real: 9) to @0 (real: 15)
>>>>>>[[>>+<<-]+>>-]+>+<[-<<]>>
;;			Move pointer from @0 (real: 15) to @-15 (real: 0)
<<<<<<<<<<<<<<<+
;;			Move pointer from @-15 (real: 0) to @-6 (real: 9)
>>>>>>>>>]#
;;		Move pointer from @-6 (real: 9) to @-14 (real: 1)
<<<<<<<<
;;		Set address value to 1
[-]+
;;		Move pointer from @-14 (real: 1) to @-15 (real: 0)
<[[-]>[-]
;;		Move pointer from @-14 (real: 1) to @-15 (real: 0)
<+++
;;		Move pointer from @-15 (real: 0) to @-15 (real: 0)
<]>[[-]
;;		Move pointer from @-15 (real: 0) to @-15 (real: 0)
+
;;		Move pointer from @-15 (real: 0) to @-15 (real: 0)
]<
;;	Move pointer from @-15 (real: 0) to @-5 (real: 10)
>>>>>>>>>>
>>]<<
;;;; Hi; you seem to have entered an empty line; The compiler does not like this cause it cannot count reliably; Please not that poop emojis are better in commands than dots 💩
;; Instruction diff: 0    next: 0     counter: 11
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
;;	Move pointer from @-5 (real: 10) to @-5 (real: 10)

>>]<<]
