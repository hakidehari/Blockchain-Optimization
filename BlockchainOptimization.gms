$title Blockchain Optimization Problem

$onText

Zhijie Ren ∗ , Kelong Cong † , Taico V. Aerts ∗ , Bart. A. P. de Jonge ∗ , Alejandro F. Morais ∗ and Zekeriya Erkin ∗

A Scale-out Blockchain for Value Transfer with Spontaneous Sharding

$offText

Set
   v 'nodes in the network',
   e 'set of edges on the network',
   Ne 'Node on the transaction path';

Alias
    (v, i) 'node include in the path',
    (e, I, O)  'inbound and outbound edges';


Parameter
        P(i)  'connectivity on the nodes on the node',
        c(I,O) 'Average inbound  and outbound on the  transaction path',
        l(Ne) 'Average transaction path';

Scalar
        N  'number of nodes on the network' /50/;

Variables
        f 'weight factor of the edges on the network',
        M 'number of  edges on the network';

Equations
        node_connectivity(i) 'get how connected the nodes are on the nodes',
        avg_in_out_bound 'get the average of inbound and outbound  edges on the transaction path',
        avg_path 'get the average path on the  network',
        number_of_nodes 'number of nodes in the network',
        number_of_edges 'number of edges in the network';

node_connectivty(i)..  M / N*( N - 1 ) =e= P(i);
avg_in_out_boundn.. ( M / N ) =e=  c(I, O);