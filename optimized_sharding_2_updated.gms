$title Global Optimization for Spontaneous Sharding 

$onText

A Scale-out Blockchain for Value Transfer with Spontaneous Sharding 

Zhijie Ren ∗ , Kelong Cong † , Taico V. Aerts ∗ , Bart. A. P. de Jonge ∗ , Alejandro F. Morais ∗ and Zekeriya Erkin ∗


$offText

Set
   n 'nodes in the network',
   shard1 'subset of nodes in the network',
   shard2 'subset of nodes in the network',
   shard3 'subset of nodes in the network',
   shard4 'subset of nodes in the network',
   s 'set of edges on the network ( sub arcs index )' ,
   s1 'set of edges on the network ( sub arcs index )' ,
   s2 'set of edges on the network ( sub arcs index )' ,
   s3 'set of edges on the network ( sub arcs index )' ,
   s4 'set of edges on the network ( sub arcs index )' ,
   Ne( n, n, s ) 'arc on the transaction path ( arcs in the transaction path )',
   Ns1(shard1, shard1, s) 'arc on the transaction path (arcs in the transaction path of shard 1)',
   Ns2(shard2, shard2, s) 'arc on the transaction path (arcs in the transaction path of shard 2)',
   Ns3(shard3, shard3, s) 'arc on the transaction path (arcs in the transaction path of shard 3)',
   Ns4(shard4, shard4, s) 'arc on the transaction path (arcs in the transaction path of shard 4)';
   

Alias (n, i, ii) , (s, ss, sss), (shard1, j, jj), (shard2, k, kk), (shard3, l, ll), (shard4, q, qq);

Parameter
	P(n)  		'connectivity on the nodes on the node',
	P1(shard1)  		'connectivity on the nodes on the node',
	P2(shard2)  		'connectivity on the nodes on the node',
	P3(shard3)  		'connectivity on the nodes on the node',
	P4(shard4)  		'connectivity on the nodes on the node',
*	c(I,O) 		'Average inbound  and outbound on the  transaction path',
	fcost(n,n,s) 	'fixed cost',
	fcost1(jj,shard1,s) 	'fixed cost',
	fcost2(kk,shard2,s) 	'fixed cost',
	fcost3(ll,shard3,s) 	'fixed cost',
	fcost4(qq,shard4,s) 	'fixed cost',
	vcost(n,n,s)  	'variable cost',
	vcost1(shard1,shard1,s)  	'variable cost',
	vcost2(shard2,shard2,s)  	'variable cost',
	vcost3(shard3,shard3,s)  	'variable cost',
	vcost4(shard4,shard4,s)  	'variable cost',
	xupp(n, n, s)	'upper bound on flow',
	xupp1(shard1, shard1, s)	'upper bound on flow',
	xupp2(shard2, shard2, s)	'upper bound on flow',
	xupp3(shard3, shard3, s)	'upper bound on flow',
	xupp4(shard4, shard4, s)	'upper bound on flow',
	yupp(n, n, s)   'upper bound on build',
	yupp1(shard1, shard1, s)   'upper bound on build',
	yupp2(shard2, shard2, s)   'upper bound on build',
	yupp3(shard3, shard3, s)   'upper bound on build',
	yupp4(shard4, shard4, s)   'upper bound on build',
	A(s) 'Average transaction path';

Scalar
	proof_size	'proof size per node'
	proof_size1	'proof size per node'
	proof_size2	'proof size per node'
	proof_size3	'proof size per node'
	proof_size4	'proof size per node'
	usetree					/ 0 /
	honest_node	'node used to transact' / 0 /
	unhonest_node	'node unsed to transat' / 0 /;


$include berlin2.inc 

Ne(ii, n, s )$(fcost(ii,n,s) or vcost(ii,n,s) or xupp(ii,n,s) or yupp(ii,n,s)) = yes;
Ns1(jj, shard1, s )$(fcost1(jj,shard1,s) or vcost1(jj,shard1,s) or xupp1(jj,shard1,s) or yupp1(jj,shard1,s)) = yes;
Ns2(kk, shard2, s )$(fcost2(kk,shard2,s) or vcost2(kk,shard2,s) or xupp2(kk,shard2,s) or yupp2(kk,shard2,s)) = yes;
Ns3(ll, shard3, s )$(fcost3(ll,shard3,s) or vcost3(ll,shard3,s) or xupp3(ll,shard3,s) or yupp3(ll,shard3,s)) = yes;
Ns4(qq, shard4, s )$(fcost4(qq,shard4,s) or vcost4(qq,shard4,s) or xupp4(qq,shard4,s) or yupp4(qq,shard4,s)) = yes;


Variables
	cost 'weight factor of the edges on the network', 
	x(n, n, s) 'flow over the arc',
	x1(shard1, shard1, s) 'flow over the arc',
	x2(shard2, shard2, s) 'flow over the arc',
	x3(shard3, shard3, s) 'flow over the arc',
	x4(shard4, shard4, s) 'flow over the arc',
	y(n, n, s) 'Usage of the arc',
	y1(shard1, shard1, s) 'Usage of the arc',
	y2(shard2, shard2, s) 'Usage of the arc',
	y3(shard3, shard3, s) 'Usage of the arc',
	y4(shard4, shard4, s) 'Usage of the arc';

Positive Variable
	x,
	x1,
	x2,
	x3,
	x4;

Binary Variable
	y,
	y1,
	y2,
	y3,
	y4;

			
Equations	
	Objective,
	Objective1,
	Objective2,
	Objective3,
	Objective4,
	flow_constraint(n) 		'flow constraint from one node to another node',
	flow_constraint1(shard1) 		'flow constraint from one node to another node',
	flow_constraint2(shard2) 		'flow constraint from one node to another node',
	flow_constraint3(shard3) 		'flow constraint from one node to another node',
	flow_constraint4(shard4) 		'flow constraint from one node to another node',
	binary_constraint(n, n, s) 	'binary forcing constraint',
	binary_constraint1(shard1, shard1, s) 	'binary forcing constraint',
	binary_constraint2(shard2, shard2, s) 	'binary forcing constraint',
	binary_constraint3(shard3, shard3, s) 	'binary forcing constraint',
	binary_constraint4(shard4, shard4, s) 	'binary forcing constraint',
	transaction_path(n)		'transaction path in a form of tree',
	transaction_path1(shard1)		'transaction path in a form of tree',
	transaction_path2(shard2)		'transaction path in a form of tree',
	transaction_path3(shard3)		'transaction path in a form of tree',
	transaction_path4(shard4)		'transaction path in a form of tree',
	used_node(n),
	used_node1(shard1),
	used_node2(shard2),
	used_node3(shard3),
	used_node4(shard4),
	unused_node(n),
	unused_node1(shard1),
	unused_node2(shard2),
	unused_node3(shard3),
	unused_node4(shard4);

Objective..
cost =e= sum(Ne, vcost(Ne) * x(Ne) + fcost(Ne) * y(Ne) ); 

flow_constraint(n)..
sum( Ne(ii, n, s), x(ii,n,s)) - sum( Ne(n,ii,s), x(n,ii,s)) =e= P(n);

binary_constraint(Ne)..
x(Ne) =l= xupp(Ne) * y(Ne);

transaction_path(n)$usetree..
sum(Ne(n,ii,s), y(n, ii, s )) =l= 1;

used_node(n)$(honest_node and P(n) > 0 )..
sum( (ii,s), y(ii, n, s )) =e= 1; 

unused_node(n)$(unhonest_node and P(n) = 0 )..
sum( (ii,s), y(ii, n, s )) =l= 1;





Objective1..
cost =e= sum(Ns1, vcost1(Ns1) * x1(Ns1) + fcost1(Ns1) * y1(Ns1) ); 

flow_constraint1(shard1)..
sum( Ns1(jj, shard1, s), x1(jj,shard1,s)) - sum( Ns1(shard1,jj,s), x1(shard1,jj,s)) =e= P1(shard1);

binary_constraint1(Ns1)..
x1(Ns1) =l= xupp1(Ns1) * y1(Ns1);

transaction_path1(shard1)$usetree..
sum(Ns1(shard1,jj,s), y1(shard1, jj, s )) =l= 1;

used_node1(shard1)$(honest_node and P1(shard1) > 0 )..
sum( (jj,s), y1(jj, shard1, s )) =e= 1; 

unused_node1(shard1)$(unhonest_node and P1(shard1) = 0 )..
sum( (jj,s), y1(jj, shard1, s )) =l= 1;







Objective2..
cost =e= sum(Ns2, vcost2(Ns2) * x2(Ns2) + fcost2(Ns2) * y2(Ns2) ); 

flow_constraint2(shard2)..
sum( Ns2(kk, shard2, s), x2(kk,shard2,s)) - sum( Ns2(shard2,kk,s), x2(shard2,kk,s)) =e= P2(shard2);

binary_constraint2(Ns2)..
x2(Ns2) =l= xupp2(Ns2) * y2(Ns2);

transaction_path2(shard2)$usetree..
sum(Ns2(shard2,kk,s), y2(shard2, kk, s )) =l= 1;

used_node2(shard2)$(honest_node and P2(shard2) > 0 )..
sum( (kk,s), y2(kk, shard2, s )) =e= 1; 

unused_node2(shard2)$(unhonest_node and P2(shard2) = 0 )..
sum( (kk,s), y2(kk, shard2, s )) =l= 1;









Objective3..
cost =e= sum(Ns3, vcost3(Ns3) * x3(Ns3) + fcost3(Ns3) * y3(Ns3) ); 

flow_constraint3(shard3)..
sum( Ns3(ll, shard3, s), x3(ll,shard3,s)) - sum( Ns3(shard3,ll,s), x3(shard3,ll,s)) =e= P3(shard3);

binary_constraint3(Ns3)..
x3(Ns3) =l= xupp3(Ns3) * y3(Ns3);

transaction_path3(shard3)$usetree..
sum(Ns3(shard3,ll,s), y3(shard3, ll, s )) =l= 1;

used_node3(shard3)$(honest_node and P3(shard3) > 0 )..
sum( (ll,s), y3(ll, shard3, s )) =e= 1; 

unused_node3(shard3)$(unhonest_node and P3(shard3) = 0 )..
sum( (ll,s), y3(ll, shard3, s )) =l= 1;









Objective4..
cost =e= sum(Ns4, vcost4(Ns4) * x4(Ns4) + fcost4(Ns4) * y4(Ns4) ); 

flow_constraint4(shard4)..
sum( Ns4(qq, shard4, s), x4(qq,shard4,s)) - sum( Ns4(shard4,qq,s), x4(shard4,qq,s)) =e= P4(shard4);

binary_constraint4(Ns4)..
x4(Ns4) =l= xupp4(Ns4) * y4(Ns4);

transaction_path4(shard4)$usetree..
sum(Ns4(shard4,qq,s), y4(shard4, qq, s )) =l= 1;

used_node4(shard4)$(honest_node and P4(shard4) > 0 )..
sum( (qq,s), y4(qq, shard4, s )) =e= 1; 

unused_node4(shard4)$(unhonest_node and P4(shard4) = 0 )..
sum( (qq,s), y4(qq, shard4, s )) =l= 1;










Model Sharding /Objective, flow_constraint, binary_constraint, transaction_path, used_node, unused_node/;

Model Sharding1 /Objective1, flow_constraint1, binary_constraint1, transaction_path1, used_node1, unused_node1/;

Model Sharding2 /Objective2, flow_constraint2, binary_constraint2, transaction_path2, used_node2, unused_node2/;

Model Sharding3 /Objective3, flow_constraint3, binary_constraint3, transaction_path3, used_node3, unused_node3/;

Model Sharding4 /Objective4, flow_constraint4, binary_constraint4, transaction_path4, used_node4, unused_node4/;

Solve Sharding using MIP minimizing cost;
Solve Sharding1 using MIP minimizing cost;
Solve Sharding2 using MIP minimizing cost;
Solve Sharding3 using MIP minimizing cost;
Solve Sharding4 using MIP minimizing cost; 
