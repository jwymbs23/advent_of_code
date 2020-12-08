

open("input_2") do file
    correct_count = 0  
    lines = readlines(file)
    for line in lines
    	rule, pass = split(line, ": ")
	rule_bounds, letter = split(rule, " ")
	rule_min, rule_max = split(rule_bounds, '-')
	rule_min, rule_max = parse(Float64,rule_min), parse(Float64,rule_max) 

	println(rule_min)
	
	lcount = 0

	for l in pass

	    if only(l) == only(letter)
	       lcount += 1
	    end
	end

	if lcount >= rule_min && lcount <= rule_max
	   correct_count = correct_count + 1
	end


    end 
println("correct count: ", correct_count)    
end

