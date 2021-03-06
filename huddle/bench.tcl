
package require huddle 0.1.5

#
# load_array - quickly load up airport data into the airport array
#
proc load_array {} {
	set fp [open airports.array]
	array set ::airport [read $fp]
	close $fp
}

load_array

#
# huddle_school - generate geojson for the specified number of
#   airports (up to 30,000+)
#
proc huddle_school {howMany} {
    set airport_json [huddle list]

    foreach ap [lrange [array names ::airport] 0 $howMany] {
        lassign $::airport($ap) lat lon
	huddle append airport_json [huddle create type Feature geometry [huddle create type Point coordinates [huddle list $lat $lon]] properties [huddle create label $ap]]
    }

    set json [huddle jsondump [huddle create type FeatureCollection features $airport_json]]
    #puts $json
}

set howMany 10000

puts [time "huddle_school $howMany" 5]

