// ---------------
// Exemplo0022 - FULL SUBTRACTOR
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 24/08/2012
// ----------------

// ----------------
// AU 02
// ----------------
module au02(output subtracao, output askOne, input a, input b, input carryIn);
//Definição dos fios da AU
wire s0, d0, d1, d2, a_n;

//Definição das portas operadoradoras aritméticas da AU
xor xor1(s0, a, b);
xor xor2(subtracao, s0, carryIn);

//Definição da AU
not not1(a_n, a);
and and1(d0, a_n, carryIn);
and and2(d1, a_n, b);
and and3(d2, b, carryIn);
or or1(askOne, d0, d1, d2);

endmodule //au02

// ----------------
// full subtractor
// ----------------
module fullSubtractor(output [2:0]subtracao, output [2:0]askOne,
                 input [2:0]a, input [2:0]b, input carryIn);

au02 a1(subtracao[0], askOne[0], a[0], b[0], carryIn);
au02 a2(subtracao[1], askOne[1], a[1], b[1], carryIn);
au02 a3(subtracao[2], askOne[2], a[2], b[2], carryIn);


endmodule //full subtractor

// ----------------
// test fullSubtractor
// ----------------
module test_fullSubtractor;

// ---------------- Definir dados
reg [2:0]x;
reg [2:0]y;
reg carryIn;
wire [2:0]subtracao;
wire [2:0]askOne;  //Pede - um

// ---------------- Instância
 fullSubtractor modulo(subtracao, askOne, x, y, carryIn);
 
// ---------------- Preparação
 initial begin: start
  x = 3'b011; y = 3'b100;
  carryIn = 1'b0;
 end

// ---------------- Parte principal
 initial begin: main
   $display("Exemplo0022 - Josemar Alves Caetano - 448662.");
	$display("Test ALU's full subtractor");
	
    
    $monitor("%b - %b = %b. Pede-um: %b", x, y, subtracao, askOne);

   #1 x = 3'b111; y = 3'b010;   
   #1 carryIn = 1'b1; x = 3'b000; y = 3'b001;
   #1 x = 3'b011; y = 3'b010;
   #1 x = 3'b110; y = 3'b001;
 
 end //main
 
endmodule //test_fullSubtractor