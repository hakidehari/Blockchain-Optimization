
Set
	n 'nodes', 
	Arcs( n, n ) 'Set of arcs in the network'
; 

Alias
	( n, i, j, k );

Parameter 
	proof_size(n),
	supply(n)
;


Scalar Source 'The Source of the transaction'  /5/; 

Scalar Destination 'The destination of the transaction' /-5/; 

$Include nodes_2.inc

Arcs( i, j ) = no; 
Arcs( i, j ) = yes$( fcost( i, j ) Gt 0 ); 

proof_size( n ) = Uniformint( 1, 100 )$( Supply( n ) Lt 1 )

Binary Variable
	path( n, n ); 

Free Variable
	CCPT	'Communication Cost Per Transaction'
;

Equations
	Objective, 
	Balance(i)
;

Objective.. CCPT =e= sum(( i,j )$( Arcs( i, j )), fcost(i ,j) * path( i, j) * proof_size( i ));

Balance( i ).. sum(j$(Arcs( i, j )), path( i, j ) ) - sum(k$(Arcs(k, i)), path(k,i) ) =e= supply( i );

Model 
	Shard /all/;

Solve Shard using mip minimizing CCPT; 

Supply( i ) = 0; 

Display 
	proof_size; 

Display 
	fcost;

Set
        iter /1*15/,
	used_nodes(n),
	unused_nodes(n) /n1*n15/
	shard1(n),
	shard2(n),
	shard3(n),
	num_shards(shard1, shard2, shard3)
;

scalar rando, count, s_index, d_index;

*Try the optimization for different supply and demand nodes
Loop(iter,
    s_index = uniformint(1, 15);
    rando = uniformint(1,15);
    d_index = rando$(s_index ne rando);
    supply(i)$(ord(i) = s_index) = 1;
    supply(i)$(ord(i) = d_index) = -1;
    Solve Shard using mip minimizing CCPT;
    display s_index, d_index;
    display supply;
    supply(i) = 0;
);




