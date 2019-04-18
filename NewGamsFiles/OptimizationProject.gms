
Set n "nodes";
Set s "set of edges on the network";

alias (n, i, j, k);

Set arc(i,j); 

Parameter proof_size(n), supply(n);

$include parameters.inc


arc(i,j) = no;

arc(i,j) = yes$(fcost(i,j) gt 0);

set destination(n);

destination(n) = supply(n)$(supply(n) lt 0);

supply(destination) = 0;

supply("dummy") = -1;

arc(destination, "dummy") = yes;

fcost(destination, "dummy") = 150;

binary variable path(n,n);


positive variables val(i,j);

free variables total_cost;


Equations
objEq,
balance(i);
*proof_size_constraint(i);


objEq..
total_cost =e= sum((i,j)$(arc(i,j)), fcost(i,j)*path(i,j)*proof_size(i));



balance(i)..
sum(j$(arc(i,j)), path(i,j)) - sum(k$(arc(k,i)), path(k,i)) =e= supply(i);



*proof_size_constraint(i)..
*sum(j, path(i,j)*proof_size(j)*fcost(i,j)) =l= sum(j, proof_size(j));

model cool /all/;


solve cool using mip minimizing total_cost;

display proof_size;

display destination;


