>>>>>>>>>>  ;;; Reserve bf compiler memory space
;;#nocomment


;;#commentcode


;;sad 0 a
;;Assigned memory address 0 the name 'a'


;;sad 1 b
;;Assigned memory address 1 the name 'b'


;;sad 2 c
;;Assigned memory address 2 the name 'c'


;;sad 3 ab
;;Assigned memory address 3 the name 'ab'


;;sad 4 ac
;;Assigned memory address 4 the name 'ac'


;;sad 5 res
;;Assigned memory address 5 the name 'res'


;;stn 1 $a
;;Move pointer from address 0 to 0
;;Set address value to 1
[-]+

;;stn 0 $b
;;Move pointer from address 0 to 1
>
;;Set address value to 0
[-]

;;stn 1 $c
;;Move pointer from address 1 to 2
>
;;Set address value to 1
[-]+

;;and $a $b $ab
;;Move pointer from address 2 to -10
<<<<<<<<<<<<
;;Set address value to 0
[-]
;;Move pointer from address -10 to -9
>
;;Set address value to 0
[-]
;;Move pointer from address -9 to 3
>>>>>>>>>>>>
;;Set address value to 0
[-]
;;Move pointer from address 3 to -5
<<<<<<<<
;;Set address value to 0
[-]
;;Move pointer from address -5 to 0
>>>>>
;;Move value from address 0 into -5
[-<<<<<+>>>>>]
;;Move pointer from address 0 to -5
<<<<<
;;Move value from address -5 into 0 and -10
[->>>>>+<<<<<<<<<<+>>>>>]
;;Move pointer from address -5 to -5
;;Move pointer from address -5 to -5
;;Set address value to 0
[-]
;;Move pointer from address -5 to 1
>>>>>>
;;Move value from address 1 into -5
[-<<<<<<+>>>>>>]
;;Move pointer from address 1 to -5
<<<<<<
;;Move value from address -5 into 1 and -9
[->>>>>>+<<<<<<<<<<+>>>>]
;;Move pointer from address -5 to -5
;;Move pointer from address -5 to -10
<<<<<
;;Perform AND operation on 0 and 1 and store result in 3
[->+<]++[->-<]>>[-]+<[>-<[-]]<
;;Move pointer from address -10 to -5
>>>>>
;;Set address value to 0
[-]
;;Move pointer from address -5 to -8
<<<
;;Move value from address -8 into -5
[->>>+<<<]
;;Move pointer from address -8 to -5
>>>
;;Move value from address -5 into -8 and 3
[-<<<+>>>>>>>>>>>+<<<<<<<<]
;;Move pointer from address -5 to -5
;;Move pointer from address -5 to 3
>>>>>>>>
;;Move pointer from address 3 to -10
<<<<<<<<<<<<<
;;Set address value to 0
[-]
;;Move pointer from address -10 to -9
>
;;Set address value to 0
[-]
;;Move pointer from address -9 to -8
>
;;Set address value to 0
[-]

;;and $a $c $ac
;;Move pointer from address -8 to -10
<<
;;Set address value to 0
[-]
;;Move pointer from address -10 to -9
>
;;Set address value to 0
[-]
;;Move pointer from address -9 to 4
>>>>>>>>>>>>>
;;Set address value to 0
[-]
;;Move pointer from address 4 to -5
<<<<<<<<<
;;Set address value to 0
[-]
;;Move pointer from address -5 to 0
>>>>>
;;Move value from address 0 into -5
[-<<<<<+>>>>>]
;;Move pointer from address 0 to -5
<<<<<
;;Move value from address -5 into 0 and -10
[->>>>>+<<<<<<<<<<+>>>>>]
;;Move pointer from address -5 to -5
;;Move pointer from address -5 to -5
;;Set address value to 0
[-]
;;Move pointer from address -5 to 2
>>>>>>>
;;Move value from address 2 into -5
[-<<<<<<<+>>>>>>>]
;;Move pointer from address 2 to -5
<<<<<<<
;;Move value from address -5 into 2 and -9
[->>>>>>>+<<<<<<<<<<<+>>>>]
;;Move pointer from address -5 to -5
;;Move pointer from address -5 to -10
<<<<<
;;Perform AND operation on 0 and 2 and store result in 4
[->+<]++[->-<]>>[-]+<[>-<[-]]<
;;Move pointer from address -10 to -5
>>>>>
;;Set address value to 0
[-]
;;Move pointer from address -5 to -8
<<<
;;Move value from address -8 into -5
[->>>+<<<]
;;Move pointer from address -8 to -5
>>>
;;Move value from address -5 into -8 and 4
[-<<<+>>>>>>>>>>>>+<<<<<<<<<]
;;Move pointer from address -5 to -5
;;Move pointer from address -5 to 4
>>>>>>>>>
;;Move pointer from address 4 to -10
<<<<<<<<<<<<<<
;;Set address value to 0
[-]
;;Move pointer from address -10 to -9
>
;;Set address value to 0
[-]
;;Move pointer from address -9 to -8
>
;;Set address value to 0
[-]

;;oor $ab $ac $res
;;Move pointer from address -8 to -10
<<
;;Set address value to 0
[-]
;;Move pointer from address -10 to -9
>
;;Set address value to 0
[-]
;;Move pointer from address -9 to 5
>>>>>>>>>>>>>>
;;Set address value to 0
[-]
;;Move pointer from address 5 to -5
<<<<<<<<<<
;;Set address value to 0
[-]
;;Move pointer from address -5 to 3
>>>>>>>>
;;Move value from address 3 into -5
[-<<<<<<<<+>>>>>>>>]
;;Move pointer from address 3 to -5
<<<<<<<<
;;Move value from address -5 into 3 and -10
[->>>>>>>>+<<<<<<<<<<<<<+>>>>>]
;;Move pointer from address -5 to -5
;;Move pointer from address -5 to -5
;;Set address value to 0
[-]
;;Move pointer from address -5 to 4
>>>>>>>>>
;;Move value from address 4 into -5
[-<<<<<<<<<+>>>>>>>>>]
;;Move pointer from address 4 to -5
<<<<<<<<<
;;Move value from address -5 into 4 and -9
[->>>>>>>>>+<<<<<<<<<<<<<+>>>>]
;;Move pointer from address -5 to -5
;;Move pointer from address -5 to -10
<<<<<
;;Perform OR operation on 3 and 4 and store result in 5
[->+<]>>[-]<[>+<[-]]<
;;Move pointer from address -10 to -5
>>>>>
;;Set address value to 0
[-]
;;Move pointer from address -5 to -8
<<<
;;Move value from address -8 into -5
[->>>+<<<]
;;Move pointer from address -8 to -5
>>>
;;Move value from address -5 into -8 and 5
[-<<<+>>>>>>>>>>>>>+<<<<<<<<<<]
;;Move pointer from address -5 to -5
;;Move pointer from address -5 to 5
>>>>>>>>>>
;;Move pointer from address 5 to -10
<<<<<<<<<<<<<<<
;;Set address value to 0
[-]
;;Move pointer from address -10 to -9
>
;;Set address value to 0
[-]
;;Move pointer from address -9 to -8
>
;;Set address value to 0
[-]

;;mov $res
;;Move pointer from address -8 to 5
>>>>>>>>>>>>>

