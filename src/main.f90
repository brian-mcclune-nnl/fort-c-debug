program main
    use iso_c_binding
    implicit none
    
    ! Declare the interface to the C function
    interface
        function add_one(n) bind(C, name="add_one")
            use iso_c_binding
            integer(c_int), value :: n
            integer(c_int) :: add_one
        end function add_one
    end interface
    
    integer :: result
    
    result = add_one(41)
    print *, "The answer is:", result
    
end program main
