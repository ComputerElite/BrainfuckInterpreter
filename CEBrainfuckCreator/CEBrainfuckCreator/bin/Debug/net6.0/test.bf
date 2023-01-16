>>>>>>>>>>  ;;; Reserve bf compiler memory space
;;;; stc value address                sets value into address (character)

;;;; stn value address                sets value into address (number)

;;;; oua address                      outputs at address

;;;; cpy addressA addressB            copies addressA to addressB

;;;; mpl addressA addressB addressC   multiplies addressA and addressB and stores in addressC

;;;; add addressA addressB addressC   adds addressA and addressB and stores in addressC

;;;; sub addressA addressB addressC   subtracts addressA from addressB and stores in addressC

;;

;;;; reserved characters:

;;;;     ^ => space

;;

;;stn 5 0
+++++
;;stn 7 1
>+++++++
;;mpl 0 1 2
<<<<<<[-]>>>>>[-<<<<<+>>>>>]<<<<<[->>>>>+<<<<<<<<<<+>>>>>][-]>>>>>>[-<<<<<<+>>>>>>]<<<<<<[->>>>>>+<<<<<<<<<<+>>>>]<<<<<[>[->+>+<<]>>[-<<+>>]<<<-]>>>>>[-]<<<[->>>+<<<]>>>[-<<<+>>>>>>>>>>+<<<<<<<]<<<<<[-]>[-]>[-]