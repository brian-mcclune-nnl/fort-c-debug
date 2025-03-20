program main
    use iso_c_binding
    use add_two_mod
    use add_three_mod
    implicit none
    
    ! Declare the interface to the C function
    interface
        function add_one(n) bind(C, name="add_one")
            use iso_c_binding
            integer(c_int), value :: n
            integer(c_int) :: add_one
        end function add_one
    end interface
    
    integer :: num, result1, result2, result3, total
    
    num = 10
    
    ! Use all three functions
    result1 = add_one(num)
    result2 = add_two(num)
    result3 = add_three(num)
    
    total = result1 + result2 + result3
    
    print *, "Starting with:", num
    print *, "After add_one:", result1
    print *, "After add_two:", result2
    print *, "After add_three:", result3
    print *, "Sum of all results:", total
    
end program main