# usage:  
#{
#	csv();
#	for(i = 1; i <= NF; i++) {
#		print $i;
#	}
#}
#	csv("\x09") for tab separated files
#	the function uses \x00 as field separator for awk to split fields and requires \x01 as a work character if \x00 or \x01 are in user
#	for some reason other characters may be specified as such
#	csv(",", "\x10"); or
#	csn(",", "\x10", "\x11") for example.

function csv(sep, fs, TC, this, ML) {
	if (!sep) sep = ",";
	if (!fs) FS = "\x00"; else FS = fs;
	if (!TC) TC = "\x01";
  ML = $0;
	while (gsub("\"", "\"") % 2) {
    getline;		
		$0 = ML "\n" $0;
		ML = $0;
		NR = NR - 1;
	}
	TC = "\x01"; 		
	$0 = gensub("\"[^\"]*\"", FS "\\0" FS, "g");
	gsub("\"" FS FS "\"", "\"");
	do {
		A = $0;
		$0 = gensub("(" FS "[^" sep FS "]+)" sep "([^" FS "]+" FS ")", "\\1" TC "\\2", "g");
	} while (A != $0);
	gsub(sep, FS);
	gsub("(^\"|" FS "\"|\"" FS "|\"$)", "");
	gsub(TC, sep);
}


