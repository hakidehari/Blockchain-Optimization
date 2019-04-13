
Set n "nodes";
Set s "set of edges on the network";

alias (n, i, j, k);

Set arc(i,j); 

Parameter proof_size(n), supply(n);

$include parameters.inc


arc(i,j) = no;

arc(i,j) = yes$(fcost(i,j) gt 0);


positive variable path(n,n);

positive variable val(i,j);

free variables total_cost;


Equations
objEq,
balance(i),
eq1(i,j);
*proof_size_constraint(i);


objEq..
total_cost =e= sum((i,j)$(arc(i,j)), fcost(i,j)*path(i,j)*proof_size(i));



balance(i)..
sum(j$(arc(i,j)), val(i,j)) - sum(k$(arc(k,i)), val(k,i)) =e= supply(i);


eq1(i,j)$(val(i,j) gt 49)..
path(i,j) =e= 1;

*proof_size_constraint(i)..
*sum(j, path(i,j)*proof_size(j)*fcost(i,j)) =l= sum(j, proof_size(j));



model cool /all/;


solve cool using lp minimizing total_cost;





