// -------------------------
// Exemplo0034 - F5
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
// f3_gate
// -------------------------
module f3 (output s,
input [1:0] a);
wire f;
wire g;
andgate AND1 ( f, a[0], a[1]);
andgate AND2 ( g, ~a[0], ~a[1]);
orgate OR1 ( s, f, g);
// descrever por portas
endmodule // f3
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


// -------------------------
// f5_gate
// -------------------------
module f5 (output s,
input [3:0] a);
wire f;
wire g;
wire h;
wire j;
wire i;
f4 P1 ( f, a[2:0]);
f3 p2 ( g, a[1:0]);
chave CH1 ( h, g, a[3]);
andgate AND3 ( j, h, a[3]);
andgate AND4 ( i, ~a[3], f);
orgate OR3 ( s, j, i);


// descrever por portas
endmodule // f5
module test_f5;

// ------------------------- definir dados
reg [3:0] x;
wire z;
f5 modulo (z, x);
// ------------------------- parte principal
initial begin
$display("Exemplo0034 - Ailton Gomes - 440092");
$display("Test LU's module"   );
 x = 4'b0000;
 $display("%b = %b", x, z);
 x = 4'b0010;
#1 $display("%b = %b", x, z); 
 x = 4'b0001;
#1 $display("%b = %b", x, z);
x = 4'b0011;
#1 $display("%b = %b", x, z);
 x = 4'b0100;
#1 $display("%b = %b", x, z); 
 x = 4'b0101;
#1 $display("%b = %b", x, z);
 x = 4'b0110;
#1 $display("%b = %b", x, z); 
 x = 4'b0111;
#1 $display("%b = %b", x, z);
 x = 4'b1000;
 $display("%b = %b", x, z);
 x = 4'b1010;
#1 $display("%b = %b", x, z); 
 x = 4'b1001;
#1 $display("%b = %b", x, z);
x = 4'b1011;
#1 $display("%b = %b", x, z);
 x = 4'b1100;
#1 $display("%b = %b", x, z); 
 x = 4'b1101;
#1 $display("%b = %b", x, z);
 x = 4'b1110;
#1 $display("%b = %b", x, z); 
 x = 4'b1111;
#1 $display("%b = %b", x, z);
end
endmodule // test_f5