
Set n /n1*n15/;
Set s /a1/;

Parameter fcost(i, j) /
$ondelim
    n1      n2      50
    n2      n1      50
    n1      n3      50
    n3      n1      50
    n1      n4      50
    n4      n1      50
    n2      n5      50
    n5      n2      50
    n2      n6      50
    n6      n2      50
    n3      n7      50
    n7      n3      50
    n4      n7      50
    n7      n4      50
    n4      n8      50
    n8      n4      50
    n5      n6      50
    n6      n5      50
    n5      n9      50
    n9      n5      50
    n6      n11     50
    n11      n6     50
    n6      n10     50
    n10      n6     50
    n7      n12     50
    n12      n7     50
    n8      n13     50
    n13      n8     50
    n9      n12     50
    n12      n9     50
    n10      n13    50
    n13      n10    50
    n11      n14    50
    n14      n11    50
    n11      n15    50
    n15      n11    50
    n12      n14    50
    n14      n12    50
    n13      n14    50
    n14      n13    50
    n14      n15    50
    n15      n14    50
$offdelim
/;

Parameter 
	proof_size(n);

Parameter supply(n) /

    n1       1
    n2       0
    n3       0
    n4       0
    n5       0
    n6       0
    n7       0
    n8       0
    n9       0
    n10      0
    n11      0
    n12      0
    n13      0
    n14      0
    n15     -1

/;
