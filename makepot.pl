#!/usr/bin/perl -w

#
# Extract messages from scripts and make pot
#
# Copyright (c) 1999 Free Software Fundation, Inc.
# Artur Frysiak <wiget@pld.org.pl>
# $Id: makepot.pl,v 1.4 2000/06/25 14:40:35 waszi Exp $
# 

my %pot;

sub potentry {
	my( $msg, $lnr, $filename ) = @_;
#print STDERR "msg = $msg\nlnr = $lnr\nfilename = $filename\n";	
	if (defined $pot{"$msg"}) {
		$pot{"$msg"} = $pot{"$msg"} . "\n#: $filename:$lnr";
#print STDERR "append $msg\n";		
	} else {
		$pot{"$msg"} = "\n#: $filename:$lnr";
#print STDERR "new $msg\n";		
	};
};

print STDERR "\n". $#ARGV . " files\n";

if (1) {
print <<EOF ;
# Polish translation of rc-scripts.
#
msgid \"\"
msgstr \"\"
\"Project-Id-Version: PACKAGE VERSION\\n\"
\"POT-Creation-Date: 1999-07-30 18:45+0200\\n\"
\"PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\\n\"
\"Last-Translator: FULL NAME <EMAIL\@ADDRESS>\\n\"
\"Language-Team: LANGUAGE <LL\@li.org>\\n\"
\"MIME-Version: 1.0\\n\"
\"Content-Type: text/plain; charset=iso8859-2\\n\"
\"Content-Transfer-Encoding: 8bit\\n\"

# Translation of words: \"DONE\", \"WORK\", \"BUSY\", \"FAIL\", \"DIED\"
# must have that same count of letters !!!!!!!!!!!!!!!!!!!!!!!

# \(4 + \"\\b\" * count of letters\) in one of five previous words
# msgid \"\\b\\b\\b\\b\\b\\b\\b\\b\"
EOF

}


for (my $a = 0; $a <= $#ARGV; $a++) {
	my $lnr = 0;
	my $filename = $ARGV[$a];
	print STDERR " " .$filename . "\n"; 
	open (POTSRC, "< " . $filename) || die "Can't open " . $filename;
	foreach (<POTSRC>) {
		chop;
		if (/(run_cmd|nls|show)\s[\sa-zA-Z0-9-]*"(?!\`nls\s\")([^"]*)"/g) {
#			potentry($1,$lnr,$filename) if defined $1;
			potentry($2,$lnr,$filename) if defined $2;
			potentry($3,$lnr,$filename) if defined $3;
			potentry($4,$lnr,$filename) if defined $4;
			potentry($5,$lnr,$filename) if defined $5;
			potentry($6,$lnr,$filename) if defined $6;
			potentry($7,$lnr,$filename) if defined $7;
			potentry($8,$lnr,$filename) if defined $8;
			potentry($9,$lnr,$filename) if defined $9;
			potentry($10,$lnr,$filename) if defined $10;
			potentry($11,$lnr,$filename) if defined $11;
		};
		$lnr++;
	};

	close (POTSRC);
	
};

foreach $key (keys %pot) {
	print $pot{"$key"} . "\nmsgid \"$key\"\nmsgstr \"\"\n";
};




