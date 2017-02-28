
 // ------------------------- 
// Exemplo0023 - Comparador 
// Nome: Gustavo Jota Resende
// Matricula: 427413
// ------------------------- 
// ------------------------- 
// comparador
// ------------------------- 
 

module f4 (output [5:0] s, 
input [5:0] a, 
input [5:0] b);
assign s1 = (a | b);
endmodule // f4 

 
module testef4;  // FALTOU O CABECALHO DO MODULO

// ------------------------- definir dados
reg [5:0] x;
reg [5:0] y;
wire [5:0] z;

f4 modulo (z, x, y);

// ------------------------- parte principal
initial begin 
$display("Exemplo0023 - Gustavo Jota Resende - 427413"); 
$display("Test LU's comparador");
// projetar testes do somador complete

x = 6'b110011; y = 6'b110011; 
$monitor("%b (|) %b com comparador 1=igual %b = %b", z, x, y);  
end 
endmodule // test_f4 

//Teste
//000101 (& ou |) 000011 com chave zzzzzz = 00000xz