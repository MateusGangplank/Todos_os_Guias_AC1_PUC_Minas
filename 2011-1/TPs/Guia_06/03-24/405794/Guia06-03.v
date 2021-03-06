//----------------------------
// Nome: Caio Ragacci Pimentel
// Matrícula: 405794
//----------------------------


//----------------------------
//------ Guia 06 - 03---------
//----------------------------

// -- Complemento de 1 -

module complemento1 (Saida, A);
input [3:0]A;
output [3:0]Saida;

not NOT1 (Saida[0], A[0]);
not NOT2 (Saida[1], A[1]);
not NOT3 (Saida[2], A[2]);
not NOT4 (Saida[3], A[3]);

endmodule //  fim complemento1

// --- Teste ---

module teste;

reg  [3:0]A;
reg  [3:0]B;
wire [3:0]Complemento;

complemento1 C(Complemento, A);

// parte principal
   initial begin
	   $display("Guia 06- 03");
		$display("Caio Ragacci Pimentel - 405794");
      $display("~~~~ALU~~~~");
      $display(" Complemento A  ");

		A = 0;
		B = 0;
  		while(A != 15)
		  begin
		    A = (B == 0)? A : A + 1;
			 B = 0;
  #1      $display("%b ",Complemento);
			 while(B != 15)
			   begin
				  B = B + 1;
  #1              $display("%b ",Complemento);
		      end
		  end
  end



endmodule // fim teste

// OBS.: ERA PARA CALCULAR CARRY, OVERFLOW E ZERO!
