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
;; alloc: t@0 (real: 36)for 1
;; alloc: s@2 (real: 38)for 6
;; alloc: content_length___call_0@14 (real: 50)for 6
;; alloc: body@28 (real: 64)for 2048
;; alloc: cebf_stdlib_uint16_to_string__has_started___call_0@26 (real: 62)for 1
timeout:1000
#cellsize 65535
>>  ;; Reserve bf interpreter memory space
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  ;; Reserve bf compiler memory space
<<<<<<<<<<<<<<<<<<<<<<<<+[

;; Found macros start
math💩power with 3 arguments and 8 lines
math💩modulo with 3 arguments and 4 lines
math💩divmod with 4 arguments and 5 lines
math💩divide_without_remainder with 3 arguments and 4 lines
bash💩set_command with 1 arguments and 5 lines
bash💩start_command_in_buffer with 0 arguments and 2 lines
bash💩switch_to_process with 1 arguments and 4 lines
bash💩switch_to_console with 0 arguments and 1 lines
bash💩execute_with_stdin_and_print_entire_output with 2 arguments and 14 lines
bash💩kill_process with 0 arguments and 2 lines
bash💩read_stdout_to_end with 1 arguments and 16 lines
bash💩run_command_and_kill_at_end_of_file with 1 arguments and 14 lines
jmp💩eq with 3 arguments and 4 lines
string💩compare with 3 arguments and 22 lines
string💩get_length with 2 arguments and 8 lines
string💩to_int with 2 arguments and 22 lines
out💩int with 1 arguments and 4 lines
in💩line_slow with 1 arguments and 12 lines
in💩line with 1 arguments and 1 lines
uint8💩to_string with 2 arguments and 35 lines
uint16💩to_string with 2 arguments and 35 lines
output_string_in_console with 1 arguments and 3 lines
http💩send_response with 2 arguments and 17 lines

;; Found macros end


;;💩seperatestatemachine

;;💩produceprecompilecebf

;;💩cellsize 65535

;;;;💩minify

;;;;💩commentcode

;;;; Standard library for cebf

;;;; by ComputerElite 2024

;;;;

;;;; The standard library contains macros which are useful for writing programs in cebf💩

;;;; The compiler automatically reserves space for the standard library and you won't have to worry about overwriting any of it's variables when using it💩

;;;; Function to calculate the power of a number

;;;; math💩power 💩base_value_address💩 💩power_value_address💩 💩result_address💩

;;;;macro math💩power 3

;;;;set💩n $2 1

;;;;cpy $1 $cebf_stdlib_1

;;;;:cebf_stdlib_math_power__loop

;;;;jmp💩ez $cebf_stdlib_1 cebf_stdlib_math_power__end

;;;;mpl $0 $2 $2

;;;;dec $cebf_stdlib_1

;;;;jmp cebf_stdlib_math_power__loop

;;;;:cebf_stdlib_math_power__end

;;;;macroend

;;;; From https://esolangs💩org/wiki/brainfuck_algorithms💩Modulo

;;;; Computes the result of a modulo operation

;;;; math💩modulo 💩divident_address💩 💩divisor_address💩 💩result_address💩

;;;;macro math💩modulo 3

;;;;cpy $0 $cebf_compiler_1

;;;;cpy $1 $cebf_compiler_2

;;;;raw $cebf_compiler_0 💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩

;;;;cpy $cebf_compiler_3 $2

;;;;macroend

;;;; From https://esolangs💩org/wiki/brainfuck_algorithms

;;;; Computes the result of a division with remainder

;;;; math💩divide_without_remainder 💩divident_address💩 💩divisor_address💩 💩div_result_address💩 💩mod_result_address💩

;;;;macro math💩divmod 4

;;;;cpy $0 $cebf_compiler_0

;;;;cpy $1 $cebf_compiler_1

;;;;raw $cebf_compiler_0 💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩

;;;;cpy $cebf_compiler_3 $2

;;;;cpy $cebf_compiler_2 $3

;;;;macroend

;;;; Computes the result of a division

;;;; math💩divide_without_remainder 💩divident_address💩 💩divisor_address💩 💩result_address💩

;;;;macro math💩divide_without_remainder 3

;;;;cpy $0 $cebf_compiler_0

;;;;cpy $1 $cebf_compiler_1

;;;;raw $cebf_compiler_2 💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩

;;;;cpy $cebf_compiler_4 $2

;;;;macroend

;;;; Bash library for cebf

;;;; by ComputerElite 2024

;;;;

;;;; The bash library contains macros for interacting with the bash shell

;;;; Appends a command to the cebf interpreter bash command buffer

;;;; bash💩set_command 💩string💩

;;;;macro bash💩set_command 1

;;;;;; save current interpreter output mode for restoring later

;;;;cpy $cebf_interpreter_0 $cebf_stdlib_0

;;;;set💩n $cebf_interpreter_0 1

;;;;wrt💩s $0

;;;;cpy $cebf_stdlib_0 $cebf_interpreter_0

;;;;macroend

;;;; Starts the bash command in the bash buffer of the cebf interpreter💩 out/in streams will be redirected to started command

;;;; bash💩start_command_in_buffer

;;;;macro bash💩start_command_in_buffer 0

;;;;set💩n $cebf_interpreter_0 2

;;;;wrt💩n

;;;;macroend

;;;; Switches to a specified process💩 Expects raw number as argument

;;;; bash💩switch_to_process

;;;;macro bash💩switch_to_process 1

;;;;set💩n $cebf_compiler_0 $0

;;;;set💩n $cebf_interpreter_0 5

;;;;out💩r $cebf_compiler_0

;;;;set💩n $cebf_interpreter_0 0

;;;;macroend

;;;; Usage

;;;; bash💩switch_to_console

;;;;macro bash💩switch_to_console 0

;;;;set💩n $cebf_interpreter_0 4

;;;;macroend

;;;; Borked💩 please fix!!!

;;;; Starts a bash process with the given command💩 The command must be a literal string and not a varable💩 std_in_content_address is a string variable that is written to stdin of the process once it started

;;;; bash💩execute_and_print_entire_output 💩command_as_string💩 💩std_in_content_address💩

;;;;macro bash💩execute_with_stdin_and_print_entire_output 2

;;;;bash💩set_command $0

;;;;bash💩start_command_in_buffer

;;;;;; check if process is running

;;;;set💩n $cebf_interpreter_0 3

;;;;in💩c $cebf_stdlib_1

;;;;jmp💩ez $cebf_stdlib_1 cebf_stdlib_bash_execute_with_stdin_and_print_entire_output__exit

;;;;set💩n $cebf_interpreter_0 0

;;;;:cebf_stdlib_bash_execute_with_stdin_and_print_entire_output__loop

;;;;;; read stdout

;;;;in💩c $cebf_stdlib_0

;;;;jmp💩nz $cebf_interpreter_1 cebf_stdlib_bash_execute_with_stdin_and_print_entire_output__exit

;;;;out💩r $cebf_stdlib_0

;;;;jmp cebf_stdlib_bash_execute_with_stdin_and_print_entire_output__loop

;;;;:cebf_stdlib_bash_execute_with_stdin_and_print_entire_output__exit

;;;;macroend

;;;; KIlls the process running in the cebf interpreter

;;;; bash💩kill_process

;;;;macro bash💩kill_process 0

;;;;set💩n $cebf_interpreter_0 3

;;;;wrt💩n

;;;;macroend

;;;; Reads stdout of the currently running bash process until the end of stream💩 Output will be null terminated

;;;; bash💩read_stdout_to_end 💩start_address💩

;;;;macro bash💩read_stdout_to_end 1

;;;;set💩a $0 $cebf_stdlib_0

;;;;;; check if process is running

;;;;set💩n $cebf_interpreter_0 3

;;;;in💩c $cebf_stdlib_1

;;;;jmp💩ez $cebf_stdlib_1 cebf_stdlib_bash_read_stdout_to_end__end

;;;;set💩n $cebf_interpreter_0 0

;;;;:cebf_stdlib_bash_read_stdout_to_end__loop

;;;;;; read stdout

;;;;in💩c *$cebf_stdlib_0

;;;;inc $cebf_stdlib_0

;;;;jmp💩nz $cebf_interpreter_1 cebf_stdlib_bash_read_stdout_to_end__exit

;;;;jmp cebf_stdlib_bash_read_stdout_to_end__loop

;;;;:cebf_stdlib_bash_read_stdout_to_end__end

;;;;;; null terminate string

;;;;set💩n *$cebf_stdlib_0 0

;;;;:cebf_stdlib_bash_read_stdout_to_end__exit

;;;;macroend

;;;; Executes a bash command and kills it once the end of the output strea💩 was reached💩 Output stream is discarded

;;;; bash💩run_command_and_kill_at_end_of_file 💩command💩

;;;;macro bash💩run_command_and_kill_at_end_of_file 1

;;;;bash💩set_command $0

;;;;bash💩start_command_in_buffer

;;;;;; check if process is running

;;;;set💩n $cebf_interpreter_0 3

;;;;in💩c $cebf_stdlib_1

;;;;jmp💩ez $cebf_stdlib_1 cebf_stdlib_bash_run_command_and_kill_at_end_of_file__exit

;;;;set💩n $cebf_interpreter_0 0

;;;;:cebf_stdlib_bash_run_command_and_kill_at_end_of_file__loop

;;;;;; read stdout

;;;;in💩c $cebf_stdlib_1

;;;;inc $cebf_stdlib_0

;;;;jmp💩nz $cebf_interpreter_1 cebf_stdlib_bash_run_command_and_kill_at_end_of_file__exit

;;;;jmp cebf_stdlib_bash_run_command_and_kill_at_end_of_file__loop

;;;;:cebf_stdlib_bash_run_command_and_kill_at_end_of_file__exit

;;;;macroend

;;;; jump if equal

;;;; jmp💩eq 💩addressA💩 💩addressB💩 💩label💩

;;;;macro jmp💩eq 3

;;;;;; subtract both values from each other

;;;;sub $0 $1 $cebf_stdlib_0

;;;;;; if the result is 0💩 the values are equal and thus we jump

;;;;jmp💩ez $cebf_stdlib_0 $2

;;;;macroend

;;;; compare two strings

;;;; string💩compare 💩addressA💩 💩addressB💩 💩label💩

;;;;macro string💩compare 3

;;;;;; create pointers to the strings

;;;;set💩a $cebf_stdlib_1 $0

;;;;set💩a $cebf_stdlib_2 $1

;;;;jmp cebf_stdlib_string_compare_loop

;;;;;; compare the strings character for character

;;;;:cebf_stdlib_string_compare_pre_loop

;;;;;; move to next characters

;;;;inc $cebf_stdlib_1

;;;;inc $cebf_stdlib_2

;;;;:cebf_stdlib_string_compare_loop

;;;;out💩r *$cebf_stdlib_1

;;;;out💩r *$cebf_stdlib_2

;;;;;; if both characters are equal check what they are

;;;;jmp💩eq *$cebf_stdlib_1 *$cebf_stdlib_2 cebf_stdlib_string_compare_compare_succeeded

;;;;;; now check if any of the strings are null

;;;;jmp cebf_stdlib_string_compare_compare_failed

;;;;:cebf_stdlib_string_compare_compare_succeeded

;;;;;; if the first string is not null💩 we haven't reached the end of the string yet

;;;;jmp💩nz *$cebf_stdlib_1 cebf_stdlib_string_compare_pre_loop

;;;;;; string end reached and they're the same💩 Nice!!

;;;;jmp $2

;;;;:cebf_stdlib_string_compare_compare_failed

;;;;macroend

;;;; Stores the length of a string in a variable

;;;; string💩get_length 💩length_store_address💩 💩string_address💩

;;;;macro string💩get_length 2

;;;;set💩n $0 0

;;;;set💩a $cebf_stdlib_0 $1

;;;;:cebf_stdlib_string_get_length__loop

;;;;jmp💩ez *$cebf_stdlib_0 cebf_stdlib_string_get_length__end

;;;;inc $0

;;;;inc $cebf_stdlib_0

;;;;jmp cebf_stdlib_string_get_length__loop

;;;;:cebf_stdlib_string_get_length__end

;;;;macroend

;;;; Converts a string into an int

;;;; string💩to_int 💩string_address💩 💩int_store_address💩

;;;;macro string💩to_int 2

;;;;;; get length of string

;;;;string💩get_length $cebf_stdlib_2 $0

;;;;set💩a $cebf_stdlib_3 $0

;;;;set💩n $1 0

;;;;dec $cebf_stdlib_2

;;;;add $cebf_stdlib_3 $cebf_stdlib_2 $cebf_stdlib_3 ;; pointer in 3 now points to last char of string aka least significant

;;;;set💩n $cebf_stdlib_5 0 ;; power of 10

;;;;set💩n $cebf_stdlib_6 10 ;; base 10

;;;;set💩n $cebf_stdlib_7 48 ;; ascii to digit conversion magic number

;;;;:cebf_stdlib_string_to_int__loop

;;;;jmp💩ez $cebf_stdlib_2 cebf_stdlib_string_to_int__end

;;;;;; instead of writing back to the original address we could just use another stdlib address but I decided to safe addresses here💩

;;;;sub $cebf_stdlib_7 *$cebf_stdlib_3 *$cebf_stdlib_3 ;; convert ascii to digit

;;;;math💩power $cebf_stdlib_6 $cebf_stdlib_5 $cebf_stdlib_4 ;; calculate power of 10

;;;;mpl $cebf_stdlib_4 *$cebf_stdlib_3 $cebf_stdlib_4 ;; multiply digit with power of 10

;;;;add *$cebf_stdlib_3 $cebf_stdlib_7 *$cebf_stdlib_3 ;; restore damage we did to original memory cell

;;;;add $cebf_stdlib_4 $1 $1 ;; add to result

;;;;dec $cebf_stdlib_3 ;; move to next character

;;;;dec $cebf_stdlib_2 ;; decrement remaining string length

;;;;inc $cebf_stdlib_5 ;; increase power of 10

;;;;jmp cebf_stdlib_string_to_int__loop

;;;;:cebf_stdlib_string_to_int__end

;;;;macroend

;;;; Outputs an int at an address

;;;; out💩int 💩address💩

;;;;macro out💩int 1

;;;;set💩n $cebf_stdlib_1 48

;;;;cpy $0 $cebf_stdlib_0

;;;;add $cebf_stdlib_1 $cebf_stdlib_0 $cebf_stdlib_0

;;;;out💩r $cebf_stdlib_0

;;;;macroend

;;;; Slow pure CEBF implementation for in💩line

;;;; in💩line_slow 💩address💩

;;;;macro in💩line_slow 1

;;;;all cebf_stdlib_in_line__input_pointer 1

;;;;all cebf_stdlib_in_line__new_line 1

;;;;set💩a $cebf_stdlib_in_line__input_pointer $0

;;;;set💩n $cebf_stdlib_in_line__new_line 10

;;;;:cebf_stdlib_in_line__input_loop

;;;;in💩c *$cebf_stdlib_in_line__input_pointer

;;;;jmp💩eq *$cebf_stdlib_in_line__input_pointer $cebf_stdlib_in_line__new_line cebf_stdlib_in_line__done

;;;;inc $cebf_stdlib_in_line__input_pointer

;;;;jmp cebf_stdlib_in_line__input_loop

;;;;:cebf_stdlib_in_line__done

;;;;fre cebf_stdlib_in_line__input_pointer

;;;;fre cebf_stdlib_in_line__new_line

;;;;macroend

;;;; reads a line into the given address💩 null terminated

;;;; in💩line 💩address💩

;;;;macro in💩line 1

;;;;raw $0 💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩

;;;;macroend

;;;; Converts n int to a string

;;;; uint8💩to_string 💩int💩 💩string_address💩

;;;;macro uint8💩to_string 2

;;;;all cebf_stdlib_uint8_to_string__tmp_int 1

;;;;cpy $0 $cebf_stdlib_uint8_to_string__tmp_int

;;;;all cebf_stdlib_uint8_to_string__current_power_of_ten 1

;;;;set💩n $cebf_stdlib_uint8_to_string__current_power_of_ten 4

;;;;all cebf_stdlib_uint8_to_string__base 1

;;;;set💩n $cebf_stdlib_uint8_to_string__base 10

;;;;all cebf_stdlib_uint8_to_string__current_digit_value 1

;;;;all cebf_stdlib_uint8_to_string__str_pointer 1

;;;;set💩a $cebf_stdlib_uint8_to_string__str_pointer $1

;;;;all cebf_stdlib_uint8_to_string__forty_eight 1

;;;;set💩n $cebf_stdlib_uint8_to_string__forty_eight 48

;;;;all cebf_stdlib_uint8_to_string__has_started 1

;;;;set💩n $cebf_stdlib_uint8_to_string__has_started 0

;;;;:cebf_stdlib_uint8_to_string__skip_leading_zeros

;;;;jmp💩nz $cebf_stdlib_uint8_to_string__has_started cebf_stdlib_uint8_to_string__continue_anyway

;;;;dec $cebf_stdlib_uint8_to_string__current_power_of_ten

;;;;:loop

;;;;math💩power $cebf_stdlib_uint8_to_string__base $cebf_stdlib_uint8_to_string__current_power_of_ten $cebf_stdlib_uint8_to_string__current_digit_value

;;;;math💩divmod $cebf_stdlib_uint8_to_string__tmp_int $cebf_stdlib_uint8_to_string__current_digit_value $cebf_stdlib_uint8_to_string__current_digit_value $cebf_stdlib_uint8_to_string__tmp_int

;;;;jmp💩ez $cebf_stdlib_uint8_to_string__current_digit_value cebf_stdlib_uint8_to_string__skip_leading_zeros

;;;;:cebf_stdlib_uint8_to_string__continue_anyway

;;;;set💩n $cebf_stdlib_uint8_to_string__has_started 1

;;;;add $cebf_stdlib_uint8_to_string__forty_eight $cebf_stdlib_uint8_to_string__current_digit_value $cebf_stdlib_uint8_to_string__current_digit_value

;;;;cpy $cebf_stdlib_uint8_to_string__current_digit_value *$cebf_stdlib_uint8_to_string__str_pointer

;;;;inc $cebf_stdlib_uint8_to_string__str_pointer

;;;;jmp💩ez $cebf_stdlib_uint8_to_string__current_power_of_ten cebf_stdlib_int_to_string__end

;;;;dec $cebf_stdlib_uint8_to_string__current_power_of_ten

;;;;jmp loop

;;;;:cebf_stdlib_int_to_string__end

;;;;fre cebf_stdlib_uint8_to_string__tmp_int

;;;;fre cebf_stdlib_uint8_to_string__current_power_of_ten

;;;;fre cebf_stdlib_uint8_to_string__base

;;;;fre cebf_stdlib_uint8_to_string__current_digit_value

;;;;fre cebf_stdlib_uint8_to_string__str_pointer

;;;;fre cebf_stdlib_uint8_to_string__forty_eight

;;;;macroend

;;;; Converts n int to a string

;;;; uint16💩to_string 💩int💩 💩string_address💩

;;;;macro uint16💩to_string 2

;;;;all cebf_stdlib_uint16_to_string__tmp_int 1

;;;;cpy $0 $cebf_stdlib_uint16_to_string__tmp_int

;;;;all cebf_stdlib_uint16_to_string__current_power_of_ten 1

;;;;set💩n $cebf_stdlib_uint16_to_string__current_power_of_ten 5

;;;;all cebf_stdlib_uint16_to_string__base 1

;;;;set💩n $cebf_stdlib_uint16_to_string__base 10

;;;;all cebf_stdlib_uint16_to_string__current_digit_value 1

;;;;all cebf_stdlib_uint16_to_string__str_pointer 1

;;;;set💩a $cebf_stdlib_uint16_to_string__str_pointer $1

;;;;all cebf_stdlib_uint16_to_string__forty_eight 1

;;;;set💩n $cebf_stdlib_uint16_to_string__forty_eight 48

;;;;all cebf_stdlib_uint16_to_string__has_started 1

;;;;set💩n $cebf_stdlib_uint16_to_string__has_started 0

;;;;:cebf_stdlib_uint16_to_string__skip_leading_zeros

;;;;jmp💩nz $cebf_stdlib_uint16_to_string__has_started cebf_stdlib_uint16_to_string__continue_anyway

;;;;dec $cebf_stdlib_uint16_to_string__current_power_of_ten

;;;;:loop

;;;;math💩power $cebf_stdlib_uint16_to_string__base $cebf_stdlib_uint16_to_string__current_power_of_ten $cebf_stdlib_uint16_to_string__current_digit_value

;;;;math💩divmod $cebf_stdlib_uint16_to_string__tmp_int $cebf_stdlib_uint16_to_string__current_digit_value $cebf_stdlib_uint16_to_string__current_digit_value $cebf_stdlib_uint16_to_string__tmp_int

;;;;jmp💩ez $cebf_stdlib_uint16_to_string__current_digit_value cebf_stdlib_uint16_to_string__skip_leading_zeros

;;;;:cebf_stdlib_uint16_to_string__continue_anyway

;;;;set💩n $cebf_stdlib_uint16_to_string__has_started 1

;;;;add $cebf_stdlib_uint16_to_string__forty_eight $cebf_stdlib_uint16_to_string__current_digit_value $cebf_stdlib_uint16_to_string__current_digit_value

;;;;cpy $cebf_stdlib_uint16_to_string__current_digit_value *$cebf_stdlib_uint16_to_string__str_pointer

;;;;inc $cebf_stdlib_uint16_to_string__str_pointer

;;;;jmp💩ez $cebf_stdlib_uint16_to_string__current_power_of_ten cebf_stdlib_int_to_string__end

;;;;dec $cebf_stdlib_uint16_to_string__current_power_of_ten

;;;;jmp loop

;;;;:cebf_stdlib_int_to_string__end

;;;;fre cebf_stdlib_uint16_to_string__tmp_int

;;;;fre cebf_stdlib_uint16_to_string__current_power_of_ten

;;;;fre cebf_stdlib_uint16_to_string__base

;;;;fre cebf_stdlib_uint16_to_string__current_digit_value

;;;;fre cebf_stdlib_uint16_to_string__str_pointer

;;;;fre cebf_stdlib_uint16_to_string__forty_eight

;;;;macroend

;;;;all a 1

;;;;all str 3

;;;;set💩n $a 5

;;;;int8💩to_string $a $str

;;;;out💩n $str

;;all t 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;all s 6
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;set💩n $t 10657
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++<<<<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;all cebf_stdlib_uint16_to_string__tmp_int___call_0 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;cpy $t $cebf_stdlib_uint16_to_string__tmp_int___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[-]>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>+>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]<<<<<
+>>]<<
;;all cebf_stdlib_uint16_to_string__current_power_of_ten___call_0 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;set💩n $cebf_stdlib_uint16_to_string__current_power_of_ten___call_0 5
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]+++++<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;all cebf_stdlib_uint16_to_string__base___call_0 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;set💩n $cebf_stdlib_uint16_to_string__base___call_0 10
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]++++++++++<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;all cebf_stdlib_uint16_to_string__current_digit_value___call_0 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;all cebf_stdlib_uint16_to_string__str_pointer___call_0 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;set💩a $cebf_stdlib_uint16_to_string__str_pointer___call_0 $s
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;all cebf_stdlib_uint16_to_string__forty_eight___call_0 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;set💩n $cebf_stdlib_uint16_to_string__forty_eight___call_0 48
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]++++++++++++++++++++++++++++++++++++++++++++++++<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;all cebf_stdlib_uint16_to_string__has_started___call_0 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;set💩n $cebf_stdlib_uint16_to_string__has_started___call_0 0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;:cebf_stdlib_uint16_to_string__skip_leading_zeros___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;jmp💩nz $cebf_stdlib_uint16_to_string__has_started___call_0 cebf_stdlib_uint16_to_string__continue_anyway___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>[-]>>>[-]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>]<<[-]+<[[-]>[-]<<<<+++++++++++++++++>>>]>[[-]<<<<+>>>>]<<<<
>>]<<
;;dec $cebf_stdlib_uint16_to_string__current_power_of_ten___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;:loop___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;set💩n $cebf_stdlib_uint16_to_string__current_digit_value___call_0 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;cpy $cebf_stdlib_uint16_to_string__current_power_of_ten___call_0 $cebf_stdlib_1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<[-]>>>>>>>>>[-]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>]<<<<<<<
+>>]<<
;;:cebf_stdlib_math_power__loop___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;jmp💩ez $cebf_stdlib_1 cebf_stdlib_math_power__end___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>[-]>>>>>[-]<<<<<<<<<<[->>>>>>>>>>+<<<<<<<<<<]>>>>>>>>>>[-<<<<<<<<<<+>>>>>+>>>>>]<<<<[-]+<[[-]>[-]<<<<+>>>]>[[-]<<<<++++>>>>]<<<<
>>]<<
;;mpl $cebf_stdlib_uint16_to_string__base___call_0 $cebf_stdlib_uint16_to_string__current_digit_value___call_0 $cebf_stdlib_uint16_to_string__current_digit_value___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<<<<<<<<[-]>[-]<[-]>>>>>>>>>>>>>>>>>>>[-]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<[-]>>>>>>>>>>>>>>>>>>>[-]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[-]>[-]<<<[>[->+>+<<]>>[-<<+>>]<<<-]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[-]<<<<<<<<<<<<<[->>>>>>>>>>>>>+<<<<<<<<<<<<<]>>>>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]<<<<<<<<<<<<<<<[-]>[-]>[-]>>>>>>>>
+>>]<<
;;dec $cebf_stdlib_1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<->>
+>>]<<
;;jmp cebf_stdlib_math_power__loop___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>>]<<
;;:cebf_stdlib_math_power__end___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;cpy $cebf_stdlib_uint16_to_string__tmp_int___call_0 $cebf_compiler_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<<<<<<<<[-]>>>>>>>>>>>>>>>>[-]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]<<<<<<
+>>]<<
;;cpy $cebf_stdlib_uint16_to_string__current_digit_value___call_0 $cebf_compiler_1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<<<<<<<[-]>>>>>>>>>>>>>>>>[-]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]<<<<<<<
+>>]<<
;;raw $cebf_compiler_0 💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<<<<<<[-]>[-]<<<[->[->+>>]>[<<+>>[-<+>]>+>>]<<<<<]>[>>>]>[[-<+>]>+>>]>>>>>
+>>]<<
;;cpy $cebf_compiler_3 $cebf_stdlib_uint16_to_string__current_digit_value___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[-]<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]<<<<<<<<
+>>]<<
;;cpy $cebf_compiler_2 $cebf_stdlib_uint16_to_string__tmp_int___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[-]<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]<<<<<<<<<
+>>]<<
;;jmp💩ez $cebf_stdlib_uint16_to_string__current_digit_value___call_0 cebf_stdlib_uint16_to_string__skip_leading_zeros___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>[-]>>>>>>>[-]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>]<<<<<<[-]+<[[-]>[-]<<<<+>>>]>[[-]<<<<++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>>>>]<<<<
>>]<<
;;:cebf_stdlib_uint16_to_string__continue_anyway___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;set💩n $cebf_stdlib_uint16_to_string__has_started___call_0 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;add $cebf_stdlib_uint16_to_string__forty_eight___call_0 $cebf_stdlib_uint16_to_string__current_digit_value___call_0 $cebf_stdlib_uint16_to_string__current_digit_value___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<<<<<<<<[-]>>>>>>>>>>>>>>>[-]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<[-]>>>>>>>>>>>>>>>[-]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<[->+<]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[-]<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]<<<<<<<<<<<<<<<<<[-]>[-]>>>>>>>>>
+>>]<<
;;cpy $cebf_stdlib_uint16_to_string__current_digit_value___call_0 *$cebf_stdlib_uint16_to_string__str_pointer___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<[-]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<+<<<<<<<<<<<<<<]>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>[-]<[-<<]<<<<<<<<<<<<<[-]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<[-]<<<<<<<<<<<<<[-]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<+<<<<<<<<<<<<<]>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>+<[-<<]<<<<<<<<<<<<<]<<<<<<<<
+>>]<<
;;inc $cebf_stdlib_uint16_to_string__str_pointer___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;jmp💩ez $cebf_stdlib_uint16_to_string__current_power_of_ten___call_0 cebf_stdlib_int_to_string__end___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>[-]>>[-]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>]<[-]+<[[-]>[-]<<<<+>>>]>[[-]<<<<+++>>>>]<<<<
>>]<<
;;dec $cebf_stdlib_uint16_to_string__current_power_of_ten___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;jmp loop___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>>]<<
;;:cebf_stdlib_int_to_string__end___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;fre cebf_stdlib_uint16_to_string__tmp_int___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;fre cebf_stdlib_uint16_to_string__current_power_of_ten___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;fre cebf_stdlib_uint16_to_string__base___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;fre cebf_stdlib_uint16_to_string__current_digit_value___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;fre cebf_stdlib_uint16_to_string__str_pointer___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;fre cebf_stdlib_uint16_to_string__forty_eight___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;out💩n $s
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>[.>+>]<[-<<]<<<<<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;exit
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       ++++++++++++++++++++++++++++++++++++++++++
>>]<<
;;;; Outputs a string at the specified address to the console and then switches back to process outputs

;;;; output_string_in_console 💩string_address💩

;;;;macro output_string_in_console 1

;;;;bash💩switch_to_console

;;;;out💩n $0

;;;;bash💩switch_to_process 0

;;;;macroend

;;;; response_code is a directly passed string💩 response body a address

;;;; http💩send_response 💩response_code💩 💩response_body💩

;;;;macro http💩send_response 2

;;;;;; Send the response code

;;;;wrt💩s "HTTP/1💩1 "

;;;;wrt💩s $0

;;;;wrt💩s " OK\r\n"

;;;;wrt💩s "Server: brainfuck\r\n"

;;;;all content_length 6 ;; may need to be increased

;;;;string💩get_length $content_length $1

;;;;raw $content_length 💩

;;;;wrt💩s "Content💩Length: "

;;;;int8💩to_string $content_length $content_length

;;;;out💩n $content_length

;;;;wrt💩s "\r\nConnection: close\r\n"

;;;;wrt💩s "Content💩Type: text/plain\r\n"

;;;;wrt💩s "\r\n"

;;;;;; Send the response body

;;;;out💩n $1

;;;;;;

;;;;macroend

;;;; Connect with a netcat server

;;:handle_new_connection
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;;; Here we recreate the netcat process to accept new requests

;;set💩n $cebf_compiler_0 0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<<<<<<<<[-]>>>>>>>>>>
+>>]<<
;;set💩n $cebf_interpreter_0 5
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<<<<<<<<<<[-]+++++>>>>>>>>>>>>
+>>]<<
;;out💩r $cebf_compiler_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<<<<<<<<.>>>>>>>>>>
+>>]<<
;;set💩n $cebf_interpreter_0 0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<<<<<<<<<<[-]>>>>>>>>>>>>
+>>]<<
;;set💩n $cebf_interpreter_0 3
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<<<<<<<<<<[-]+++>>>>>>>>>>>>
+>>]<<
;;wrt💩n
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>[-].[-]<<<<<<
+>>]<<
;;;; Hi; you seem to have entered an empty line; The compiler does not like this cause it cannot count reliably; Please not that poop emojis are better in commands than dots 💩

;;cpy $cebf_interpreter_0 $cebf_stdlib_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<[-]>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>+>>>>>>>>>>]<<<<<<<
+>>]<<
;;set💩n $cebf_interpreter_0 1
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<<<<<<<<<<[-]+>>>>>>>>>>>>
+>>]<<
;;wrt💩s "nc 💩lvnp 5000"
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++.[-]<<<<<<<<<
+>>]<<
;;cpy $cebf_stdlib_0 $cebf_interpreter_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<<<<<<<<<<[-]>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<[->>>>>>>>>>>>>+<<<<<<<<<<<<<]>>>>>>>>>>>>>[-<<<<<<<<<<<<<+<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<
+>>]<<
;;;;bash💩set_command "cat 💩💩 response💩txt"

;;set💩n $cebf_interpreter_0 2
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<<<<<<<<<<[-]++>>>>>>>>>>>>
+>>]<<
;;wrt💩n
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>[-].[-]<<<<<<<<
+>>]<<
;;set💩n $cebf_interpreter_0 4
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<<<<<<<<<<[-]++++>>>>>>>>>>>>
+>>]<<
;;wrt💩s "Started netcat listener on port 5000\n"
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++.[-]<<<<<
+>>]<<
;;set💩n $cebf_compiler_0 0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<<<<<<<<[-]>>>>>>>>>>
+>>]<<
;;set💩n $cebf_interpreter_0 5
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<<<<<<<<<<[-]+++++>>>>>>>>>>>>
+>>]<<
;;out💩r $cebf_compiler_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<<<<<<<<.>>>>>>>>>>
+>>]<<
;;set💩n $cebf_interpreter_0 0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<<<<<<<<<<[-]>>>>>>>>>>>>
+>>]<<
;;all body 2048 ;; 2048 bytes buffer for body
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;;; First line is connection by netcat💩 just output it

;;raw $body 💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]+[,>[-]>[-]<<[->+>+<<]>[-<+>]+>----------]<[-<<]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;set💩s $body "Hello world!"
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>>[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>>[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>>[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>>[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>>[-]++++++++++++++++++++++++++++++++>>[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>>[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>>[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>>[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>>[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>>[-]+++++++++++++++++++++++++++++++++>>[-]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;;; Hi; you seem to have entered an empty line; The compiler does not like this cause it cannot count reliably; Please not that poop emojis are better in commands than dots 💩

;;wrt💩s "HTTP/1💩1 "
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]<<<<<<
+>>]<<
;;wrt💩s "200
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>[-]++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++.[-]<<<<<<<
+>>]<<
;;wrt💩s  OK\r\n
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>[-]++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++.[-]++++++++++.[-]<<<<<<<<<
+>>]<<
;;wrt💩s "Server: brainfuck\r\n"
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++.[-]++++++++++.[-]<<<<<<<<<<
+>>]<<
;;all content_length___call_0 6
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;set💩n $content_length___call_0 0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;set💩a $cebf_stdlib_0 $body
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<[-]++++++++++++++>>>
+>>]<<
;;:cebf_stdlib_string_get_length__loop___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;jmp💩ez *$cebf_stdlib_0 cebf_stdlib_string_get_length__end___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>[-]>>>>>[-]>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<[-]<<<<<<<<[->>>>>>>>+<<<<<<<<]>>>>>>>>[-<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>[-<[-<<]<<<<<<<<<<<<<+>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<[-]<<<<<<<<<[->>>>>>>>>+<<<<<<<<<]>>>>>>>>>[-<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>]<[-<<]<<<<<<<<<<<<<[->>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<[-]<<<<<<<<<<[->>>>>>>>>>+<<<<<<<<<<]>>>>>>>>>>[-<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<]>>>>>>>>>>>>>>>>[>>[-]<<[>>+<<-]+>>-]+>+<[-<<]<<<<<<<<<<<<<<<<<<+>>>>>]<<<<[-]+<[[-]>[-]<<<<+>>>]>[[-]<<<<++++>>>>]<<<<
>>]<<
;;inc $content_length___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;inc $cebf_stdlib_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       <<<+>>>
+>>]<<
;;jmp cebf_stdlib_string_get_length__loop___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>>]<<
;;:cebf_stdlib_string_get_length__end___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;raw $content_length___call_0 💩
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;wrt💩s "Content💩Length: "
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]<<<<<<<<<
+>>]<<
;;int8💩to_string $content_length___call_0 $content_length___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       
+>>]<<
;;out💩n $content_length___call_0
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[.>+>]<[-<<]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;wrt💩s "\r\nConnection: close\r\n"
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>[-]+++++++++++++.[-]++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++.[-]++++++++++.[-]<<<<<<<<<<
+>>]<<
;;wrt💩s "Content💩Type: text/plain\r\n"
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.[-]+++++++++++++.[-]++++++++++.[-]<<<<<
+>>]<<
;;wrt💩s "\r\n
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>[-]+++++++++++++.[-]++++++++++.[-]<<<<<<
+>>]<<
;;;; Hi; you seem to have entered an empty line; The compiler does not like this cause it cannot count reliably; Please not that poop emojis are better in commands than dots 💩

;;out💩n $body
-[->+>+<<]>>[-<<+>>]+<[>[-]<[-]]>[[-]<<
       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[.>+>]<[-<<]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
+>>]<<
;;;; Hi; you seem to have entered an empty line; The compiler does not like this cause it cannot count reliably; Please not that poop emojis are better in commands than dots 💩
]
