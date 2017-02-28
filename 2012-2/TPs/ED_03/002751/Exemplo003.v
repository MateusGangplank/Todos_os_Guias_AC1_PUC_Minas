 // ------------------------- 
// Exemplo0032 -  
// Nome: Milton costa teles da silva
// Matricula: 002751 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output[1:0]s, input  a, input  b,input ch); 
//--descrever por portas 
  wire p,q;
   or or1(s[0], a[0], b[0]);
	and and1(s[4], a[0], b[0]);
	mux1bit1 mux1(s,p,q,ch);

endmodule // f4 

module test_f4; 
// ------------------------- registradores e fios
   reg  x,y;  
   wire  z;
	f4 
	
	initial begin
		x = 4'b0000;
		y = 4'b0000;
	end	
	//instanciar
	f4 teste_f4(z,x,y);
// ------------------------- parte principal 
   initial begin 
	
	$display("Exemplo0031 - Milton costa teles da silva-002751"); 
	$display("Test LU's module"); 
	x = 4'b0011; y = 4'b0101; 
//--projetar testes do modulo
   #1 $display(" x  |  y  =  s");
   #1 $display("%4b %4b = %4b ",x,y, z[3:0]);
	#1 $display(" x  &  y  =  s");
   #1 $display("%4b %4b = %4b ",x,y, z[7:4]);
  end      
  
endmodule // test_f4 
 