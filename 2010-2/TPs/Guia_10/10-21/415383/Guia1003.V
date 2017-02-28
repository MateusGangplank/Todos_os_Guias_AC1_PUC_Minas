// ---------------------
// Guia 10
// Nome: Lucas Teixeira Santos
// Matricula: 415383
// ---------------------

module latchd (d,enable,preset,clear,q,qn);
 output q,qn;
 input   d, enable, preset, clear;
 wire  nand1,nand2,notd,d_enable,dnot_enable;
 not DNOT (notd,d);
 nand NAND00 (d_enable,d,enable);
 nand NAND01 (dnot_enable,notd,enable);
 nand NAND10 (nand1,preset,nand2,d_enable);
 nand NAND11 (nand2,clear,nand1,dnot_enable);
 assign q = nand2;
 assign qn = nand1;
endmodule  // fim modulo latch

         
//teste do modulo
module testlatch;
reg d,enable,pr,cl;
wire q,qn;
latchd D (d,enable,pr,cl,q,qn);
initial begin
      $display("Exercicio 02 - Lucas Teixeira Santos - 415383");
      $display("Teste Latch D com Preset e Clear");
      $display("D  EN  PR  CL  =  Q  Q'");
		// Melhor Testar via LogiSim.
       d=0; enable=0; pr = 0; cl = 0;
  	#1	 $monitor("%b  %b   %b   %b   =  %b  %b", d, enable, pr,cl,q, qn);
    #1  d=0; enable=0; pr = 0; cl = 1;
    #1  d=0; enable=0; pr = 1; cl = 0;
    #1  d=0; enable=0; pr = 1; cl = 1;
    #1  d=0; enable=1; pr = 0; cl = 0;
	 #1  d=0; enable=1; pr = 0; cl = 1;
    #1  d=0; enable=1; pr = 1; cl = 0;
	 #1  d=0; enable=1; pr = 1; cl = 1;
    #1  d=1; enable=0; pr = 0; cl = 0;
	 #1  d=1; enable=0; pr = 0; cl = 1;
    #1  d=1; enable=0; pr = 1; cl = 0;
	 #1  d=1; enable=0; pr = 1; cl = 1;
	 #1  d=1; enable=1; pr = 0; cl = 0;
    #1  d=1; enable=1; pr = 0; cl = 1;
	 #1  d=1; enable=1; pr = 1; cl = 0;
    #1  d=1; enable=1; pr = 1; cl = 1;
 end

endmodule 
/* teste
    Teste Latch D com Preset e Clear
    D  EN  PR  CL  =  Q  Q'
    0  0   0   0   =  1  1
    0  0   0   1   =  0  1
    0  0   1   0   =  1  0
    0  0   1   1   =  1  0
    0  1   0   0   =  1  1
    0  1   0   1   =  1  1
    0  1   1   0   =  1  0
    0  1   1   1   =  1  0
    1  0   0   0   =  1  1
    1  0   0   1   =  0  1
    1  0   1   0   =  1  0
    1  0   1   1   =  1  0
    1  1   0   0   =  1  1
    1  1   0   1   =  0  1
    1  1   1   0   =  1  1
    1  1   1   1   =  0  1
*/
