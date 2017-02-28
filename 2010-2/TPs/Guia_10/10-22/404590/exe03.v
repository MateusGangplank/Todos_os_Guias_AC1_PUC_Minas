// ---------------------------
// -- Exercicio03
// ---------------------------

//
//--  Celso R Fran�a Jr
//--    PUC-MG - 404590

//-----------------
//--Module dlatch
//-----------------
module dlatch ( qn, q, en, d );
	input  d, en;
	output qn, q;	
	
	nand NAND1(s1,en,d);
        not NOT1 (s2,d);
 	nand NAND2(s3,en,s2);
	nand NAND3(qn,s1,q);
	nand NAND4(q,s3,qn);
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

   $display("Exercicio 03");
   $display("Celso R Franca Jr - 404590");
   $display("\n  En [b] | D [b] | Q = [b] |Q = [b]\n");
   $monitor("En [%b] | D [%b] | Q = [%b] |Q = [%b]",en ,d, q, qn);

        #1 d = 0; en = 1;
        #1 d = 0; en = 1;
        #1 d = 0; en = 0;
        #1 d = 1; en = 0;



end
endmodule