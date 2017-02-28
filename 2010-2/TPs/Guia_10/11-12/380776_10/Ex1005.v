// ---------------------
// Exemplo 10_05
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
//-----------------
//--Module dlatch
//-----------------

module dlatch ( qn, q, en, d );

	input  d, en;
	output qn, q;	
	
	nand NAND1(s1,en,d);
   not NOT1 (s2,d);
 	nand NAND2(s3,en,s2);
	SRlatch C1(qn, q, s1, s3);
	
endmodule

//----------------------
//--Test module dLatch
//----------------------

module test;

reg  d, en;
wire nq, q;
dlatch Latch1( qn, q, en, d );

initial begin:start
   d = 1; en=1;

  end

  initial begin: main

   $display("\nExercicio 10-05 - Julio Cezar Taveira Araujo - 380776");
   $display("\n  En [b] | D [b] | Q = [b] |Q = [b]\n");
   $monitor("En [%b] | D [%b] | Q = [%b] |Q = [%b]",en ,d, q, qn);

        #1 d = 0; en = 1;
        #1 d = 0; en = 1;
        #1 d = 0; en = 0;
        #1 d = 1; en = 0;



end

endmodule