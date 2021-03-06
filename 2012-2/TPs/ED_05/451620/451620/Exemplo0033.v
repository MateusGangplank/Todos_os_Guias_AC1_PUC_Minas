// -------------------------
// Exemplo0033 � SOMADOR ALGEBRICO COM INC
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

// somadorAlgebrico
// -------------------------
module somadorAlgebrico (output s0, output s1,
input [0:2] x);


wire temp1,temp2;

xor xor1      ( temp1, x[2], x[1] );

fullAdder fa1 ( s0, temp2, temp1, x[0], x[2] );

xor xor2      ( s1, temp2, x[2] );

endmodule // somadorAlgebrico

// incrementoDe1
// -------------------------
module incrementoDe1 (output s, output carry,
input x, input var);

wire var;

xor xor1 ( s , x, var );
and and1 ( carry, x, var );


endmodule // somadorAlgebrico

module test_somadorAlgebrico;
// ------------------------- definir dados
reg  [0:2] x;
reg var;
wire s0,s1,zeroFlag,inc1,inc2;

somadorAlgebrico fa1 (s0,s1,x);
nor nor1             ( zeroFlag, s0, s1 );
incrementoDe1 inc   ( inc1 , inc2 , x[0], var );

// ------------------------- parte principal
initial begin
$display("Exemplo0033 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Test ALU�s somadorAlgebricoComINC");

x = 3'b000;
var = 1;
// projetar testes do modulo
$display("xyc     s1  s0    zeroFlag      inc de x      inc de x");
#1 $monitor("%3b     %b    %b         %b                    %b                 %b",x,s1,s0,zeroFlag,inc2,inc1);

#1 x = 3'b001;
#1 x = 3'b010;
#1 x = 3'b011;
#1 x = 3'b100;
#1 x = 3'b101;
#1 x = 3'b110;
#1 x = 3'b111;
end
endmodule // test_somadorAlgebrico