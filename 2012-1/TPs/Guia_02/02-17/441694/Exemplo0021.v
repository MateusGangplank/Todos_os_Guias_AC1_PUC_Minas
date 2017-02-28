// ------------------------- 
// Exemplo0021
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
a = 2;
#1 $display("%8b = %8b", a, s); 
a = 4;
#1 $display("%8b = %8b", a, s);
a = 8; 
#1 $display("%8b = %8b", a, s);
a = 13; 
#1 $display("%8b = %8b", a, s);
a = 17; 
#1 $display("%8b = %8b", a, s); 
a = 29;
#1 $display("%8b = %8b", a, s); 
a = 46;
#1 $display("%8b = %8b", a, s); 
a = 69;
#1 $display("%8b = %8b", a, s); 
a = 73;
#1 $display("%8b = %8b", a, s); 
a = 97;
#1 $display("%8b = %8b", a, s); 
a = 179;
#1 $display("%8b = %8b", a, s); 

end 
endmodule // testandgate 