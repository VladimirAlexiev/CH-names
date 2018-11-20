#!sh
perl -pe 's{(.+)}{$1|1}' Cranach-dbpedia.txt  | join -t '|' -a1 -e0 -o1.1,2.2                         Cranach.txt - > Cranach1.txt
perl -pe 's{(.+)}{$1|1}' Cranach-freebase.txt | join -t '|' -a1 -e0 -o1.1,1.2,2.2                     Cranach1.txt - > Cranach2.txt
perl -pe 's{(.+)}{$1|1}' Cranach-ISNI.txt     | join -t '|' -a1 -e0 -o1.1,1.2,1.3,2.2                 Cranach2.txt - > Cranach3.txt
perl -pe 's{(.+)}{$1|1}' Cranach-ULAN.txt     | join -t '|' -a1 -e0 -o1.1,1.2,1.3,1.4,2.2             Cranach3.txt - > Cranach4.txt
perl -pe 's{(.+)}{$1|1}' Cranach-VIAF.txt     | join -t '|' -a1 -e0 -o1.1,1.2,1.3,1.4,1.5,2.2         Cranach4.txt - > Cranach5.txt
perl -pe 's{(.+)}{$1|1}' Cranach-wikidata.txt | join -t '|' -a1 -e0 -o1.1,1.2,1.3,1.4,1.5,1.6,2.2     Cranach5.txt - > Cranach6.txt
perl -pe 's{(.+)}{$1|1}' Cranach-yago.txt     | join -t '|' -a1 -e0 -o1.1,1.2,1.3,1.4,1.5,1.6,1.7,2.2 Cranach6.txt - > Cranach-table.txt
