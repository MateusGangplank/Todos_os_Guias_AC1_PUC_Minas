// -------------------------
// Exemplo0021 – FULL ADDER
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// full adder
// -------------------------
module fullAdder (output s0,output s1,
input a,
input b,
input carryIn);

wire temp1,temp2,temp3;

xor xor1 ( temp1,a,b );
and and1 ( temp2,a,b );
xor xor2 ( s0,carryIn,temp1 );
and and2 ( temp3,carryIn,temp1 );
or or1   ( s1, temp2, temp3 );


endmodule // fullAdder
module test_fullAdder;
// ------------------------- definir dados
reg  x;
reg  y;
reg carry;
wire [2:0] soma;

fullAdder fa1 (soma[0],soma[1],x,y,carry);

// ------------------------- parte principal
initial begin
$display("Exemplo0021 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Test ALU’s full adder");

x = 0; y = 0; carry = 0;
// projetar testes do modulo
#1 $monitor("%b + %b + %b = %b %b",x,y,carry, soma[1],soma[0]);

#1 x = 0; y = 0; carry = 1;
#1 x = 0; y = 1; carry = 0;
#1 x = 0; y = 1; carry = 1;
#1 x = 1; y = 0; carry = 0;
#1 x = 1; y = 0; carry = 1;
#1 x = 1; y = 1; carry = 0;
#1 x = 1; y = 1; carry = 1;
end
endmodule // test_fullAdder