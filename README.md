# SCAN THRU CSV FILE

Usage:

Add the following include file

```
@include "csv-lib.awk"
```

Let awk convert every CSV line fields into awk fields.

```
{
	csv();
}
```	

IF the CSV file has a header in the first line, capture it.
The headers are stored in the `headers` array. 


```
NR == 1 {
	csvHeaders(headers);
	next;
}
```				

Subsequent lines would then be processed normally.

It is also possible to refer to every field by its header name with the
`csvRecord(record, 1)` function which will assign every to field an array (`record` in
this case) indexed by its header name.

> The second argument 1 is optional and if present will trim leading and
trailing spaces of each field.



```
{
	csvRecord(record, 1);
	print record["Last name"], record["First name"], record["Final"];
}
```	


