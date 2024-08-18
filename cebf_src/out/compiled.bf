;; cebf_compiler_0@💩34 (real: 2; compiler)
;; cebf_compiler_1@💩33 (real: 3; compiler)
;; cebf_compiler_2@💩32 (real: 4; compiler)
;; cebf_compiler_3@💩31 (real: 5; compiler)
;; cebf_compiler_4@💩30 (real: 6; compiler)
;; cebf_compiler_5@💩29 (real: 7; compiler)
;; cebf_compiler_6@💩28 (real: 8; compiler)
;; cebf_compiler_7@💩27 (real: 9; compiler)
;; cebf_compiler_8@💩26 (real: 10; compiler)
;; cebf_compiler_9@💩25 (real: 11; compiler)
;; cebf_compiler_10@💩24 (real: 12; compiler)
;; cebf_compiler_11@💩23 (real: 13; compiler)
;; cebf_compiler_12@💩22 (real: 14; compiler)
;; cebf_compiler_13@💩21 (real: 15; compiler)
;; cebf_compiler_14@💩20 (real: 16; compiler)
;; cebf_compiler_15@💩19 (real: 17; compiler)
;; cebf_compiler_16@💩18 (real: 18; compiler)
;; cebf_compiler_17@💩17 (real: 19; compiler)
;; cebf_compiler_18@💩16 (real: 20; compiler)
;; cebf_compiler_19@💩15 (real: 21; compiler)
;; cebf_compiler_20@💩14 (real: 22; compiler)
;; cebf_compiler_21@💩13 (real: 23; compiler)
;; cebf_compiler_22@💩12 (real: 24; compiler)
;; cebf_compiler_23@💩11 (real: 25; compiler)
;; cebf_compiler_24@💩10 (real: 26; compiler)
;; cebf_compiler_25@💩9 (real: 27; compiler)
;; cebf_compiler_26@💩8 (real: 28; compiler)
;; cebf_compiler_27@💩7 (real: 29; compiler)
;; cebf_compiler_28@💩6 (real: 30; compiler)
;; cebf_compiler_29@💩5 (real: 31; compiler)
;; cebf_compiler_30@💩4 (real: 32; compiler)
;; cebf_compiler_31@💩3 (real: 33; compiler)
;; cebf_compiler_32@💩2 (real: 34; compiler)
;; cebf_compiler_33@💩1 (real: 35; compiler)
;; cebf_stdlib_0@💩27 (real: 9; compiler)
;; cebf_stdlib_1@💩26 (real: 10; compiler)
;; cebf_stdlib_2@💩25 (real: 11; compiler)
;; cebf_stdlib_3@💩13 (real: 23; compiler)
;; cebf_stdlib_4@💩12 (real: 24; compiler)
;; cebf_stdlib_5@💩11 (real: 25; compiler)
;; cebf_stdlib_6@💩10 (real: 26; compiler)
;; cebf_stdlib_7@💩9 (real: 27; compiler)
;; cebf_stdlib_8@💩8 (real: 28; compiler)
;; cebf_stdlib_9@💩7 (real: 29; compiler)
;; cebf_stdlib_10@💩6 (real: 30; compiler)
;; cebf_stdlib_11@💩5 (real: 31; compiler)
;; cebf_stdlib_12@💩4 (real: 32; compiler)
;; cebf_stdlib_13@💩2 (real: 34; compiler)
;; cebf_interpreter_0@💩36 (real: 0; compiler)
;; cebf_interpreter_1@💩35 (real: 1; compiler)
timeout:1000
>>  ;; Reserve bf interpreter memory space
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  ;; Reserve bf compiler memory space
+[

;; Found macros start
bash💩set_command with 1 arguments
bash💩start_command_in_buffer with 0 arguments
bash💩kill_process with 0 arguments
bash💩read_stdout_to_end with 1 arguments
bash💩run_command_and_kill_at_end_of_file with 1 arguments
math💩power with 3 arguments
jmp💩eq with 3 arguments
string💩compare with 3 arguments
string💩get_length with 2 arguments
string💩to_int with 2 arguments
out💩int with 1 arguments

;; Found macros end


;;;; Bash library for cebf
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<<<<<<<<<<<<<<<<<<<<<<<<+>>]<<
;;;; by ComputerElite 2024
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; The bash library contains macros for interacting with the bash shell
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; Appends a command to the cebf interpreter bash command buffer
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; bash💩set_command 💩string💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macro bash💩set_command 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;;; save current interpreter output mode for restoring later
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;cpy $cebf_interpreter_0 $cebf_stdlib_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩n $cebf_interpreter_0 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;wrt💩s $0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;cpy $cebf_stdlib_0 $cebf_interpreter_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macroend
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; Starts the bash command in the bash buffer of the cebf interpreter💩 out/in streams will be redirected to started command
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; bash💩start_command_in_buffer
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macro bash💩start_command_in_buffer 0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩n $cebf_interpreter_0 2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;wrt💩n
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macroend
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; KIlls the process running in the cebf interpreter
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; bash💩kill_process
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macro bash💩kill_process 0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩n $cebf_interpreter_0 3
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;wrt💩n
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macroend
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; Reads stdout of the currently running bash process until the end of stream💩 Output will be null terminated
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; bash💩read_stdout_to_end 💩start_address💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macro bash💩read_stdout_to_end 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩a $0 $cebf_stdlib_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;;; check if process is running
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩n $cebf_interpreter_0 3
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;in💩c $cebf_stdlib_1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;jmp💩ez $cebf_stdlib_1 cebf_stdlib_bash_read_stdout_to_end__end
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩n $cebf_interpreter_0 0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;:cebf_stdlib_bash_read_stdout_to_end__loop
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;;; read stdout
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;in💩c *$cebf_stdlib_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;inc $cebf_stdlib_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;jmp💩nz $cebf_interpreter_1 cebf_stdlib_bash_read_stdout_to_end__exit
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;jmp cebf_stdlib_bash_read_stdout_to_end__loop
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;:cebf_stdlib_bash_read_stdout_to_end__end
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;;; null terminate string
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩n *$cebf_stdlib_0 0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;:cebf_stdlib_bash_read_stdout_to_end__exit
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macroend
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; Executes a bash command and kills it once the end of the output strea💩 was reached💩 Output stream is discarded
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; bash💩run_command_and_kill_at_end_of_file 💩command💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macro bash💩run_command_and_kill_at_end_of_file 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;bash💩set_command $0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;bash💩start_command_in_buffer
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;;; check if process is running
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩n $cebf_interpreter_0 3
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;in💩c $cebf_stdlib_1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;jmp💩ez $cebf_stdlib_1 cebf_stdlib_bash_run_command_and_kill_at_end_of_file__exit
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩n $cebf_interpreter_0 0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;:cebf_stdlib_bash_run_command_and_kill_at_end_of_file__loop
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;;; read stdout
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;in💩c $cebf_stdlib_1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;inc $cebf_stdlib_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;jmp💩nz $cebf_interpreter_1 cebf_stdlib_bash_run_command_and_kill_at_end_of_file__exit
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;jmp cebf_stdlib_bash_run_command_and_kill_at_end_of_file__loop
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;:cebf_stdlib_bash_run_command_and_kill_at_end_of_file__exit
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macroend
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; Standard library for cebf
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; by ComputerElite 2024
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; The standard library contains macros which are useful for writing programs in cebf💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; The compiler automatically reserves space for the standard library and you won't have to worry about overwriting any of it's variables when using it💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; Function to calculate the power of a number
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; math💩power 💩base_value_address💩 💩power_value_address💩 💩result_address💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macro math💩power 3
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩n $2 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;cpy $0 $cebf_stdlib_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;cpy $1 $cebf_stdlib_1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;:cebf_stdlib_math_power__loop
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;jmp💩ez $cebf_stdlib_1 cebf_stdlib_math_power__end
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;mpl $cebf_stdlib_0 $2 $2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;dec $cebf_stdlib_1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;jmp cebf_stdlib_math_power__loop
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;:cebf_stdlib_math_power__end
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macroend
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; jump if equal
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; jmp💩eq 💩addressA💩 💩addressB💩 💩label💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macro jmp💩eq 3
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;;; subtract both values from each other
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;sub $0 $1 $cebf_stdlib_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;;; if the result is 0💩 the values are equal and thus we jump
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;jmp💩ez $cebf_stdlib_0 $2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macroend
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; compare two strings
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; string💩compare 💩addressA💩 💩addressB💩 💩label💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macro string💩compare 3
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;;; create pointers to the strings
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩a $cebf_stdlib_1 $0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩a $cebf_stdlib_2 $1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;jmp cebf_stdlib_string_compare_loop
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;;; compare the strings character for character
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;:cebf_stdlib_string_compare_pre_loop
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;;; move to next characters
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;inc $cebf_stdlib_1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;inc $cebf_stdlib_2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;:cebf_stdlib_string_compare_loop
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;out💩r *$cebf_stdlib_1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;out💩r *$cebf_stdlib_2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;;; if both characters are equal check what they are
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;jmp💩eq *$cebf_stdlib_1 *$cebf_stdlib_2 cebf_stdlib_string_compare_compare_succeeded
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;;; now check if any of the strings are null
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;jmp cebf_stdlib_string_compare_compare_failed
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;:cebf_stdlib_string_compare_compare_succeeded
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;;; if the first string is not null💩 we haven't reached the end of the string yet
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;jmp💩nz *$cebf_stdlib_1 cebf_stdlib_string_compare_pre_loop
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;;; string end reached and they're the same💩 Nice!!
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;jmp $2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;:cebf_stdlib_string_compare_compare_failed
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macroend
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; Stores the length of a string in a variable
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; string💩get_length 💩length_store_address💩 💩string_address💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macro string💩get_length 2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩n $0 0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩a $cebf_stdlib_0 $1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;:cebf_stdlib_string_get_length__loop
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;jmp💩ez *$cebf_stdlib_0 cebf_stdlib_string_get_length__end
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;inc $0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;inc $cebf_stdlib_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;jmp cebf_stdlib_string_get_length__loop
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;:cebf_stdlib_string_get_length__end
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macroend
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; Converts a string into an int
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; string💩to_int 💩string_address💩 💩int_store_address💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macro string💩to_int 2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;;; get length of string
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;string💩get_length $cebf_stdlib_2 $0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩a $cebf_stdlib_3 $0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩n $1 0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;dec $cebf_stdlib_2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;add $cebf_stdlib_3 $cebf_stdlib_2 $cebf_stdlib_3 ;; pointer in 3 now points to last char of string aka least significant
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩n $cebf_stdlib_5 0 ;; power of 10
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩n $cebf_stdlib_6 10 ;; base 10
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩n $cebf_stdlib_7 48 ;; ascii to digit conversion constant
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;:cebf_stdlib_string_to_int__loop
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;jmp💩ez $cebf_stdlib_2 cebf_stdlib_string_to_int__end
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;;; instead of writing back to the original address we could just use another stdlib address but I decided to safe addresses here💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;sub $cebf_stdlib_7 *$cebf_stdlib_3 *$cebf_stdlib_3 ;; convert ascii to digit
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;math💩power $cebf_stdlib_6 $cebf_stdlib_5 $cebf_stdlib_4 ;; calculate power of 10
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;mpl $cebf_stdlib_4 *$cebf_stdlib_3 $cebf_stdlib_4 ;; multiply digit with power of 10
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;add *$cebf_stdlib_3 $cebf_stdlib_7 *$cebf_stdlib_3 ;; restore damage we did to original memory cell
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;add $cebf_stdlib_4 $1 $1 ;; add to result
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;dec $cebf_stdlib_3 ;; move to next character
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;dec $cebf_stdlib_2 ;; decrement remaining string length
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;inc $cebf_stdlib_5 ;; increase power of 10
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;jmp cebf_stdlib_string_to_int__loop
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;:cebf_stdlib_string_to_int__end
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macroend
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; Outputs an int at an address
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; out💩int 💩address💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macro out💩int 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩n $cebf_stdlib_1 48
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;cpy $0 $cebf_stdlib_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;add $cebf_stdlib_1 $cebf_stdlib_0 $cebf_stdlib_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;out💩r $cebf_stdlib_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;macroend
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;💩produceprecompilecebf
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;sad 1 string
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;sad 0 length
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;set💩s $string "fuck this"
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;string💩get_length $length $string
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;string💩get_length $string $length
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;;out💩int $length
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;set💩s 1 "123"
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]>>>>>>>>>>>>>>>>>>>>>>>>[-]++++++++++++++++++++++++++++++++++>>[-]+++++++++++++++++++++++++++++++++++++++++++++++++>>[-]++++++++++++++++++++++++++++++++++++++++++++++++++>>[-]+++++++++++++++++++++++++++++++++++++++++++++++++++>>[-]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>]<<
;;;; Hi; you seem to have entered an empty line; The compiler does not like this cause it cannot count reliably; Please not that poop emojis are better in commands than dots 💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;set💩n $cebf_stdlib_2 0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<[-]>+>>]<<
;;set💩a $cebf_stdlib_0 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<<<[-]+>>>+>>]<<
;;:cebf_stdlib_string_get_length__loop___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;jmp💩ez *$cebf_stdlib_0 cebf_stdlib_string_get_length__end___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]>[-]>>[-]>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<[-]<<<<<<<<<[->>>>>>>>>+<<<<<<<<<]>>>>>>>>>[-<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>[-<[-<<]<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<[-]<<<<<<<<<<[->>>>>>>>>>+<<<<<<<<<<]>>>>>>>>>>[-<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>]<[-<<]<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<[-]<<<<<<<<<<<[->>>>>>>>>>>+<<<<<<<<<<<]>>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>+<[-<<]<<<<<<<<<<<<<<<<<<+>>]<[-]+<[[-]>[-]<<<<+>>>]>[[-]<<<<++++>>>>]<<]<<
;;inc $cebf_stdlib_2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<+>+>>]<<
;;inc $cebf_stdlib_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<<<+>>>+>>]<<
;;jmp cebf_stdlib_string_get_length__loop___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>>]<<
;;:cebf_stdlib_string_get_length__end___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;set💩a $cebf_stdlib_3 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]>>>>>>>>>[-]+<<<<<<<<<<<+>>]<<
;;set💩n 0 0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<<<<<<<+>>]<<
;;dec $cebf_stdlib_2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<->+>>]<<
;;add $cebf_stdlib_3 $cebf_stdlib_2 $cebf_stdlib_3
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<<<<<<<<<<[-]>>>>>>>>>>>>>>>>>>>[-]>>[-<<+>>]<<[->>+<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<[-]>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<[->>>>>>>>>>>+<<<<<<<<<<<]>>>>>>>>>>>[-<<<<<<<<<<<+<<<<<<<<+>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<[->+<]>>>>>>>>>>>>>>>>>>>>>[-]<<<<<[-]<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>+<<<<<]<<<<<<<<<<<<<<<<[-]>[-]>>>>>>>>>+>>]<<
;;set💩n $cebf_stdlib_5 0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]>>>>>>>>>>>[-]<<<<<<<<<<<<<+>>]<<
;;set💩n $cebf_stdlib_6 10
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]>>>>>>>>>>>>[-]++++++++++<<<<<<<<<<<<<<+>>]<<
;;set💩n $cebf_stdlib_7 48
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]>>>>>>>>>>>>>[-]++++++++++++++++++++++++++++++++++++++++++++++++<<<<<<<<<<<<<<<+>>]<<
;;:cebf_stdlib_string_to_int__loop___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;jmp💩ez $cebf_stdlib_2 cebf_stdlib_string_to_int__end___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]>[-]>>>>[-]<<<<<<<<[->>>>>>>>+<<<<<<<<]>>>>>>>>[-<<<<<<<<+>>>>+>>>>]<<<[-]+<[[-]>[-]<<<<+>>>]>[[-]<<<<+++++++++++++++++++>>>>]<<]<<
;;;; Hi; you seem to have entered an empty line; The compiler does not like this cause it cannot count reliably; Please not that poop emojis are better in commands than dots 💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;sub $cebf_stdlib_7 *$cebf_stdlib_3 *$cebf_stdlib_3
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<<<<<<<<<<[-]>>>>>>>>>>>>>>>>>>[-]>>>>>>>[-<<<<<<<+>>>>>>>]<<<<<<<[->>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<[-]>>>>>>>>>>>>>>[-]>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<[-]>>[-<<+>>]<<[->>+>>>>>>>>>>>>+<<<<<<<<<<<<<<]>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>[-<[-<<]<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<[-]>[-<+>]<[->+>>>>>>>>>>>>+<<<<<<<<<<<<<]>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>]<[-<<]<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<[-]>>>>>[-<<<<<+>>>>>]<<<<<[->>>>>+>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>+<[-<<]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<[->-<]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<[-]>>>[-<<<+>>>]<<<[->>>+>>>>>>>>>>>>+<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>[-]<[-<<]<<<<<<<<<<<<<<[-]<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<[-]>>[-<<+>>]<<[->>+>>>>>>>>>>>>+<<<<<<<<<<<<<<]>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>+<[-<<]<<<<<<<<<<<<<<]<<<<<<<<<<<<<<<<<[-]>[-]>>>>>>>>>+>>]<<
;;set💩n $cebf_stdlib_4 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]>>>>>>>>>>[-]+<<<<<<<<<<<<+>>]<<
;;cpy $cebf_stdlib_6 $cebf_stdlib_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<<<[-]>>>>>>>>>>>>>[-]>>>>[-<<<<+>>>>]<<<<[->>>>+<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>]<<<<<<<<<<+>>]<<
;;cpy $cebf_stdlib_5 $cebf_stdlib_1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<<[-]>>>>>>>>[-]>>>>>>>[-<<<<<<<+>>>>>>>]<<<<<<<[->>>>>>>+<<<<<<<<<<<<<<<+>>>>>>>>]<<<<<<+>>]<<
;;:cebf_stdlib_math_power__loop___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;jmp💩ez $cebf_stdlib_1 cebf_stdlib_math_power__end___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]>[-]>>[-]<<<<<<<[->>>>>>>+<<<<<<<]>>>>>>>[-<<<<<<<+>>>>>+>>]<[-]+<[[-]>[-]<<<<+>>>]>[[-]<<<<++++>>>>]<<]<<
;;mpl $cebf_stdlib_0 $cebf_stdlib_4 $cebf_stdlib_4
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<<<<<<<<<<[-]>[-]<[-]>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<[->>>>>>>>>>>+<<<<<<<<<<<]>>>>>>>>>>>[-<<<<<<<<<<<+<<<<<<<+>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<[-]>>>>>>>>>>>>>>>>>>[-]>>>[-<<<+>>>]<<<[->>>+<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>]>>>[-]<<<<<<<<<<<<<<<<<<<<<<[>[->+>+<<]>>[-<<+>>]<<<-]>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<[-]<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>+<<<<<]<<<<<<<<<<<<<<<<<[-]>[-]>[-]>>>>>>>>+>>]<<
;;dec $cebf_stdlib_1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<<->>+>>]<<
;;jmp cebf_stdlib_math_power__loop___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>>]<<
;;:cebf_stdlib_math_power__end___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;mpl $cebf_stdlib_4 *$cebf_stdlib_3 $cebf_stdlib_4
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<<<<<<<<<<[-]>[-]<[-]>>>>>>>>>>>>>>>>>>>>[-]>>[-<<+>>]<<[->>+<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<[-]>>>>>>>>>>>>>>>[-]>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<[-]>>>>>>[-<<<<<<+>>>>>>]<<<<<<[->>>>>>+>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>[-<[-<<]<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<[-]>>>[-<<<+>>>]<<<[->>>+>>>>>>>>>>>>+<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>]<[-<<]<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<[-]>>[-<<+>>]<<[->>+>>>>>>>>>>>>+<<<<<<<<<<<<<<]>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>+<[-<<]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]>>>>>>[-]<<<<<<<<<<<<<<<<<<<<<<[>[->+>+<<]>>[-<<+>>]<<<-]>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<[-]<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>+<<<<<]<<<<<<<<<<<<<<<<<[-]>[-]>[-]>>>>>>>>+>>]<<
;;add *$cebf_stdlib_3 $cebf_stdlib_7 *$cebf_stdlib_3
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<<<<<<<<<<[-]>>>>>>>>>>>>>>>>>>>>[-]>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<[-]>>>>>>[-<<<<<<+>>>>>>]<<<<<<[->>>>>>+>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>[-<[-<<]<<<<<<<<<<<+>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<[-]>>>[-<<<+>>>]<<<[->>>+>>>>>>>>>>>>+<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>]<[-<<]<<<<<<<<<<<[->>>>>>>>>>>>>[-]<<<<<<<<<<<<<<[-]>>[-<<+>>]<<[->>+>>>>>>>>>>>>+<<<<<<<<<<<<<<]>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>+<[-<<]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<[-]>>>>>>>>>>>>>>>[-]>>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]<<<<<<<<<[->>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<[->+<]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<[-]>>>>>>[-<<<<<<+>>>>>>]<<<<<<[->>>>>>+>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>[-]<[-<<]<<<<<<<<<<<<<<[-]<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<[-]>>>[-<<<+>>>]<<<[->>>+>>>>>>>>>>>>+<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>+<[-<<]<<<<<<<<<<<<<<]<<<<<<<<<<<<<<<<<[-]>[-]>>>>>>>>>+>>]<<
;;add $cebf_stdlib_4 0 0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<<<<<<<<<<[-]>>>>>>>>>>>>>>>>>>>[-]>>>[-<<<+>>>]<<<[->>>+<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<[-]>>>>>>>>>>>>>>>>>>>[-]>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]<<<<<<<<<<<<<<[->>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<[->+<]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<[-]<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<]<<<<<<<<<<<<<<<<[-]>[-]>>>>>>>>>+>>]<<
;;dec $cebf_stdlib_3
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]>>>>>>>>>-<<<<<<<<<<<+>>]<<
;;dec $cebf_stdlib_2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<->+>>]<<
;;inc $cebf_stdlib_5
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]>>>>>>>>>>>+<<<<<<<<<<<<<+>>]<<
;;jmp cebf_stdlib_string_to_int__loop___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>>]<<
;;:cebf_stdlib_string_to_int__end___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;out💩r 0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]>>>>>>>>>>>>>>>>>>>>>>.<<<<<<<<<<<<<<<<<<<<<<<<+>>]<<
;;exit
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<++++++++++++++>>]<<
;;wrt💩s Writing to file
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]>>>[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]<<<<<+>>]<<
;;;; Hi; you seem to have entered an empty line; The compiler does not like this cause it cannot count reliably; Please not that poop emojis are better in commands than dots 💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;cpy $cebf_interpreter_0 $cebf_stdlib_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<<<[-]>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>+>>>>>>>>>>>]<<<<<<<<+>>]<<
;;set💩n $cebf_interpreter_0 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<<<<<<<<<<<<[-]+>>>>>>>>>>>>+>>]<<
;;wrt💩s "cat /dev/stdin 💩 file💩txt"
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]>>>>>[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]<<<<<<<+>>]<<
;;cpy $cebf_stdlib_0 $cebf_interpreter_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<<<<<<<<<<<<[-]>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<[->>>>>>>>>>>>+<<<<<<<<<<<<]>>>>>>>>>>>>[-<<<<<<<<<<<<+<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<+>>]<<
;;set💩n $cebf_interpreter_0 2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<<<<<<<<<<<<[-]++>>>>>>>>>>>>+>>]<<
;;wrt💩n
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]>>>>>>>>[-].[-]<<<<<<<<<<+>>]<<
;;wrt💩s Written by cebf
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]>>>>[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]<<<<<<+>>]<<
;;set💩n $cebf_interpreter_0 3
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<<<<<<<<<<<<<[-]+++>>>>>>>>>>>>+>>]<<
;;wrt💩n
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]>>>[-].[-]<<<<<+>>]<<
;;wrt💩s Wrote content to file
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]>>>>>>[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]<<<<<<<<+>>]<<
;;;; Hi; you seem to have entered an empty line; The compiler does not like this cause it cannot count reliably; Please not that poop emojis are better in commands than dots 💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; Hi; you seem to have entered an empty line; The compiler does not like this cause it cannot count reliably; Please not that poop emojis are better in commands than dots 💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<+>>]<<
;;;; Hi; you seem to have entered an empty line; The compiler does not like this cause it cannot count reliably; Please not that poop emojis are better in commands than dots 💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]]<<]
