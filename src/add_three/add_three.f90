module add_three_mod
    use iso_c_binding
    implicit none
    private
    
    public :: add_three

contains
    function add_three(n) result(res)
        integer(c_int), intent(in) :: n
        integer(c_int) :: res
        
        res = n + 3
    end function add_three
end module add_three_mod