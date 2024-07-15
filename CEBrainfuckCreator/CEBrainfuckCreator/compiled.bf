timeout:1000
>>>>>>>>>>>>>>>>>>>>>>>>  ;;; Reserve bf compiler memory space+[
;;;;💩commentcode
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		<<<<<<<<<<<<<<
+>>]<<
;;💩seperatestatemachine
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;; Standard library for cebf
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;; by ComputerElite 2024
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;; The standard library contains macros which are useful for writing programs in cebf💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;; The compiler automatically reserves space for the standard library and you won't have to worry about overwriting any of it's variables when using it💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;; jump if equal
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;; jmp💩eq 💩addressA💩 💩addressB💩 💩label💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;macro jmp💩eq 3
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;;; subtract both values from each other
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;sub $0 $1 $cebf_stdlib_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;dbg
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;;; if the result is 0💩 the values are equal and thus we jump
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;jmp💩ez $cebf_stdlib_0 $2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;macroend
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;; compare two strings
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;; string💩compare 💩addressA💩 💩addressB💩 💩label💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;macro string💩compare 3
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;;; create pointers to the strings
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;set💩a $cebf_stdlib_1 $0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;set💩a $cebf_stdlib_2 $1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;jmp cebf_stdlib_string_compare_loop
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;;; compare the strings character for character
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;:cebf_stdlib_string_compare_pre_loop
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;;; move to next characters
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;inc $cebf_stdlib_1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;inc $cebf_stdlib_2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;:cebf_stdlib_string_compare_loop
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;out💩r *$cebf_stdlib_1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;out💩r *$cebf_stdlib_2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;;; if both characters are equal check what they are
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;jmp💩eq *$cebf_stdlib_1 *$cebf_stdlib_2 cebf_stdlib_string_compare_compare_succeeded
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;;; now check if any of the strings are null
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;jmp cebf_stdlib_string_compare_compare_failed
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;:cebf_stdlib_string_compare_compare_succeeded
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;;; if the first string is not null💩 we haven't reached the end of the string yet
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;jmp💩nz *$cebf_stdlib_1 cebf_stdlib_string_compare_pre_loop
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;;; string end reached and they're the same💩 Nice!!
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;jmp $2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;:cebf_stdlib_string_compare_compare_failed
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;;macroend
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;sad 2 input
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;sad 0 input_pointer
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;sad 1 new_line
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;; readline
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;set💩a $input_pointer $input
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		>>>>>>>>>>>>>>[-]++<<<<<<<<<<<<<<
+>>]<<
;;set💩n $new_line 13
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		>>>>>>>>>>>>>>>>[-]+++++++++++++<<<<<<<<<<<<<<<<
+>>]<<
;;:input_loop
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;in💩c *$input_pointer
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		>>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<[-]>>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]<<<<<<<<<[->>>>>>>>>+>>>>>>>>>+<<<<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>,<[-<<]<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;;; subtract both values from each other
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;sub *$input_pointer $new_line $cebf_stdlib_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		<<<<<<<<<<[-]>>>>>>>>>>>>>>>>[-]>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<[-]>>>>>>>[-<<<<<<<+>>>>>>>]<<<<<<<[->>>>>>>+>>>>>>>>>+<<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>[-<[-<<]<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<[-]>>>>>>[-<<<<<<+>>>>>>]<<<<<<[->>>>>>+>>>>>>>>>+<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>]<[-<<]<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<[-]>>>>>[-<<<<<+>>>>>]<<<<<[->>>>>+>>>>>>>>>+<<<<<<<<<<<<<<]>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>+<[-<<]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<[-]>>>>>>>>>>>>>>>>>>>[-]>>>>>>[-<<<<<<+>>>>>>]<<<<<<[->>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<[->-<]>>>>>>>[-]>>>>>>>>[-]<<<<<<<<<<<<<<[->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>+>>>>>>>>]<<<<<<<<<<<<<<<[-]>[-]>>>>>>>>>
+>>]<<
;;dbg
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		#
+>>]<<
;;;; if the result is 0💩 the values are equal and thus we jump
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;jmp💩ez $cebf_stdlib_0 done
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		>>>[-]>>>>[-]<<<<<<<<<<[->>>>>>>>>>+<<<<<<<<<<]>>>>>>>>>>[-<<<<<<<<<<+>>>>>>+>>>>]<<<[-]+<[[-]>[-]<<<<+>>>]>[[-]<<<<+++>>>>]<<<<
>>]<<
;;inc $input_pointer
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		>>>>>>>>>>>>>>+<<<<<<<<<<<<<<
+>>]<<
;;jmp input_loop
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
++++++++++++++++++++++++++++++++++++++++++++++++++++++>>]<<
;;:done
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;out💩n $input
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		>>>>>>>>>>>>>>>>>>[.>>]<<<<<<<<<<<<<<<<<<
+>>]<<
;;wrt💩s lol
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		>>>>>>>>[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]<<<<<<<<
+>>]<<
;;;; Hi; you seem to have entered an empty line; The compiler does not like this cause it cannot count reliably; Please not that poop emojis are better in commands than dots 💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
+>>]<<
;;;; Hi; you seem to have entered an empty line; The compiler does not like this cause it cannot count reliably; Please not that poop emojis are better in commands than dots 💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
		
>>]<<]
