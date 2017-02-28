//--Guia 10
//--Nome: Bruno Santiago Pinheiro
//--Matricula: 405791
//--Data: 19/10/1010

//-----------------
//--Module SRlatch
//-----------------
module SRlatch ( qn, q, pr, cl, d );

input  d, pr, cl;
output qn, q;
	
wire nd;
	
not NOT1(nd,d);
	
nand NAND1(qn,pr, d,q);
nand NAND1(q,cl,nd,qn);
	
endmodule

//----------------------
//--Test module SrLatch
//----------------------

module test;
SRlatch exercicio03 (p1,q1,pr1,cl1,d1);

reg  r1,d1,cl1,pr1;
wire p1,q1;

initial begin


d1=0;cl1=0;pr1=0;
$display("Bruno Santiago Pinheiro - 405791");
$display("Guia 10 - exercicio 01");
$monitor("d = %b; Clear = %b: Preset = %b: Q' = %b; Q = %b",d1,cl1,pr1,p1,q1);
#1 d1=1;cl1=0;pr1=0;
#1 d1=0;cl1=1;pr1=0;
#1 d1=1;cl1=1;pr1=0;
#1 d1=0;cl1=0;pr1=1;
#1 d1=1;cl1=0;pr1=1;
#1 d1=1;cl1=1;pr1=1;
#1 d1=0;cl1=1;pr1=1;

end
endmodule