// -------------------------
// Exemplo0032 - F4
// Nome: Ailton Gomes
// Matricula: 440092
// -------------------------
// --       PORTAS        --
// -------------------------
// -------------------------
// -- AND
// -------------------------
module andgate (output s,
input  a,
input  b);
assign s = a & b;
// descrever por portas
endmodule // andgate
// -------------------------
// -- AND3
// -------------------------
module and3gate (output s,
input  a,
input  b,
input  c);
assign s = a & b & c;
// descrever por portas
endmodule // and3gate
// -------------------------
// -- ORgate
// -------------------------
module orgate (output s,
input a,
input b);
assign s = a | b;
// descrever por portas
endmodule // orgate
// -------------------------
// -- OR3gate
// -------------------------
module or3gate (output s,
input a,
input b,
input c);
assign s = a | b | c;
// descrever por portas
endmodule // or3gate
// -------------------------


// -------------------------
// f4_gate
// -------------------------
module f4 (output s,
input [2:0] a);
wire f;
wire g;
wire h;
and3gate AND1 ( f, a[0], a[1], a[2]);
orgate OR1 ( g, f, ~a[2]);
or3gate OR2 ( h, a[0], a[1], f);
andgate AND2 ( s, h, g);
// descrever por portas
endmodule // f4
module test_f4;
// ------------------------- definir dados
reg [2:0] x;
wire z;
f4 modulo (z, x);
// ------------------------- parte principal
initial begin
$display("Exemplo0032 - Ailton Gomes - 440092");
$display("Test LU's module"   );
 x = 4'b000;
 $display("%b = %b", x, z);
 x = 4'b010;
#1 $display("%b = %b", x, z); 
 x = 4'b001;
#1 $display("%b = %b", x, z);
x = 4'b011;
#1 $display("%b = %b", x, z);
 x = 4'b100;
#1 $display("%b = %b", x, z); 
 x = 4'b101;
#1 $display("%b = %b", x, z);
 x = 4'b110;
#1 $display("%b = %b", x, z); 
 x = 4'b111;
#1 $display("%b = %b", x, z);

end
endmodule // test_f4