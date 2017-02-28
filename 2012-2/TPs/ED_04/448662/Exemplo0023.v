// ---------------
// Exemplo0023 - COMPARADOR DE IGUALDADE
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 24/08/2012
// ----------------

//-----------------
// LU 01
// ----------------
module lu01(output igual, input a, input b);

xnor xnor1(igual, a, b);

endmodule //lu01

//-----------------
// moduloI
// ----------------
module moduloI(output [2:0]igual, input [2:0]a, input [2:0]b);

lu01 l1(igual[0], a[0], b[0]);
lu01 l2(igual[1], a[1], b[1]);
lu01 l3(igual[2], a[2], b[2]);

endmodule //moduloI

// ----------------
// test moduloI
// ----------------
module test_moduloI;

// ---------------- Definir dados
reg [2:0]x;
reg [2:0]y;
wire [2:0]igual;

// ---------------- Intância
moduloI modulo1(igual, x, y);

// ---------------- Preparação
 initial begin: start
   x = 3'b000; y = 3'b001;
 end

// ---------------- Parte principal
 initial begin: main
  $display("Exemplo0023 - Josemar Alves Caetano - 448662.");
	$display("Test ALU's comparador de igualdade");

    $monitor("%b == %b? Resp.: %b", x, y, igual);


   #1 x = 3'b001; y = 3'b010;
   #1 x = 3'b010; y = 3'b011;
   #1 x = 3'b011; y = 3'b100;
   #1 x = 3'b100; y = 3'b101;
   #1 x = 3'b101; y = 3'b110;
   #1 x = 3'b110; y = 3'b111;
   #1 x = 3'b111; y = 3'b000;


 end //main
 
endmodule //test_moduloI