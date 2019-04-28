
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
	unused_nodes(n) /n1*n150/,
	shard1(n),
	shard2(n),
	shard3(n)
;

scalar rando, count, s_index, d_index, shardLength, shardLength2, shardLength3;

*Try the optimization for different supply and demand nodes
Loop(iter,
    s_index = uniformint(1, 150);
    rando = uniformint(1,150);
    d_index = rando$(s_index ne rando);
    supply(i)$(ord(i) = s_index) = 1;
    supply(i)$(ord(i) = d_index) = -1;
    Solve Shard using mip minimizing CCPT;
    display s_index, d_index;
    display supply;
    supply(i) = 0;
);


Set temp(n);
shard1(n) = no;
count = 0;
shardLength = card(shard1);
while(count < 50,
      rando = uniformint(1, 150);
      
      temp(n) = yes$(ord(n) = rando);
      shard1(temp) = yes;
      used_nodes(temp) = yes;
      unused_nodes(temp) = no;
      
      if(card(shard1) = shardLength + 1,
        shardLength = card(shard1);
        count = shardLength;
      );
);

display shard1;
display shardLength;
display used_nodes;
display unused_nodes;

shard2(n) = no;
count = 0;
shardLength2 = card(shard2);
while(count < 50,
      rando = uniformint(1, 150);

      temp(n) = yes$(ord(n) = rando);
      shard2(unused_nodes(temp)) = yes;
      used_nodes(temp) = yes;
      unused_nodes(temp) = no;
      
      if(card(shard2) = shardLength2 + 1,
        shardLength2 = card(shard2);
        count = shardLength2;
      );
);




display shard2;
display shardLength2;
display used_nodes;
display unused_nodes;


shard3(n) = no;
count = 0;
shardLength3 = card(shard3);
while(count < 50,
      rando = uniformint(1, 150);
      
      temp(n) = yes$(ord(n) = rando);
      shard3(unused_nodes(temp)) = yes;
      used_nodes(temp) = yes;
      unused_nodes(temp) = no;
      
      if(card(shard3) = shardLength3 + 1,
        shardLength3 = card(shard3);
        count = shardLength3;
      );
);

display shard3;
display shardLength3;
display used_nodes;
display unused_nodes;





