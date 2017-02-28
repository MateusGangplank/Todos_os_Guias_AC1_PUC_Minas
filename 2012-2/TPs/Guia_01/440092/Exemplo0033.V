// -------------------------
// Exemplo0033 - F5
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
// -- Chave
// -------------------------
module chave (output s,
input a,
input b);
wire f;
wire g;
andgate AND1 ( f, a, b);
andgate AND2 ( g, ~a, ~b);
orgate OR1 ( s, g, f);

// descrever por portas
endmodule // chave


// -------------------------
// f4_gate
// -------------------------
module f4 (output s,
 output s1,
input [2:0] a );
wire f;
wire g;
wire h;
wire i;
andgate AND1 ( f, a[1], a[0]);
orgate OR1 ( g, a[1], a[0]);

chave CH1 ( s, f, a[2]); 
chave CH2 ( s1, g, a[2]);


// descrever por portas
endmodule // f4
module test_f4;


// ------------------------- definir dados
reg [2:0] x;
wire z;
wire y;
f4 modulo ( z, y, x);
// ------------------------- parte principal
initial begin
$display("Exemplo0033 - Ailton Gomes - 440092");
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
endmodule // test_f5