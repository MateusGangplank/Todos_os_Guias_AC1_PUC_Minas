// ---------------------
// Guia 01_05 - Extra 05 
// Nome: Heitor Terozendi
// Matricula: 396698	
// ---------------------

// ---------------------
// -- XOR ~ 2
// ---------------------

module xorgate(s, p, q);
	output s;
	input p, q;
	
	assign s = ( (~p&q | p&~q) );
	
endmodule

// ---------------------
// Test xorgate
// ---------------------

module testxorgate;
	reg a,b;
	wire s;
				// instancia
	xorgate XOR1 (s, a,b);
			   // parte principal
	initial begin
		$display("Guia 01_05 - Heitor Terozendi - 3966988");
      $display("Xor gate");
      $display("\n(~a&b | a&~b) = s\n");
		a=0; b=0;
		#1  $display("~( %b  ^   %b)  = %b", a, b, s);
		a=0; b=1;
		#1  $display("~( %b  ^   %b)  = %b", a, b, s);
		a=1; b=0;
		#1  $display("~( %b  ^   %b)  = %b", a, b, s);
		a=1; b=1;
		#1  $display("~( %b  ^   %b)  = %b", a, b, s);	
	end
endmodule