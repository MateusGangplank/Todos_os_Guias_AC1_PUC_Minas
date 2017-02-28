
// Exemplo0033 - LU and e or e nand e nor
// Nome: Pedro Henrique H. Guedes 
// Matricula: 397260

// -- LU

module cx1 (output [3:0] s0, 
			   input [3:0] s5, 
			   input [3:0] s3, 
			   input [3:0] chave); 
 assign s0 = (s5 & ~chave) | (s3 & chave); 
	endmodule // cx1
	
module cx2 (output [3:0] s1, 
	         input [3:0] s2, 
		      input [3:0] s4, 
		      input [3:0] chave); 
 assign s1 = (s2 & ~chave) | (s4 & chave); 
	endmodule // cx2
	
module orGate (output [3:0] s5, 
		  		   input [3:0] w, 
			  		input [3:0] x); 
 assign s5 = (w | x);         
 	endmodule // orGate 
	
module andGate (output [3:0] s2, 
			  		 input [3:0] w, 
			  		 input [3:0] x); 
 assign s2 = (w & x); 
	endmodule // andGate 
	
module norGate (output [3:0] s4, 
			  		 input [3:0] w, 
			  		 input [3:0] x); 
 assign s4 = ~(w | x);         
 	endmodule // norGate 
	
module nandGate (output [3:0] s3, 
			  		  input [3:0] w, 
			  		  input [3:0] x); 
 assign s3 = ~(w & x); 
	endmodule // nandGate 
	
	module test_LU; 
// ------------------------- definir dados 
	reg [3:0] w; 
	reg [3:0] x; 
	reg [3:0] chave; 
	
	wire [3:0] s0; 
	wire [3:0] s1; 
	wire [3:0] s2; 
	wire [3:0] s3; 
	wire [3:0] s4; 
	wire [3:0] s5; 
	
	orGate domada (s5, w, x);
	nandGate bilara (s3, w, x);
	andGate bonanza (s2, w, x);
	norGate pitanga (s4, w, x);
	cx1 fox (s0, s5, s3, chave);
	cx2 danubio (s1, s2, s4, chave);
	
// ------------------------- parte principal 
initial begin 
	$display("Exemplo0033 - Felipe Pacifico - 389868"); 
	$display("Test LU's module"); 
	
	w = 4'b0011; x = 4'b0101;
	#1 chave = 4'b1111;
	$monitor("\n%b (| ou ~&) %b chave %b = %b \n%b (~| ou &) %b chave %b = %b", w, x, chave, s0, w, x, chave, s1); 
	#2 chave = 4'b0000;
	
	w = 4'b0000; x = 4'b0000;
	#1 chave = 4'b1111;
	$monitor("\n%b (| ou ~&) %b chave %b = %b \n%b (~| ou &) %b chave %b = %b", w, x, chave, s0, w, x, chave, s1); 
	#2 chave = 4'b0000;
	
	w = 4'b0010; x = 4'b0001;
	#1 chave = 4'b1111;
	$monitor("\n%b (| ou ~&) %b chave %b = %b \n%b (~| ou &) %b chave %b = %b", w, x, chave, s0, w, x, chave, s1);
	#2 chave = 4'b0000;
	
	w = 4'b0001; x = 4'b0011;
	#1 chave = 4'b1111;
	$monitor("\n%b (| ou ~&) %b chave %b = %b \n%b (~| ou &) %b chave %b = %b", w, x, chave, s0, w, x, chave, s1); 
	#2 chave = 4'b0000;
	
	w = 4'b0101; x = 4'b0010;
	#1 chave = 4'b1111;
	$monitor("\n%b (| ou ~&) %b chave %b = %b \n%b (~| ou &) %b chave %b = %b", w, x, chave, s0, w, x, chave, s1); 
	#2 chave = 4'b0000;
	
	w = 4'b1010; x = 4'b0011;
	#1 chave = 4'b1111;
	$monitor("\n%b (| ou ~&) %b chave %b = %b \n%b (~| ou &) %b chave %b = %b", w, x, chave, s0, w, x, chave, s1);
	#2 chave = 4'b0000;
	
	w = 4'b1001; x = 4'b0011;
	#1 chave = 4'b1111;
	$monitor("\n%b (| ou ~&) %b chave %b = %b \n%b (~| ou &) %b chave %b = %b", w, x, chave, s0, w, x, chave, s1); 
	#2 chave = 4'b0000;
end 
endmodule // test_f5 

// ------------------------- testes