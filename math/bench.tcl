

proc degrees_radians {degrees} {
	return [expr {$degrees * 3.14159265358979323846 / 180.0}]
}

proc latlongs_to_distance {lat1 lon1 lat2 lon2} {
	set dLat [degrees_radians [expr {$lat2 - $lat1}]]
	set dLon [degrees_radians [expr {$lon2 - $lon1}]]

	set lat1 [degrees_radians $lat1]
	set lat2 [degrees_radians $lat2]

	set a [expr {sin($dLat / 2) ** 2  + sin ($dLon / 2) ** 2 * cos ($lat1) * cos ($lat2)}]
	set c [expr {2 * atan2 (sqrt ($a), sqrt (1 - $a))}]
	return [expr {3963. * $c}]
}

proc test {} {
	for {set lon -180} {$lon < 180} {incr lon} {
		for {set lat -90} {$lat < 90} {incr lat} {
			for {set lon2 40} {$lon2 < 48} {incr lon2} {
				set d [latlongs_to_distance $lat $lon 44 $lon2]
			}
		}
	}
}

test
