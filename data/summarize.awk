BEGIN {
	OFS = FS = "\t"
	
	typ = ""
	dim = -1
	alg = ""
	opt = ""
	
	plac_cost = 0.01
}

$5 != "-" {

	if ($1 != typ || $2 != dim || $3 != alg || $4 != opt) {
	
		if (dim != -1) {
			# print previous record
			printf ("%5s %s %f\t%f\t%f\t%f\t%f\t%s %s x%d\n", typ, dim, init/c, plac_cost/c, plac_time/c, post_cost/c, post_time/c, alg, opt, c)

			if (dim != $2) {
				print "----------------------------------------------------------------------------------------------------------------------"
			}
		}
		
		# start new record
		typ = $1
		dim = $2
		alg = $3
		opt = $4
		
		init = $5
		plac_cost = $6
		plac_time = $7
		post_cost = $8
		post_time = $9
		c = 1
	} else {
		init = init + $5
		plac_cost = plac_cost + $6
		plac_time = plac_time + $7
		post_cost = post_cost + $8
		post_time = post_time + $9
		c = c + 1
	}
}

END {
	# print last record
	printf ("%5s %s\t%f\t%f\t%f\t%f\t%f\t%s %s x%d\n", typ, dim, init/c, plac_cost/c, plac_time/c, post_cost/c, post_time/c, alg, opt, c)
}