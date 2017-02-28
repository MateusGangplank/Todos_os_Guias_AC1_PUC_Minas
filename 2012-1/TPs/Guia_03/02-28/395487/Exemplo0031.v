// --------------------------------------
// Exemplo0031 - F4 
// Nome:Alvaro Henrique de Araujo Rungue
// Matricula: 395487
// --------------------------------------

// ------------------------- 
// f4_gate 
// ------------------------- 

module f4 ( output [3:0] s1 , output [3:0] s2 , input [3:0] a , input [3:0] b);
 
//-- and para os bits - saida s1
and AND0(s1[0],a[0],b[0]); 
and AND1(s1[1],a[1],b[1]);
and AND2(s1[2],a[2],b[2]);
and AND3(s1[3],a[3],b[3]);

//-- or para os bits - saida s2
or OR0(s2[0],a[0],b[0]); 
or OR1(s2[1],a[1],b[1]);
or OR2(s2[2],a[2],b[2]);
or OR3(s2[3],a[3],b[3]);

endmodule //-- f4 



module test_f4; 

// ------------------------- definir dados
reg [3:0] x; 
reg [3:0] y; 
wire [3:0] z1;
wire [3:0] z2;
f4 modulo ( z1 , z2 , x , y); 

// ------------------------- parte principal 

initial begin 
$display("Exemplo0031 - Alvaro Henrique de Araujo Rungue - 395487"); 
$display("\nTest LU's module:"); 
x = 4'b0011; y = 4'b0101; 

//-- projetar testes do modulo 
#1 $display("%3b %3b %3b %3b", x , y , z1 , z2); 
end 

endmodule //-- test_f4 