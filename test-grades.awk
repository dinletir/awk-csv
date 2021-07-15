#!/usr/bin/awk -f
@include "csv-lib.awk"
{
	csv();
}

NR == 1 {
	csvHeaders(headers);
	for( h in headers) print h, headers[h];
	print "-----------------------"
	next;
}
{
	csvRecord(record, 1);
	print record["Last name"], record["First name"];
}
