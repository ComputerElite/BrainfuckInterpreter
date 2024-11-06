|# setup 12 : 5
++++++++++++>+++>
#     0       1        2           3             4           5
# divident divisor divisor_copy tmp_copy int_div_result modulo_result
# reset cells for calculation
[-]>[-]>[-]<<<<
# Loop until the number is 0
[>
    # Make copy of divisor in cell 2
    [->+>+<<]>>[-<<+>>]<
    # Subtract divisor from dividend
    we're in cell 2 here
    [-<<-
        we're at cell 0
        if dividend gets 0 at any time set flag and stop subtraction
        [
            >>[->>>+<<<]<<
        ]
    >>]
    at cell 2
    # Increment result if subtraction was successful
    [>+<<<]
]
>>#