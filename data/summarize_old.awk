BEGIN {
	OFS = FS = "\t"
	
	dim = -1
	alg = ""
	opt = ""
	
	plac_cost = 0.01
}

$2 != "-" {

	if ($1 != dim || $2 != alg || $3 != opt) {
	
		if (dim != -1) {
			# print previous record
			print dim, alg, opt, init/c, plac_cost/c, plac_time/c, post_cost/c, post_time/c, c
		}
		
		# start new record
		dim = $1
		alg = $2
		opt = $3
		init = $4
		plac_cost = $5
		plac_time = $6
		post_cost = $7
		post_time = $8
		c = 1
	} else {
		init = init + $4
		plac_cost = plac_cost + $5
		plac_time = plac_time + $6
		post_cost = post_cost + $7
		post_time = post_time + $8
		c = c + 1
	}
}

END {
	# print last record
	print dim, alg, opt, init/c, plac_cost/c, plac_time/c, post_cost/c, post_time/c
}