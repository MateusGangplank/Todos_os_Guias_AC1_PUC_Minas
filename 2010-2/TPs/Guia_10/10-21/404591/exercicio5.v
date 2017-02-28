// ---------------------
// Guia 10_05 - Latch D a partir de um latch SR sem PRESET e CLEAR.
// Nome: Márcia Cibele Martins Carneiro 
// Matricula: 404591
// ---------------------

//Projetar um latch D a partir de um latch SR sem PRESET e CLEAR.
 
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------

module exercicio_01 (q_bar, q, s, r);// latch SR com portas NOR

output q, q_bar;
input s, r;

nor NOR1(q_bar, s, q);
nor NOR2(q, r, q_bar);

endmodule //exercicio_01


module exercicio_05 (q_bar, q, d);// latch D a partir de SR, sem PRESET e CLEAR
	
output q, q_bar;
input d;

wire dL;

not NOT1(dL, d);

exercicio_01 SR(q_bar, q, d, dL); 	// metodo com latch do tipo SR

endmodule //exercicio_05


module latch_D; 

reg s, r, d, pr, cl;
wire q1, q_bar1, q2, q_bar2;
	
	
exercicio_01 L1 (q_bar1, q1, s, r);
exercicio_05 L2 (q_bar2, q2, d);

initial begin:start
s=1; r=0; d=0;
end

initial begin: main
	   $display("Guia 10_05 - Marcia Cibele Martins Carneiro - 404591");
      $display("Latch D a partir de um latch SR sem PRESET e CLEAR");
		$display("D   Q    Q'");
		$monitor("%b   %b    %b",  d, q2,q_bar2);
		
		#1 s=0; r=1; d=1; 
		#1 s=0; r=0; d=0; 
		#1 s=0; r=0; d=1; 
		#1 s=1; r=1; d=0; 

end

endmodule

/*Resultado obtido

     ----jGRASP exec: D:\MeusDocumentos\2010-2_arq1_programas\Icarus_Verilog\bin\vvp exercicio5.vvp
    
    Guia 10_05 - Marcia Cibele Martins Carneiro - 404591
    Latch D a partir de um latch SR sem PRESET e CLEAR
    D   Q    Q'
    0   0    1
    1   1    0
    0   0    1
    1   1    0
    0   0    1
    
     ----jGRASP: operation complete.

*/