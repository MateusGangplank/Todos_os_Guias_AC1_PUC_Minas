//-------------------------------------------------------------
// Guia 09 - Exercicio05
// Aluno: Wender Zacarias Xavier
// Matricula: 427472
//-------------------------------------------------------------

     `include "clock.v"

   module jkff ( q, qnot, j, k, clk , clear );
	output q;
	output qnot;
	input j, k;
	input clk;
	input clear;

	reg q, qnot;

	initial begin
	q = 1'b0;
	qnot = 1'b1;

	end
	
	always @ (posedge clk)
	   begin
		if ( clear )
			begin
			q <= 0;	qnot <= 1;
			end
		else if ( j & ~k )
			begin
			q <= 1; qnot <= 0;
			end
		else if ( ~j & k )
			begin
			q <= 0;	qnot <= 1;
			end
		else if ( j & k )
			begin
			q <= ~q;	qnot <= q;
			end
		end
	
	always @(posedge clear)
		begin
		q <= 0;	qnot <= 1;
		end
		

    endmodule // jkff

//-------------------------------------------------------------
// Contador Module 6
//-------------------------------------------------------------

   module modseis ( output[0:2]s, input clk);
		wire [0:2]a;
		wire b,c;
		reg clear , pulso;
		
		initial begin
		clear = 1'b1;
		#1 clear = 1'b0;
	end
	
	jkff JKFF1(s[0], a[0], a[1], a[1], a[1], clear);
	jkff JKFF2(s[1], a[1], a[2], a[2], a[2], clear);
	jkff JKFF3(s[2], a[2], pulso , pulso, pulso, clear);

	and AND1(b, s[0], s[1], a[2]);
	or OR1(c, b, clear);
	 
	always @(posedge clk)
		begin
		pulso = 1'b1;
		end
	always @(posedge clk)
		begin
		pulso = 1'b0;
		end
		

   endmodule // modseis

// ------------------------------------------------------------
// Principal
// ------------------------------------------------------------

     module Contador;
    	
	reg data;
	wire [0:2]s;
	wire clk;
	
	clock CLK1 (clk);
	modseis MOD6 ( s , clk );

	initial begin
	  $display ("Contador Modulo Seis na Subida do Clock");
	  $display ("Aluno:Wender Zacarias Xavier	Matricula:427472");
	  $display ("Saida	Clock");
#250 $finish;
	end

	always @ (posedge clk)
		begin
	  $display ("%b		%d",s,$time);
	end
 endmodule // Principal






















