#
# tclsh pascal.tcl <N>
#
# Generates N rows of Pascal's triangle.
#

proc pascal {{lastrow ""}} {
    set res 1
    foreach a [lrange $lastrow 1 end] b $lastrow {
        lappend res [expr $a+$b]
    }
    set res
}

set m [lindex $argv 0]
set v [pascal]
for {set ii 0} {$ii < $m} {incr ii} {
    puts $v
    set v [pascal $v]
}
