// -------------------------
// Exercicio0051 – FULL ADDER (Somador e Subtrador)
// Nome: Pedro Henrique Alves M. de Carvalho
// Matricula: 427452
// -------------------------

// -------------------------
//  full extensor
// -------------------------
module extensor (output [5:0] cs,
					input ce);

 assign cs[0] = ce;
 assign cs[1] = ce;
 assign cs[2] = ce;
 assign cs[3] = ce;
 assign cs[4] = ce;
 assign cs[5] = ce;

 // carry = {6{carryIn}}; outra possibilidade abandonada por erros na saida, gostaria de saber referente a esta forma
 // fonte: http://iroi.seu.edu.cn/books/asics/Verilog/LRM/HTML/04/ch04.1.htm

 endmodule // extensor



// -------------------------
//  full adder
// -------------------------
module fullAdder (output [5:0] s,
						output carryOut,
						input [5:0] a,
						input [5:0] b,
						input carryIn);

// almentar carry
 wire [5:0] carry;
 extensor modulo (carry, carryIn);


// B XOR carryIn
 wire [5:0] b1 = b ^ carry;

// descrever por portas
 assign s [0] = ((a[0] ^ b1[0]) ^ carryIn);
 wire c1 = ((a[0] & b1[0]) | ((a[0] ^ b1[0]) & carryIn));
 assign s [1] = ((a[1] ^ b1[1]) ^ c1);
 wire c2 = ((a[1] & b1[1]) | ((a[1] ^ b1[1]) & c1));
 assign s [2] = ((a[2] ^ b1[2]) ^ c2);
 wire c3 = ((a[2] & b1[2]) | ((a[2] ^ b1[2]) & c2));
 assign s [3] = ((a[3] ^ b1[3]) ^ c3);
 wire c4 = ((a[3] & b1[3]) | ((a[3] ^ b1[3]) & c3));
 assign s [4] = ((a[4] ^ b1[4]) ^ c4);
 wire c5 = ((a[4] & b1[4]) | ((a[4] ^ b1[4]) & c4));
 assign s [5] = ((a[5] ^ b1[5]) ^ c5);

 assign carryOut = (((a[5] & b1[5]) | ((a[5] ^ b1[5]) & c5)) ^ carryIn);

endmodule // fullAdder




// -------------------------
//  full igualZero
// -------------------------
module igualZero (output r,
					input [5:0] ent);

 assign r = (~(ent[0] || ent[1] || ent[2] || ent[3] || ent[4] || ent[5]));   //recebe o sinal e pega qualquer sinal diferente de 0 depois nega

 endmodule // igualZero




module test_fullAdder;
// ------------------------- definir dados
		reg [5:0] x;
		reg [5:0] y;
		reg  carryI;
		wire carryO;
		wire [5:0] soma;
		wire zero;

 fullAdder modulo (soma, carryO, x, y, carryI);
 igualZero modulo (zero, soma);

// ------------------------- parte principal
 initial begin
		$display("Exercicio 0051 - Pedro Henrique A. M. de Carvalho - 427452");
		$display("Test ALU Somador e Subtrador");
		
		x = 6'b000001;		y = 6'b010110;		carryI = 0;

 #1 $display("%b %b = (%b)%b", x, y, carryO, soma);
 #1 $display("%d + %d = (%b)%d", x, y, carryO, soma);
    $display("igual a zero?   %d",zero);


		x = 6'b000011;		y = 6'b000001;		carryI = 1;

 #1 $display("%b %b = (%b)%b", x, y, carryO, soma);
 #1 $display("%d - %d = (%b)%d", x, y, carryO, soma);
    $display("igual a zero?   %d",zero);


 end

endmodule // test_fullAdder