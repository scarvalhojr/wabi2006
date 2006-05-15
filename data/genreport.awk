BEGIN {
	FS = " "
	OFS = "\t"
	
	state = 0
	
	dim = ""
}

match($0,/[0-9]+x[0-9]+/) {

	# print last record
	if (dim != "") {
		print type,dim,alg,opt,init,plac_cost,plac_time,post_cost,post_time
	}
	
	# new record
	dim = substr($0,RSTART,RLENGTH)
	dim = substr(dim,1,index(dim,"x")-1)
	
	type = substr($0,1,index($0,"/")-1)
	opt = $3
	
	# reset data
	alg = "-"
	init = "-"
	plac_cost = "-"
	plac_time = "-"
	post_cost = "-"
	post_time = "-"
	
	next;
}

match($0,/^Running/) {
	alg = $2
	next;
}

match($0,/before placement/) {
	init = $5
	next;
}

match($0,/^Elapsed time \(placement\)/) {
	plac_time = $4
	next;
}

match($0,/before optimization/) {
	plac_cost = $5
	next;
}

match($0,/^Elapsed time \(optimization\)/) {
	post_time = $4
	next;
}

match($0,/^Final/) {
	if (plac_cost > 0) {
		post_cost = $4
	} else {
		plac_cost = $4
	}
	next;
}

END {
	print type, dim,alg,opt,init,plac_cost,plac_time,post_cost,post_time
}