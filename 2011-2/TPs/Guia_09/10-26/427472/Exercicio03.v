//-------------------------------------------------------------
// Guia 09 - Exercicio03
// Aluno: Wender Zacarias Xavier
// Matricula: 427472
//-------------------------------------------------------------

     `include "clock.v"

   module tff ( q, qnot, toggle , clk , preset , clear );
	output q;
	output qnot;
	input toggle;
	input preset;
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
		else if ( preset )
			begin
			q <= 1;	qnot <= 0;
			end
		else if ( toggle )
			begin
			q <= ~q;	qnot <= q;
			end
		end

    endmodule // tff

//-------------------------------------------------------------
// Contador Decádico Decrescente
//-------------------------------------------------------------

   module decadecres ( output[0:3]s, input clk);
		wire [0:3]a;
		wire b,c;
		reg preset, clear , pulso , toggle;
		
		initial begin
		toggle = 1'b1;
		clear = 1'b1;
		preset = 1'b0;
		
		#1 clear = 1'b0;
	end
	
	tff TFF1(a[0], s[0], toggle , s[1], preset ,  clear);
	tff TFF2(a[1], s[1], toggle , s[2], preset , clear);
	tff TFF3(a[2], s[2], toggle , s[3], preset , clear);
	tff TFF4(a[3], s[3], toggle , pulso, preset , clear);
	and AND1(b, a[0], s[1], a[2], s[3]);
	or OR1(c, b, clear);
	 
	always @(posedge clk)
		begin
		pulso = 1'b1;
		end
	always @(posedge clk)
		begin
		pulso = 1'b0;
		end
		

   endmodule // decadecres

// ------------------------------------------------------------
// Principal
// ------------------------------------------------------------

     module Contador;
    	
	reg data;
	wire [0:3]s;
	wire clk;
	
	clock CLK1 (clk);
	decadecres CA1 ( s , clk );

	initial begin
	  $display ("Contador Decadico Descrescente na subida do Clock");
	  $display ("Aluno:Wender Zacarias Xavier	Matricula:427472");
	  $display ("Saida	Clock");
#200 $finish;
	end

	always @ (posedge clk)
		begin
	  $display ("%b		%d",s,$time);
	end
 endmodule // Principal






















