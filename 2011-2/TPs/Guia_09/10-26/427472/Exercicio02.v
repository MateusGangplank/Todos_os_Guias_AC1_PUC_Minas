//-------------------------------------------------------------
// Guia 09 - Exercicio02
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
// Contador Assincrono Crescente
//-------------------------------------------------------------

   module assincres ( output[0:3]s, input clk);
		wire [0:3]a;
		reg preset, clear , pulso , toggle;
		
		initial begin
		toggle = 1'b1;
		clear = 1'b1;
		preset = 1'b0;
		
		#1 clear = 1'b0;
	end
	
	tff TFF1(s[0], a[0], toggle , a[1], preset ,  clear);
	tff TFF2(s[1], a[1], toggle , a[2], preset , clear);
	tff TFF3(s[2], a[2], toggle , a[3], preset , clear);
	tff TFF4(s[3], a[3], toggle , pulso, preset , clear);
	
	always @(posedge clk)
		begin
		pulso = 1'b1;
		end
	always @(posedge clk)
		begin
		pulso = 1'b0;
		end
		

   endmodule // assindecres

// ------------------------------------------------------------
// Principal
// ------------------------------------------------------------

     module Contador;
    	
	reg data;
	wire [0:3]s;
	wire clk;
	
	clock CLK1 (clk);
	assincres CA1 ( s , clk );

	initial begin
	  $display ("Contador Assincrono Decrescente com Flip-Flops Toggle na subida do Clock");
	  $display ("Aluno:Wender Zacarias Xavier	Matricula:427472");
	  $display ("Saida	Clock");
#200 $finish;
	end

	always @ (posedge clk)
		begin
	  $display ("%b		%d",s,$time);
	end
 endmodule // Principal






















