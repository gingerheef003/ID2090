#!/bin/awk

BEGIN {
	customer_code="IN20DEL674839"
	system("./header.txt " customer_code)
	FS = ","
	sum = 0
}

{
	TC = substr($1,1,1)
	UP = substr($1,2)

	if (TC == "P") TP = 12;
	else if (TC == "Q") TP = 18;
	else TP = 24;
	
	PC = UP * $2 * (100 + TP) / 100
	print "  " $1 "\t\t" UP "\t\t" $2 "\t\t" TP "\t" PC

	sum = sum + PC
}

END {
	system("./footer.txt " sum)
}
