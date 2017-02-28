// -------------------------
// Exemplo0009 - AND
// Nome: Guilherme Alves
// Matricula: 450161
// -------------------------
// -------------------------
// -- AND gate
// -------------------------
module ounegadogate(output s,input [7:0]a);
assign s = (a[0] | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]);

endmodule//fim ounegado

module testeonegadogate;
reg [7:0]a;
wire s;

ounegadogate OUN(s,a);

 initial begin:start
 
 a = 8'b00000000;
 
 end
 
 initial begin
 
 #1 $monitor(s);
 end
 
 endmodule