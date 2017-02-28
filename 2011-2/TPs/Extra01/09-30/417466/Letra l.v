//------------------------------------------------------
//--- Avaliação 01 - Nome: Jorge Luis dos Santos Leal
//--- Matricula; 417466
//------------------------------------------------------
/*
	  0000 0001 0010 0011 0100 0101 0110 0111 1000 1001 1010 1011 1100 1101 1110 1111
S0 =   0	  1    1    1     0	  0    1    1    0    0    0    1    0    0    0    0	
S1 =	 1	  0    0    0     0	  1    0    0    0    0    1    0    0    0    0    1	
s2 =	 0	  0    0    0     1	  0    0    0    1    1    0    1    1    1    1    0		

  ---j) Montar a descrição por portas do verilog do modulo capaz de calcular S2 pela expressão em d):
  ---

*/
 module Little(output s0,input[3:0]y);
	input a,b,c,d;
		wire[6:0]x;
	
	not NOT01(x[0],y[0]);
	not NOT02(x[1],y[1]);
	and AND01(x[2],x[0],y[2]);
	and AND02(x[3],x[1],y[3]);
	or OR01(x[4],x[0],y[2]);
	and AND03(x[5],x[3],x[4]);
	or OR02(s0,x[2],x[5]);
 
   endmodule//saidas s2

  module Teste;

	reg [3:0]a;
	wire s0;

	Little little (s0,a);

	initial begin
	end

	initial begin
	#1 a[0]=0; a[1]=0; a[2]=0; a[3]=0;

	#1 $display(" Jorge Luis dos Santos Leal ");
	#1 $display("letra d)");
	#1 $display(" abcd | s2 ");
		$monitor(" %b |  %b ",a,s0);
		   
    #1  a[0]=0; a[1]=0; a[2]=0; a[3]=1;
    #1  a[0]=0; a[1]=0; a[2]=1; a[3]=0; 
    #1  a[0]=0; a[1]=0; a[2]=1; a[3]=1; 
    #1  a[0]=0; a[1]=1; a[2]=0; a[3]=0; 
    #1  a[0]=0; a[1]=1; a[2]=0; a[3]=1; 
    #1  a[0]=0; a[1]=1; a[2]=1; a[3]=0; 
    #1  a[0]=0; a[1]=1; a[2]=1; a[3]=1; 
    #1  a[0]=1; a[1]=0; a[2]=0; a[3]=0; 
    #1  a[0]=1; a[1]=0; a[2]=0; a[3]=1;
    #1  a[0]=1; a[1]=0; a[2]=1; a[3]=0;
    #1  a[0]=1; a[1]=0; a[2]=1; a[3]=1;
    #1  a[0]=1; a[1]=1; a[2]=0; a[3]=0;
    #1  a[0]=1; a[1]=1; a[2]=0; a[3]=1;
    #1  a[0]=1; a[1]=1; a[2]=1; a[3]=0;
    #1  a[0]=1; a[1]=1; a[2]=1; a[3]=1; 
 

	end	
   endmodule//teste

