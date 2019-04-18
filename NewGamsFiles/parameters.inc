
Set n /n1*n15, dummy/;
Set s /a1/;

Parameter fcost(i, j) /
$ondelim

    n1      n2      150
    n2      n1      150
    n1      n3      150
    n3      n1      150
    n1      n4      150
    n4      n1      150
    n2      n5      150
    n5      n2      150
    n2      n6      150
    n6      n2      150
    n3      n7      150
    n7      n3      150
    n4      n7      150
    n7      n4      150
    n4      n8      150
    n8      n4      150
    n5      n6      150
    n6      n5      150
    n5      n9      150
    n9      n5      150
    n6      n11      150
    n11      n6      150
    n6      n10      150
    n10      n6      150
    n7      n12      150
    n12      n7      150
    n8      n13      150
    n13      n8      150
    n9      n12      150
    n12      n9      150
    n10      n13      150
    n13      n10      150
    n11      n14      150
    n14      n11      150
    n11      n15      150
    n15      n11      150
    n12      n14      150
    n14      n12      150
    n13      n14      150
    n14      n13      150
    n14      n15      150
    n15      n14      150
    


$offdelim

/;



Parameter proof_size(n);
proof_size(n) = uniformInt(1,20);

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
    dummy    0

/;




