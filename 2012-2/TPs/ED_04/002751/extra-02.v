  // ------------------------- 
// Extra-02 - igualdade ou a diferença 
// Nome: Milton costa teles da silva
// Matricula: 002751 
// -------------------------  
// ------------------------- 
module comparador(output s, input [2:0]a,input[2:0]b, input key);
	wire [2:0]w;
	wire w1;
	xnor xnor1(w[0],a[0],b[0]);
	xnor xnor2(w[1],a[1],b[1]);
	xnor xnor3(w[2],a[2],b[2]);
	and and1(w1,w[0],w[1],w[2]);
	xor xor1(s,key,w1);
	
endmodule //comparador

module principal;
	reg [2:0]x,y;
	reg key;
	wire s;
	
	comparador c1(s,x,y,key);
	
	initial begin
		key = 0; x = 4'b000; y = 3'b000;
		$display("Extra-02 -  Milton costa teles da silva - 002751"); 
		$display("Test LU's igualdade ou a diferença ");
		$display("\t ch  a   b   = saida");
		$monitor("\t  %b %3b  %3b = %b",key,x,y,s);
     #1 key = 1;    
	  #1 key = 0; y = 3'b001;
	  #1 key = 1; 
	     


 

	end
endmodule //principal