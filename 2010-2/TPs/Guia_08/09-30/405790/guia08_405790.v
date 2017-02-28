// ------------------------------
// Guia 08 - 30/09
// Nome: Bruno Calil Nicoliello Moreira
// Matricula: 405790
// ------------------------------

// --------------
// -- Exercicio01
// --------------

module Numero_01 (s, a, b, c, d);
	
	input   a, b, c ,d;
	output s;
	
	wire sa1, sa2, sa3, sa4, sa5, sa6;
	
		// instancia	
	not NOT1 (sa1, d);
	not NOT2 (sa2, a);
	not NOT3 (sa3, b);
	
	and AND1 (sa4, a, b, sa1);
	and AND2 (sa5, sa2, c);
	and AND3 (sa6, sa3, c);
	
	or OR1 (s, sa4, sa5, sa6);
	
endmodule // Numero_01


// --------------
// -- Exercicio02
// --------------

module Numero_02 (s,a, b, c, d);
	
	input   a, b, c, d;
	output s;
	
	wire sa1, sa2, sa3, sa4, sa5, sa6, sa7, sa8, sa9;
	
		// instancia	
	not NOT1 (sa1, a);
	not NOT2 (sa2, b);
	not NOT3 (sa3, c);
	not NOT4 (sa4, d);
	
	and AND1 (sa5, sa1, sa2, sa4);
	and AND2 (sa6, sa1, sa3, sa4);
	and AND3 (sa7, sa2, sa3, sa4);
	and AND4 (sa8, a, sa2, d);
	and AND5 (sa9, a, sa3, d);
	
	or OR1 (s, sa5, sa6, sa7, sa8, sa9);
	
endmodule // Numero_02


// --------------
// -- Exercicio03
// --------------

module Numero_03 (s, a, b, c, d, e);
	
	input   a, b, c, d, e;
	output s;
	
	wire sa1, sa2, sa3;
	
		// instancia	
	not NOT1 (sa1, a);
	not NOT2 (sa2, b);
	not NOT3 (sa3, c);
	not NOT4 (sa4, d);
	not NOT5 (sa5, e);
	
	and AND1 (sa6, a, b, d, e);
	and AND2 (sa7, sa1, sa3, sa4);
	and AND3 (sa8, sa2, sa4, e);
	and AND4 (sa9, sa2, sa4, c);
	and AND5 (sa10, b, c, d);
	and AND6 (sa11, c, e);
	and AND7 (sa12, a, sa2, sa3, d, sa5);
	
	or OR1 (s, sa6, sa7, sa8, sa9, sa10, sa11, sa12);
	
endmodule // Numero_03


// --------------
// -- Exercicio04
// --------------

module Numero_04 (s, a, b ,c ,d);
	
	input   a, b, c, d;
	output s;
	
	wire sa1, sa2, sa3, sa4, sa5, sa6, sa7, sa8, sa9, sa10, sa11, sa12;
	
		// instancia	
	nand NAND1 (sa1, d);
	nand NAND2 (sa2, a, b, sa1);
	nand NAND3 (sa3, sa2);
	nand NAND4 (sa4, sa3);
	nand NAND5 (sa5, a);
	nand NAND6 (sa6, c, sa5);
	nand NAND7 (sa7, sa6);
	nand NAND8 (sa8, sa7);
	nand NAND9 (sa9, b);
	nand NAND10 (sa10, c, sa9);
	nand NAND11 (sa11, sa10);
	nand NAND12 (sa12, sa11);
	nand NAND13 (s, sa4, sa8, sa12);
	
endmodule // Numero_04


// --------------
// -- Exercicio05
// --------------

module Numero_05 (s, a, b, c, d);
	
		input a, b, c, d;
		output s;
		
		wire sa1, sa2, sa3, sa4, sa5, sa6, sa7, sa8, sa9, sa14, sa21, sa26, sa31, sa32;
		
		nor NOR1 (sa1, a);
		nor NOR2 (sa2, sa1);
		nor NOR3 (sa3, b);
		nor NOR4 (sa4, sa3);
		nor NOR5 (sa5, d);
		nor NOR6 (sa6, sa5);
		nor NOR7 (sa7, sa2, sa4, sa6);
		
		nor NOR8 (sa8, c);
		nor NOR9 (sa9, sa8);
		nor NOR14 (sa14, sa2, sa6, sa9);
		
		nor NOR21 (sa21, sa4, sa9, sa6);
		
		nor NOR26 (sa26, sa1, sa4, sa5);

		nor NOR31 (sa31, sa1, sa9, sa5);
		
		nor NOR32 (sa32, sa7, sa14, sa21, sa26, sa31);
		nor NOR33 (s, sa32);
	
endmodule // Numero_05



// ----------------
// -- Testes
// ----------------

module guia08_405790;

	reg [4:0] entrada;
	wire s1, s2, s3 ,s4, s5;
	
	
		// instancia	
	Numero_01 PRIM (s1, entrada[4], entrada[3], entrada[2], entrada[1]);
	Numero_02 SEG (s2, entrada[4], entrada[3], entrada[2], entrada[1]);
	Numero_03 TER (s3, entrada[4], entrada[3], entrada[2], entrada[1], entrada[0]);
	Numero_04 QUA (s4, entrada[4], entrada[3], entrada[2], entrada[1]);
	Numero_05 QUI (s5, entrada[4], entrada[3], entrada[2], entrada[1]);

	initial begin:start
		entrada = 0;
	end
	

		// parte principal
	initial begin:main
	
		$display("Guia 08 - Bruno Calil Nicoliello Moreira - 405790\n");
		$monitor("\na = %b\nb = %b\nc = %b\nd = %b\ne = %b\n\nNumero 01 = %b\nNumero 02 = %b\nNumero 03 = %b\nNumero 04 = %b\nNumero 05 = %b\n", entrada[4], entrada[3], entrada[2], entrada[1], entrada[0], s1, s2, s3, s4 ,s5);


		#1 entrada = 1;
		#1 entrada = 5;
		#1 entrada = 14;
		#1 entrada = 20;
		#1 entrada = 31;
		#1 entrada = 13;
		#1 entrada = 24;
		#1 entrada = 3;
		#1 entrada = 8;
		#1 entrada = 29;
		#1 entrada = 2;
		#1 entrada = 23;
		#1 entrada = 17;
		#1 entrada = 15;
		#1 entrada = 30;
		#1 entrada = 6;
				
	end

endmodule // guia_08
