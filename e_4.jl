
open("input_2") do file
    correct_count = 0  
    lines = readlines(file)
    for line in lines
    	rule, pass = split(line, ": ")
	rule_bounds, letter = split(rule, " ")
	rule_min, rule_max = split(rule_bounds, '-')
	rule_min, rule_max = parse(Int32,rule_min), parse(Int32,rule_max) 

	

	lcount = 0

	if (only(pass[rule_min]) == only(letter)) ⊻ (only(pass[rule_max]) == only(letter))
	   correct_count += 1


	end
	

    end 
println("correct count: ", correct_count)    
end

