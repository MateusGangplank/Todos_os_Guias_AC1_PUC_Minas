// -------------------------
// Exemplo0025 – COMPLEMENTO DE 2
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// complementoDe2
// -------------------------
module complementoDe2 (output [2:0] s,
input [2:0] a);


wire temp1,temp2,temp3,temp4,temp5;

not not1   ( temp1 , a[2] );
and and1   ( temp2 , temp1, a[0] );
xor xor1   ( temp3 , a[2],a[1] );
not not2   ( temp4, a[0] );
and and2   ( temp5, temp3, temp4 );
or or1     ( s[2] , temp5, temp2 );

xor xor2   ( s[1] , a[1], a[0] );

buf bur1   ( s[0], a[0] );





endmodule // complementoDe2
module test_complementoDe2;
// ------------------------- definir dados
reg  [2:0] x;
wire [2:0] complemento;

complementoDe2 fa1 (complemento,x);

// ------------------------- parte principal
initial begin
$display("Exemplo0025 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Test ALU’s complementoDe2");

x = 3'b000;
// projetar testes do modulo
$display("entrada      saida  ");
#1 $monitor("%3b             %3b",x,complemento);

#1 x = 3'b001;
#1 x = 3'b010;
#1 x = 3'b011;
#1 x = 3'b100;
#1 x = 3'b101;
#1 x = 3'b110;
#1 x = 3'b111;
end
endmodule // test_complementoDe2