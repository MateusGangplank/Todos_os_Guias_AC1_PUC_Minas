// ------------------------- 
// Extra0002 - Complemento 
// Nome: Filipe Viana de Miranda 
// Matricula: 446415
// ------------------------- 
// ------------------------- 
// --- Complemento 2 
// ------------------------- 
module C2 (output [7:0] s, input [7:0] a);
assign s = ~a + 1'b1 ;
endmodule
// --------------------- 
// -- test C2 
// --------------------- 
module testC2; 
// ------------------------- dados locais 
reg [7:0]a; // definir registradores 
wire [7:0]s; // definir conexao (fio) 
// ------------------------- instancia 
C2 Complemento2 (s,a); 
// ------------------------- preparacao 
initial begin:start 
$display("Extra02 - Filipe Viana de Miranda - 446415"); 
$display("Test Complemento 2"); 
$display("\na = s\n"); 
a = 8'b00000000;
$monitor("%8b = %8b", a, s); 
#1 a = 1;
#1 a = 5;
#1 a = 7;
#1 a = 12;
#1 a = 24;
#1 a = 34;
#1 a = 67;
#1 a = 100;
#1 a = 125;
#1 a = 200;
#1 a = 255;
end
endmodule
//OBS:
//Não consegui resolver o caso do overflow para a = 8'b00000000
//Não consegui montar o circuito em logisim para representar 