#!/usr/bin/awk -f
@include "csv-lib.awk"
{
	csv();
	for(i = 1; i <= NF; i++) {
		print NR, $i;
		print NR, "---------------------------------------------------------------------";
	}
}
