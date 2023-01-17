>>>>>>>>>>  ;;; Reserve bf compiler memory space
;;;; stc value address                sets value into address (character)

;;;; stn value address                sets value into address (number)

;;;; sts value startAddress           Adds a null terminated string starting at the startAddress

;;;; oua address                      outputs at address

;;;; oum startAddress length          outputs length addresses starting at startAddress

;;;; oun startAddress                 outputs all memory addresses incrementally till it hits null

;;;; inc address                      Saves a input character to the address

;;;; cpy addressA addressB            copies addressA to addressB

;;;; mpl addressA addressB addressC   multiplies addressA and addressB and stores in addressC

;;;; add addressA addressB addressC   adds addressA and addressB and stores in addressC

;;;; sub addressA addressB addressC   subtracts addressA from addressB and stores in addressC

;;;;

;;;; GATES

;;;; and addressA addressB addressC   and gate, if a and b then c is 1

;;;; oor addressA addressB addressC   or gate, if a or b then c is 1

;;;;

;;;; dbg                              Shows debug output on brainfuck helper vsc extension

;;;; sad address name                 gives an address a name you can use and access with $name on everything that uses addresses

;;;;     e. g. sad 10 test

;;;;           stn 10 $test

;;

;;;; reserved characters:

;;;;     ^ => space

;;

;;;; set a, b, c variable names

;;sad 0 a

;;sad 1 b

;;sad 2 c

;;sad 3 ab

;;sad 4 ac

;;sad 5 res

;;

;;;; set values of a, b and c

;;stn 1 $a
+
;;stn 0 $b
>
;;stn 1 $c
>+
;;

;;and $a $b $ab
<<<<<<<<<<<<[-]>[-]>>>>>>>>>>>>[-]<<<<<<<<[-]>>>>>[-<<<<<+>>>>>]<<<<<[->>>>>+<<<<<<<<<<+>>>>>][-]>>>>>>[-<<<<<<+>>>>>>]<<<<<<[->>>>>>+<<<<<<<<<<+>>>>]<<<<<[->+<]++[->-<]>>[-]+<[>-<[-]]<>>>>>[-]<<<[->>>+<<<]>>>[-<<<+>>>>>>>>>>>+<<<<<<<<]>>>>>>>><<<<<<<<<<<<<[-]>[-]>[-]
;;and $a $c $ac
<<[-]>[-]>>>>>>>>>>>>>[-]<<<<<<<<<[-]>>>>>[-<<<<<+>>>>>]<<<<<[->>>>>+<<<<<<<<<<+>>>>>][-]>>>>>>>[-<<<<<<<+>>>>>>>]<<<<<<<[->>>>>>>+<<<<<<<<<<<+>>>>]<<<<<[->+<]++[->-<]>>[-]+<[>-<[-]]<>>>>>[-]<<<[->>>+<<<]>>>[-<<<+>>>>>>>>>>>>+<<<<<<<<<]>>>>>>>>><<<<<<<<<<<<<<[-]>[-]>[-]
;;

;;oor $ab $ac $res
<<[-]>[-]>>>>>>>>>>>>>>[-]<<<<<<<<<<[-]>>>>>>>>[-<<<<<<<<+>>>>>>>>]<<<<<<<<[->>>>>>>>+<<<<<<<<<<<<<+>>>>>][-]>>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]<<<<<<<<<[->>>>>>>>>+<<<<<<<<<<<<<+>>>>]<<<<<[->+<]>>[-]<[>+<[-]]<>>>>>[-]<<<[->>>+<<<]>>>[-<<<+>>>>>>>>>>>>>+<<<<<<<<<<]>>>>>>>>>><<<<<<<<<<<<<<<[-]>[-]>[-]