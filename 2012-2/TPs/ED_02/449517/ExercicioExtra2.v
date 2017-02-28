// -------------------------------------
// ExercicioExtra1 - COMPLEMENTO 2
// Nome: Ana Carolina Conceição de Jesus
// Matricula: 449517
//--------------------------------------
//--------------------------------------
//------- extra ------------------
//--------------------------------------

module complemento2;
// definir dados
reg[7:0] a;
reg[7:0] sa;
 

// ------------------------- parte principal
initial begin
$display("==== Exercicio Extra 2 - Ana Carolina - 449517");
$display(" ========= Complemento 2 ==================== ");

a = 8'b00100101;
sa = ~a+1;

$display("se = %d = %5b", sa, sa);

end
endmodule // complemento2
