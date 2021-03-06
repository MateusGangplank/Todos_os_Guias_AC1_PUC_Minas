// ---------------------
// Exemplo 10_02
// Nome: J�lio C�zar Taveira Ara�jo
// Matricula: 380776
// ---------------------

//-----------------
//--Module SRlatch
//-----------------

module SRlatch ( qn, q, r, s );

	input  r, s;
	output qn, q;	

	nand NAND1(q,s,qn);
	nand NAND2(qn,r,q);
endmodule

//----------------------
//--Test module SrLatch
//----------------------


module test;

SRlatch srlatch (p1,q1,r1,s1);

reg  r1, s1;
wire p1, q1;

initial begin:start
   s1 = 0; r1=0;

  end

  initial begin: main
 
   $display("\nExercicio 10-02 - Julio Cezar Taveira Araujo - 380776");
   $display("\n  Set [b] | Clear [b] | Q = [b] |Q = [b]\n");
   $monitor("Set [%b] | Clear [%b] | Q = [%b] |Q = [%b]", s1,r1, q1, p1);

        #1 s1 = 1; r1=0;
        #1 s1 = 0; r1=1;
        #1 s1 = 1; r1=1;


end
endmodule