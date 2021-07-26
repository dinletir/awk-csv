# READING A CSV FILE WITH AWK

Usage:

First include the `csv-lib.awk` library.

```
@include "csv-lib.awk"
```

Then let **awk** convert every CSV line into **awk fields**.

```
{
	csv();
}
```	

If the first line in the CSV file is a header, save its fields in an array. 


```
NR == 1 {
	csvHeaders(headers);
	next;
}
```				

Subsequent lines would then be processed normally with the fields referenced as
`$1, $2, ..., $NF`.

> It is also possible to reference the fields with their **header names** by
assigning them to an **array** with the function `csvRecord(record, 1)`, where
the parameter `record` is the array and the optional parameter **trim** which
when set to `'1'`, will remove each field's leading and trailing spaces.



```
{
	csvRecord(record, 1);
	print record["Last name"], record["First name"], record["Final"];
}
```	

### For example:

> `cat grades.csv|./test-grades.awk`

Will output:

```
Alfalfa Aloysius 49.0
Alfred University 48.0
Gerty Gramma 44.0
```

### Sample script and data


*test-grades.awk*

```
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
```

*graders.csv*

```
"Last name", "First name", "SSN",        "Test1", "Test2", "Test3", "Test4", "Final", "Grade"
"Alfalfa",   "Aloysius",   "123-45-6789", 40.0,    90.0,   100.0,    83.0,    49.0,   "D-"
"Alfred",    "University", "123-12-1234", 41.0,    97.0,    96.0,    97.0,    48.0,   "D+"
"Gerty",     "Gramma",     "567-89-0123", 41.0,    80.0,    60.0,    40.0,    44.0,   "C"
```
