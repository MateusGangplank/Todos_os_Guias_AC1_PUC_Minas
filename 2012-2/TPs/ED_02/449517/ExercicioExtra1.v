// -------------------------------------
// ExercicioExtra1 - COMPLEMENTO 1
// Nome: Ana Carolina Conceição de Jesus
// Matricula: 449517
//--------------------------------------
//--------------------------------------
//------- extra ------------------
//--------------------------------------

module complemento1;
// definir dados
reg[7:0] a;
reg[7:0] sa;
 

// ------------------------- parte principal
initial begin
$display("Exercicio Extra 1 - Ana Carolina - 449517");
$display("Exercicio 4 - Complemento 1 ");

a = 8'b00100101;
sa = ~a;

$display("se = %d = %5b", sa, sa);

end
endmodule // complemento1
