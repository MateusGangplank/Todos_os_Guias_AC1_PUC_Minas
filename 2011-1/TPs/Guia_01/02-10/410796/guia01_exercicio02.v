// --------------------------
// Guia 01 - Exercicio 02
// Marco Antonio Maciel Belo
// Matricula: 410796	
// --------------------------

// ---------------------
// -- nor gate ~ 3
// ---------------------

module norgate(s, p, q, r);
	output s;
	input p, q, r;
	
	assign s = ~(p | q | r);
	
endmodule

// ---------------------
// test norgate
// ---------------------

module testnorgate;
	reg a,b,c;
	wire s;
				// instancia
	norgate NOR1 (s, a,b,c);
			   // parte principal
	initial begin
		$display("Guia 01 - Exercicio 02\nMarco Antonio Maciel Belo - 410796");
      $display("Norgate");
      $display("\n~(a | b | c) = s\n");
		a=0; b=0; c=0;
		#1  $display("~(%b | %b | %b) = %b", a, b, c, s);
		a=0; b=0; c=1;
		#1  $display("~(%b | %b | %b) = %b", a, b, c, s);
		a=0; b=1; c=0;
		#1  $display("~(%b | %b | %b) = %b", a, b, c, s);
		a=0; b=1; c=1;
		#1  $display("~(%b | %b | %b) = %b", a, b, c, s);
		a=1; b=0; c=0;
		#1  $display("~(%b | %b | %b) = %b", a, b, c, s);
		a=1; b=0; c=1;
		#1  $display("~(%b | %b | %b) = %b", a, b, c, s);
		a=1; b=1; c=0;
		#1  $display("~(%b | %b | %b) = %b", a, b, c, s);
		a=1; b=1; c=1;
		#1  $display("~(%b | %b | %b) = %b", a, b, c, s);		
		end
endmodule