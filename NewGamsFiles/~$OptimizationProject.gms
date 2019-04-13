

Set n "nodes";
Set s "set of edges on the network";

alias (n, i, j);

Set arc(i,j);


$include parameters.inc


arc(i,j) = no;

arc(i,j) = yes$(fcost(i,j,s) gt 0)

binary variable x(i,j);

variables
cost;






