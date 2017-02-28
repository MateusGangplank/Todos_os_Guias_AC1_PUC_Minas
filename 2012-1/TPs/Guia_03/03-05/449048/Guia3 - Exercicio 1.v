//-- Miller - 449048
//-- Arquitetura de Coputadores
//-- Professor Theldo
//-- Guia 03
//-- Exercicio 1

module P1 ( output[3:0]s,
            input[3:0]a,
            input[3:0]b );
				
assign s = a & b;
endmodule


module P2 ( output[3:0]t,
				input[3:0]p,
				input[3:0]q );

assign t = p | q;
endmodule 

module exec1;

reg	[3:0] x; 
reg	[3:0] y; 
wire	[3:0] z;
wire	[3:0] w;
 
P1 modulo1(w, x, y);
P2 modulo(z, x, y); 
 
initial begin:start
x=0; y=0;
end
 
initial begin 
$display("Miller - 449048"); 
$display("Guia 3 - Exercicio 1");
$display("Alguns testes...");
$monitor("( AND %b & %b = %b ) e ( OR %b | %b = %b )", x, y, w, x, y, z); 


#1	x = 4'b0000;	y = 4'b0000;
#1	x = 4'b1110;	y = 4'b0001;
#1	x = 4'b1111;	y = 4'b0010;
#1	x = 4'b0011;	y = 4'b0011;
#1	x = 4'b0100;	y = 4'b0100;
#1	x = 4'b0010;	y = 4'b0101;
#1	x = 4'b1010;	y = 4'b0110;
#1	x = 4'b0110;	y = 4'b0111;
#1	x = 4'b0111;	y = 4'b1000;
#1	x = 4'b1001;	y = 4'b1001;
#1	x = 4'b1101;	y = 4'b1010;
#1	x = 4'b1011;	y = 4'b1011;
#1	x = 4'b1100;	y = 4'b1100;
#1	x = 4'b1000;	y = 4'b1101;
#1	x = 4'b0101;	y = 4'b1110;
#1	x = 4'b0001;	y = 4'b1111;
 
end 
 
endmodule