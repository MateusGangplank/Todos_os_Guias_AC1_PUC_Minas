// ---------------
// Exemplo0025 - CALCULADOR DE COMPLEMENTO DE 2
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 26/08/2012
// ----------------

// ----------------
// Complemento de 1
// ----------------
module c1(output [2:0]s, input [2:0]a);
//Definição do módulo
 not not1(s[0], a[0]);
 not not2(s[1], a[1]);
 not not3(s[2], a[2]);

endmodule //c1

// ----------------
// LU 03
// ----------------
module lu03(output [2:0]saida, output overflow, input [2:0]a);
//Definição dos fios do subcircuito
wire s0, s1, s2, s3,
     a1_n, a0_n,
     a2_b, a0_b;

//Definição das portas operadoras
not not1(a1_n, a[1]);
not not2(a0_n, a[0]);
xor xor1(s0, a[2], a[0]);
and and1(s1, s0, a[1]);
and and2(s2, a[2], a0_n);
and and3(s3, a[2], a1_n);
or or1(saida[2], s1, s2, s3);
xor xor2(saida[1], a[1], a[0]);
buf buf1(saida[0], a0_n);
and and4(overflow, a[2], a[1], a[0]);

endmodule //lu03


// ----------------
// test lu03
// ----------------
module test_lu03;

// ---------------- Definição de dados
 reg [2:0]a;
 wire [2:0]cpl1;  //Complemento de 1
 wire [2:0]cpl2;  //Complemento de 2
 wire overflow;
 
// ---------------- Instância
 c1 modulo0(cpl1, a);
 lu03 modulo(cpl2, overflow, cpl1);

// ---------------- Preparação
 initial begin: start
  a = 3'b000;
 end

// ---------------- Parte principal
  initial begin: main
  $display("Exemplo0025 - Josemar Alves Caetano - 448662.");
	$display("Test ALU's calculador de complemento de 2:\n");

    $monitor("Número: %b. Complemento de 2: %b. Overflow? %b", a, cpl2, overflow);

    #1 a = 3'b001;
    #1 a = 3'b010;
    #1 a = 3'b011;
    #1 a = 3'b100;
    #1 a = 3'b101;
    #1 a = 3'b110;
    #1 a = 3'b111;


 end //main

endmodule //test_lu03



