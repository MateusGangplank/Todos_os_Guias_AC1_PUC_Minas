  // ------------------------- 
// Exemplo0023 - comparador para igualdade 
// Nome: Milton costa teles da silva
// Matricula: 002751 
// -------------------------  
// ------------------------- 

module funcao(output s, input[2:0]x, input[2:0]y);
	wire [2:0]w;
	xnor xnor1(w[0],x[0],y[0]);
	xnor xnor2(w[1],x[1],y[1]);
	xnor xnor3(w[2],x[2],y[2]);
	and and1(s,w[0],w[1],w[2]);
endmodule //funcao

module principal;
	reg [2:0]x,y;
	wire s;
	funcao f1(s,x,y);
	
	initial begin
		x = 0; y = 0;
		$display("Exemplo0023 -  Milton costa teles da silva - 002751"); 
		$display("Test LU's comparador para igualdade");
		$display("  a   b  = saida");
		$monitor("%3b  %3b = %3b",x,y,s);
	  #1 y = 3'b001;
	  #1 x = 3'b011; y = 3'b001; 
     #1 y = 3'b010; 
	  #1 y = 3'b011;  
	  #1 y = 3'b100;
	  #1 x = 3'b010; 
	  #1 y = 3'b010; 
	  #1 y = 3'b110;
	  #1 y = 3'b111;

	end
endmodule //principal