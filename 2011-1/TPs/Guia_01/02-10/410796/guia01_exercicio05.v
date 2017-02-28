// ---------------------
// Guia 01 - Extra 05 
// Marco Antonio Maciel Belo
// Matricula: 410796	
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
		$display("Guia 01 - Extra 05\nMarco Antonio Maciel Belo - 410796");
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