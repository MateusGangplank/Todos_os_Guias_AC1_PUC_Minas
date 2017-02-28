//------------------------------
// Guia 01 - Exercicio extra 04
// Marco Antonio Maciel Belo
// Matricula: 410796
//------------------------------

// -----------------------------
// -- Xor ~ 2
// -----------------------------

module xorgate (s, p, q);
	output s;
	input p , q;
				
	assign s = (p^q);

endmodule

// ----------------------------
// -- Test Xorgate
//-----------------------------

module testxorgate;
	reg a,b;
	wire s;
			// instancia
		xorgate XOR1(s, a, b);
	
	initial begin: start
		a = 0; b=0;
	end
	
			// parte principal
	initial begin:main
		$display("Guia 01 - Extra 04 \nMarco Antonio Maciel Belo - 410796");
      $display("Xor gate");
      $display("\n( a ^ b ) = s\n");
      $monitor("( %b ^ %b ) = %b", a, b, s);
		#1 a=0; b=1;
		#1 a=1; b=0;
		#1 a=1; b=1;
	end
endmodule