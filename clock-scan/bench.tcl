

proc clockscan {} {
	for {set year 1970} {$year < 2015} {incr year} {
		for {set month 1} {$month <= 12} {incr month} {
			for {set day 1} {$day <= 28} {incr day} {
				set result [clock scan "$month/$day/$year 00:00"]
				set fmty [clock format $result -gmt 1]
				#set result2 [clock scan $fmty]
				#lappend list $result $fmty $result2
			}
		}
	}
}


clockscan
