
Set n "nodes";
Set s "set of edges on the network";

alias (n, i, j);

Set arc(i,j); 

Parameter proof_size(n), supply(n);

$include parameters.inc


arc(i,j) = no;

arc(i,j) = yes$(fcost(i,j) gt 0);

binary variable path(i,j);

free variables total_cost;



Equations
objEq(i),
balance(i),
proof_size_constraint(i);


objEq(j)..
total_cost =e= sum(i, fcost(i,j)*path(i,j)*proof_size(i));

proof_size_constraint(i)..
sum(j, path(i,j)*proof_size(j)*fcost(i,j)) =l= sum(j, proof_size(j));

balance(i)..
sum(j$(arc(i,j)), path(i,j)) - sum(j$(arc(j,i)), path(j,i)) =e= supply(i);


model cool /all/;

solve cool using mip minimizing total_cost;











