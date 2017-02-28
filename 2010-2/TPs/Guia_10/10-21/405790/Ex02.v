//Guia 10
//Nome: Bruno Calil Nicoliello Moreira
//Matricula: 405790	
//21/10/2010


//----------------------
// O Exercicio 2 é igual ao exercicio 4, logo so fiz o ultimo extra e o 4 é esse.
//----------------------




//-----------------
//Module SRlatch
//-----------------
module SRlatch ( qn, q, pr, cl, r, s );

	input  r, s, pr, cl;
	output qn, q;
	
	nand NAND1(qn,pr,s,q);
	nand NAND2(q,cl,r,qn);
	
endmodule // end module

//----------------------
//--Test module SrLatch
//----------------------

module test;
SRlatch exercicio02 (p1,q1,pr1,cl1,r1,s1);

reg  r1,s1,cl1,pr1;
wire p1,q1;

initial begin

r1=0;s1=0;cl1=0;pr1=0;
$display("Bruno Calil Nicoliello Moreira - 405790");
$display("Guia 10 - Ex 02");
$monitor("r = %b; s = %b; Clear = %b; Preset = %b: Q' = %b; Q = %b",r1,s1,cl1,pr1,p1,q1);
#1 r1=0;s1=0;cl1=0;pr1=0;
#1 r1=0;s1=0;cl1=0;pr1=0;
#1 r1=1;s1=0;cl1=1;pr1=0;
#1 r1=0;s1=0;cl1=1;pr1=0;
#1 r1=1;s1=0;cl1=1;pr1=1;
#1 r1=0;s1=1;cl1=1;pr1=1;
#1 r1=0;s1=1;cl1=1;pr1=1;
#1 r1=0;s1=0;cl1=1;pr1=1;

end
endmodule