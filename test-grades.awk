#!/usr/bin/awk -f
@include "csv-lib.awk"
{
	csv();
}

NR == 1 {
	csvHeaders(headers);
	next;
}
{
	csvRecord(record, 1);
	print record["Last name"], record["First name"], record["Final"];
}
