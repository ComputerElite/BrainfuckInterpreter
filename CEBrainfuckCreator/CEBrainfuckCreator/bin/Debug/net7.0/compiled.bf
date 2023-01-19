>>>>>>>>>>  ;;; Reserve bf compiler memory space
;;#nocomment


;;#omovement


;;#commentcode


;;sad 0 a
;;Assigned memory address 0 the name 'a'


;;sad 1 b
;;Assigned memory address 1 the name 'b'


;;sad 2 res
;;Assigned memory address 2 the name 'res'


;;stn 5 $a
;;   Move pointer from address 10 to 10
;;   Set address value to 5
[-]+++++

;;stn 10 $b
;;   Move pointer from address 10 to 11
>
;;   Set address value to 10
[-]++++++++++

;;mpl $a $b $res
;;   Move pointer from address 11 to 0
<<<<<<<<<<<
;;   Set address value to 0
[-]
;;   Move pointer from address 0 to 1
>
;;   Set address value to 0
[-]
;;   Move pointer from address 1 to 12
>>>>>>>>>>>
;;   Set address value to 0
[-]
;;   Move pointer from address 12 to 9
<<<
;;   Set address value to 0
[-]
;;   Move pointer from address 9 to 9
;;   Set address value to 0
[-]
;;   Move pointer from address 9 to 10
>
;;   Move value from address 10 into 9
[-<+>]
;;   Move pointer from address 10 to 9
<
;;   Move value from address 9 into 10 and 0
[->+<<<<<<<<<<+>>>>>>>>>]
;;   Move pointer from address 9 to 9
;;   Move pointer from address 9 to 9
;;   Set address value to 0
[-]
;;   Move pointer from address 9 to 9
;;   Set address value to 0
[-]
;;   Move pointer from address 9 to 11
>>
;;   Move value from address 11 into 9
[-<<+>>]
;;   Move pointer from address 11 to 9
<<
;;   Move value from address 9 into 11 and 1
[->>+<<<<<<<<<<+>>>>>>>>]
;;   Move pointer from address 9 to 9
;;   Move pointer from address 9 to 0
<<<<<<<<<
;;   current address with next address and store result in the address after
[>[->+>+<<]>>[-<<+>>]<<<-]
;;   Move pointer from address 0 to 9
>>>>>>>>>
;;   Set address value to 0
[-]
;;   Move pointer from address 9 to 9
;;   Set address value to 0
[-]
;;   Move pointer from address 9 to 2
<<<<<<<
;;   Move value from address 2 into 9
[->>>>>>>+<<<<<<<]
;;   Move pointer from address 2 to 9
>>>>>>>
;;   Move value from address 9 into 2 and 12
[-<<<<<<<+>>>>>>>>>>+<<<]
;;   Move pointer from address 9 to 9
;;   Move pointer from address 9 to 0
<<<<<<<<<
;;   Set address value to 0
[-]
;;   Move pointer from address 0 to 1
>
;;   Set address value to 0
[-]
;;   Move pointer from address 1 to 2
>
;;   Set address value to 0
[-]
;;   Move pointer from address 2 to 12
>>>>>>>>>>

