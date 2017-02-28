// ---------------------
// Guia 10
// Nome: Lucas Teixeira Santos
// Matricula: 415383
// ---------------------

module nor_nand (s,a,b);
input a,b;
output s;
wire nanda,nandb;
nand NAND1 (nanda,a);
nand NAND2 (nandb,b);
nand NAND3 (s,nanda,nandb);
endmodule

module latchsr (s,r,preset,clear,q,qn);
 output q,qn;
 input   s, r, preset, clear;
 wire  nor1,nor2, nand1, nand2;
 nor_nand NOR1 (nor1,s,nand2);
 nor_nand NOR2 (nor2,r,nand1);
 nand NAND1 (nand1, preset,nor1);
 nand NAND2 (nand2, clear,nor2);
 assign q = nand2;
 assign qn = nand1;
endmodule  // fim modulo latch

         
//teste do modulo
module testlatch;
reg s,r,pr,cl;
wire q,qn;
latchsr SR (s,r,pr,cl,q,qn);
initial begin
      $display("Exercicio 02|04 - Lucas Teixeira Santos - 415383");
      $display("Teste Latch S-R com Preset e Clear");
      $display("S  R  PR  CL  =  Q  Q'");
		// Melhor Testar via LogiSim.
       s=0; r=0; pr = 0; cl = 0;
  	#1	 $monitor("%b  %b  %b   %b   =  %b  %b", s, r, pr,cl,q, qn);
    #1  s=0; r=0; pr = 0; cl = 1;
    #1  s=0; r=0; pr = 1; cl = 0;
    #1  s=0; r=0; pr = 1; cl = 1;
    #1  s=0; r=1; pr = 0; cl = 0;
	 #1  s=0; r=1; pr = 0; cl = 1;
    #1  s=0; r=1; pr = 1; cl = 0;
	 #1  s=0; r=1; pr = 1; cl = 1;
    #1  s=1; r=0; pr = 0; cl = 0;
	 #1  s=1; r=0; pr = 0; cl = 1;
    #1  s=1; r=0; pr = 1; cl = 0;
	 #1  s=1; r=0; pr = 1; cl = 1;
	 #1  s=1; r=1; pr = 0; cl = 0;
    #1  s=1; r=1; pr = 0; cl = 1;
	 #1  s=1; r=1; pr = 1; cl = 0;
    #1  s=1; r=1; pr = 1; cl = 1;
 end

endmodule 
/* teste
    Teste Latch S-R com Preset e Clear
    S  R  PR  CL  =  Q  Q'
    0  0  0   0   =  1  1
    0  0  0   1   =  0  1
    0  0  1   0   =  1  0
    0  0  1   1   =  1  0
    0  1  0   0   =  1  1
    0  1  0   1   =  0  1
    0  1  1   0   =  1  0
    0  1  1   1   =  0  1
    1  0  0   0   =  1  1
    1  0  0   1   =  0  1
    1  0  1   0   =  1  0
    1  0  1   1   =  1  0
    1  1  0   0   =  1  1
    1  1  0   1   =  0  1
    1  1  1   0   =  1  0
    1  1  1   1   =  0  0
	 */
