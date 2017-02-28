//Guia 10
//Nome: Bruno Calil Nicoliello Moreira
//Matricula: 405790	
//21/10/2010

//-----------------
//Module SRlatch
//-----------------

module SRlatch ( qn, q, r, s );
	input  r, s;
	output qn, q;	
	
	nor NOR1(qn,s,q);
	nor NOR2(q,r,qn);
	
endmodule

//----------------------
//--Teste module SrLatch
//----------------------

module test;
SRlatch srlatch (p1,q1,r1,s1);

reg  r1, s1;
wire p1, q1;

initial begin

r1=0; s1=0;
$display("Bruno Calil Nicoliello Moreira - 405790");
$display("Guia 10 - Ex 01");
$monitor("r = %b; s = %b: Q' = %b; Q = %b",r1,s1,p1,q1);
#1 r1=1; s1=0;
#1 r1=0;s1=0;
#1 r1=0;s1=1;
#1 r1=0;s1=0;
#1 r1=1;s1=0;

end
endmodule