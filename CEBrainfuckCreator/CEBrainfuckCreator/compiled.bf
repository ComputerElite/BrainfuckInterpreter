timeout:200
>>>>>>>>>>>>>  ;;; Reserve bf compiler memory space<<<+[
;;;;macro jmp/eq 3
;; Instruction diff: 1    next: 2     counter: 1
-[->+>+<<]>>[-<<+>>]<>+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;sub $0 $1 $cebf_compiler_7
;; Instruction diff: 1    next: 3     counter: 2
-[->+>+<<]>>[-<<+>>]<>+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;dbg
;; Instruction diff: 1    next: 4     counter: 3
-[->+>+<<]>>[-<<+>>]<>+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;jmp/nz $cebf_compiler_7 $2
;; Instruction diff: 1    next: 5     counter: 4
-[->+>+<<]>>[-<<+>>]<>+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;macroend
;; Instruction diff: 1    next: 6     counter: 5
-[->+>+<<]>>[-<<+>>]<>+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;#seperatestatemachine
;; Instruction diff: 1    next: 7     counter: 6
-[->+>+<<]>>[-<<+>>]<>+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;stn 1 1
;; Instruction diff: 1    next: 8     counter: 7
-[->+>+<<]>>[-<<+>>]<>+<[>[-]<[-]]>[[-]<<
		>>>>[-]+<<<<
+>>]<<
;;stn 1 2
;; Instruction diff: 1    next: 9     counter: 8
-[->+>+<<]>>[-<<+>>]<>+<[>[-]<[-]]>[[-]<<
		>>>>>[-]+<<<<<
+>>]<<
;;sub 1 2 $cebf_compiler_7
;; Instruction diff: 1    next: 10     counter: 9
-[->+>+<<]>>[-<<+>>]<>+<[>[-]<[-]]>[[-]<<
		<[-][-]>>>>>[-<<<<<+>>>>>]<<<<<[->>>>>+<<<<<<<<<<<<<<+>>>>>>>>>][-][-]>>>>>>[-<<<<<<+>>>>>>]<<<<<<[->>>>>>+<<<<<<<<<<<<<<+>>>>>>>>]<<<<<<<<<[->-<]>>>>>>>>>[-][-]<<<<<<<<[->>>>>>>>+<<<<<<<<]>>>>>>>>[-<<<<<<<<+>>>>>>+>>]<<<<<<<<<[-]>[-]>>>>>>>>>
+>>]<<
;;dbg
;; Instruction diff: 1    next: 11     counter: 10
-[->+>+<<]>>[-<<+>>]<>+<[>[-]<[-]]>[[-]<<
		#
+>>]<<
;;jmp/nz $cebf_compiler_7 success
;; Instruction diff: 1    next: 12     counter: 11
;; Instruction diff: 1    next: 12     counter: 11
;; Instruction diff: 0    next: 11     counter: 11
-[->+>+<<]>>[-<<+>>]<>+<[>[-]<[-]]>[[-]<<
		<[-][-]<<[->>+<<]>>[-<<+<<<<<<<+>>>>>>>>>]<<<<<<<<[-]+<[[-]>[-]>>>>>>>>>+<<<<<<<<<<]>[[-]>>>>>>>>>+<<<<<<<<<]<>>>>>>>>>>
>>]<<
;;jmp end
;; Instruction diff: 2    next: 14     counter: 12
-[->+>+<<]>>[-<<+>>]<>+<[>[-]<[-]]>[[-]<<
		
++>>]<<
;;:success
;; Instruction diff: 1    next: 14     counter: 13
-[->+>+<<]>>[-<<+>>]<>+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;ous It's equal
;; Instruction diff: 1    next: 15     counter: 14
-[->+>+<<]>>[-<<+>>]<>+<[>[-]<[-]]>[[-]<<
		<[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]>
+>>]<<
;;:end
;; Instruction diff: 1    next: 16     counter: 15
-[->+>+<<]>>[-<<+>>]<>+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;ous Done
;; Instruction diff: 1    next: 17     counter: 16
-[->+>+<<]>>[-<<+>>]<>+<[>[-]<[-]]>[[-]<<
		<[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]>
+>>]<<
;;;; Hi; you seem to have entered an empty line; The compiler does not like this cause it cannot count reliably; Please not that poop emojis are better in commands than dots 💩
;; Instruction diff: 0    next: 0     counter: 17
-[->+>+<<]>>[-<<+>>]<>+<[>[-]<[-]]>[[-]<<
		
>>]<<]
