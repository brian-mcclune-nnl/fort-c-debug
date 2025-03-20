module add_two_mod
    use iso_c_binding
    implicit none
    private
    
    public :: add_two

contains
    function add_two(n) result(res)
        integer(c_int), intent(in) :: n
        integer(c_int) :: res
        
        res = n + 2
    end function add_two
end module add_two_mod