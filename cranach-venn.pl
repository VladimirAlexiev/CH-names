#!perl -w
use Algorithm::Combinatorics qw(subsets);

my @sets=qw{dbpedia freebase ISNI ULAN VIAF wikidata yago};
my %cnts;

while (<>) {
  chomp;
  my @vals = split/\|/;
  shift @vals; # first col is Cranach name, rest are 0/1
  my @idx = grep {$vals[$_]} 0..$#sets;
  my $it = subsets(\@idx);
  while (my $x = $it->next) {
    $cnts{join',',@$x}++ if @$x;
    #print '|',(join',',@$x)
  }
}
print "var sets = [\n";
for (0..$#sets) {
  print qq<    {"label": "$sets[$_]", "size": $cnts{$_}},\n>
}
print "  ],\n  overlaps = [\n";
for (sort keys %cnts) {
  print qq<    {"sets": [$_], "size": $cnts{$_}},\n>
    if m{,}; # at least one comma, i.e. at least 2 sets
};
print "  ];\n";

