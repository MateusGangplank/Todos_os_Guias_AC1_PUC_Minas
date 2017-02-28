// ---------------------
// Exemplo 10_01 
// Nome: Júlio Cézar Taveira Araújo
// Matricula: 380776
// ---------------------

//-----------------
//--Module SRlatch
//-----------------

module SRlatch ( qn, q, r, s );
	input  r, s;
	output qn, q;	

	nor NOR1(q,s,qn);
	nor NOR2(qn,r,q);
	
endmodule//SRlatch

//----------------------
//--Test module SrLatch
//----------------------

module test;

SRlatch SR (p1,q1,r1,s1);

reg  r1, s1;
wire p1, q1;

initial begin:start
   s1 = 1; r1=1;

  end

  initial begin: main
 
   $display("\nExercicio 10-01 - Julio Cezar Taveira Araujo - 380776");
   $display("\n  Set [b] | Clear [b] | Q = [b] |Q = [b]\n");
   $monitor("Set [%b] | Clear [%b] | Q = [%b] |Q = [%b]", s1,r1, q1, p1);

        #1 s1 = 1; r1=0;
        #1 s1 = 0; r1=1;
        #1 s1 = 0; r1=0;


end
endmodule