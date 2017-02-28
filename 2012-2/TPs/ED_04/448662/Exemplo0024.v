// ---------------
// Exemplo0024 - COMPARADOR DE DESIGUALDADE
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 26/08/2012
// ----------------

//-----------------
// LU 02
// ----------------
module lu02(output diferente, input a, input b);

xor xor1(diferente, a, b);

endmodule //lu02

//-----------------
// moduloD
// ----------------
module moduloD(output [2:0]diferente, input [2:0]a, input [2:0]b);

lu02 l1(diferente[0], a[0], b[0]);
lu02 l2(diferente[1], a[1], b[1]);
lu02 l3(diferente[2], a[2], b[2]);

endmodule //moduloD

// ----------------
// test moduloD
// ----------------
module test_moduloD;

// ---------------- Definir dados
reg [2:0]x;
reg [2:0]y;
wire [2:0]diferente;

// ---------------- Intância
moduloD modulo1(diferente, x, y);

// ---------------- Preparação
 initial begin: start
   x = 3'b000; y = 3'b001;
 end

// ---------------- Parte principal
 initial begin: main
  $display("Exemplo0024 - Josemar Alves Caetano - 448662.");
	$display("Test ALU's comparador de desigualdade");

    $monitor("%b != %b? Resp.: %b", x, y, diferente);


   #1 x = 3'b001; y = 3'b010;
   #1 x = 3'b010; y = 3'b011;
   #1 x = 3'b011; y = 3'b100;
   #1 x = 3'b100; y = 3'b101;
   #1 x = 3'b101; y = 3'b110;
   #1 x = 3'b110; y = 3'b111;
   #1 x = 3'b111; y = 3'b000;


 end //main
 
endmodule //test_moduloD