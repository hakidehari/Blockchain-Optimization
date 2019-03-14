$title Global Optimization for Spontaneous Sharding 

$onText

A Scale-out Blockchain for Value Transfer with Spontaneous Sharding 

Zhijie Ren ∗ , Kelong Cong † , Taico V. Aerts ∗ , Bart. A. P. de Jonge ∗ , Alejandro F. Morais ∗ and Zekeriya Erkin ∗


$offText

Set
   n 'nodes in the network',
   s 'set of edges on the network ( sub arcs index )' ,
   Ne( n, n, s ) 'arc on the transaction path ( arcs in the transaction path )';

Alias (n, i, ii) , (s, ss, sss);

Parameter
	P(n)  		'connectivity on the nodes on the node', 
*	c(I,O) 		'Average inbound  and outbound on the  transaction path',
	fcost(n,n,s) 	'fixed cost', 
	vcost(n,n,s)  	'variable cost',
	xupp(n, n, s)	'upper bound on flow', 
	yupp(n, n, s)   'upper bound on build',
	l(s) 'Average transaction path';

Scalar
	proof_size	'proof size per node'
	usetree					/ 0 /
	honest_node	'node used to transact' / 0 /
	unhonest_node	'node unsed to transat' / 0 /;


$include berlin2.inc 

Ne(ii, n, s )$(fcost(ii,n,s) or vcost(ii,n,s) or xupp(ii,n,s) or yupp(ii,n,s)) = yes;


Variables
	cost 'weight factor of the edges on the network', 
	x(n, n, s) 'flow over the arc',
	y(n, n, s) 'Usage of the arc';

Positive Variable
	x;

Binary Variable
	y;

			
Equations	
	Objective
	flow_constraint(n) 		'flow constraint from one node to another node', 
	binary_constraint(n, n, s) 	'binary forcing constraint',
	transaction_path(n)		'transaction path in a form of tree',	
	used_node(n) 
	unused_node(n);

Objective.. cost =e= sum(Ne, vcost(Ne) * x(Ne) + fcost(Ne) * y(Ne) ); 

flow_constraint(n).. sum( Ne(ii, n, s), x(ii,n,s)) - sum( Ne(n,ii,s), x(n,ii,s)) =e= P(n);

binary_constraint(Ne).. x(Ne) =l= xupp(Ne) * y(Ne);

transaction_path(n)$usetree.. sum(Ne(n,ii,s), y(n, ii, s )) =l= 1;

used_node(n)$(honest_node and P(n) > 0 ).. sum( (ii,s), y(ii, n, s )) =e= 1; 

unused_node(n)$(unhonest_node and P(n) = 0 ).. sum( (ii,s), y(ii, n, s )) =l= 1;

Model Sharding /all/;

Solve Sharding using MIP minimizing cost; 
