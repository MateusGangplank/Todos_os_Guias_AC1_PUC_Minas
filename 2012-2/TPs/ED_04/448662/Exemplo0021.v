// ---------------
// Exemplo0021 - FULL ADDER
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 23/08/2012
// ----------------

// ----------------
// AU 01
// ----------------
module au01(output soma, output carryOut, input a, input b, input carryIn);
//Definição dos fios da AU
wire s0, d0, d1, d2;

//Definição das portas operadoradoras aritméticas da AU
xor xor1(s0, a, b);
xor xor2(soma, s0, carryIn);

//Definição da AU
and and1(d0, carryIn, b);
and and2(d1, a, b);
and and3(d2, a, carryIn);
or or1(carryOut, d0, d1, d2);

endmodule //au01

// ----------------
// full adder
// ----------------
module fullAdder(output [2:0]soma, output [2:0]carryOut, 
                 input [2:0]a, input [2:0]b, input carryIn);

au01 a1(soma[0], carryOut[0], a[0], b[0], carryIn);
au01 a2(soma[1], carryOut[1], a[1], b[1], carryIn);
au01 a3(soma[2], carryOut[2], a[2], b[2], carryIn);


endmodule //full adder

// ----------------
// test fullAdder
// ----------------
module test_fullAdder;

// ---------------- Definir dados
reg [2:0]x;
reg [2:0]y;
reg carryIn;
wire [2:0]soma;
wire [2:0]carryOut;

// ---------------- Instância
 fullAdder modulo(soma, carryOut, x, y, carryIn);
 
// ---------------- Preparação
 initial begin: start
  x = 3'b011; y = 3'b100;
  carryIn = 1'b0;
 end

// ---------------- Parte principal
 initial begin: main
   $display("Exemplo0021 - Josemar Alves Caetano - 448662.");
	$display("Test ALU's full adder");
	
    
    $monitor("%b + %b = %b. Vai-um: %b", x, y, soma, carryOut);

   #1 x = 3'b111; y = 3'b010;   
   #1 carryIn = 1'b1; x = 3'b000; y = 3'b001;
   #1 x = 3'b011; y = 3'b010;
   #1 x = 3'b110; y = 3'b001;
 
 end //main
 
endmodule //test_fullAdder