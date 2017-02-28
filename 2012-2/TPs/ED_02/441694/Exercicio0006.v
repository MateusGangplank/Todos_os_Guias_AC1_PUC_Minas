// ------------------------- 
// Exercicio0006
// Nome: Lucas Cardoso 
// Matricula: 441694 
// -------------------------

// ------------------------- 
// -- C1 gate 
// ------------------------- 
module C1gate (output [7:0] s, input [7:0] a);
assign s = ~a ;
endmodule

// --------------------- 
// -- test and gate 
// --------------------- 
module testC1gate; 

// ------------------------- dados locais 
reg [7:0]a; // definir registradores 
wire [7:0]s; // definir conexao (fio) 

// ------------------------- instancia 
C1gate ComplementoDe1 (s,a);

// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=8'b00000000;
end 

// ------------------------- parte principal 
initial begin 
$display("Exemplo0021 - Lucas Cardoso - 441694"); 
$display("Test C1gate"); 
$display("\na = s\n"); 
#1 $display("%8b = %8b", a, s); 
a = 1;
#1 $display("%8b = %8b", a, s); 
a = 2;
#1 $display("%8b = %8b", a, s);
a = 5; 
#1 $display("%8b = %8b", a, s);
a = 14; 
#1 $display("%8b = %8b", a, s);
a = 28; 
#1 $display("%8b = %8b", a, s); 
a = 36;
#1 $display("%8b = %8b", a, s); 
a = 42;
#1 $display("%8b = %8b", a, s); 
a = 69;
#1 $display("%8b = %8b", a, s); 
a = 75;
#1 $display("%8b = %8b", a, s); 
a = 93;
#1 $display("%8b = %8b", a, s); 
a = 195;
#1 $display("%8b = %8b", a, s); 

end 
endmodule // testandgate 