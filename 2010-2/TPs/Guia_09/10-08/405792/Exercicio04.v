// --Pontificia Universidade Catolica de Minas Gerais
// -- Guia 09 - 05/10/2010
// -- Nome: Bruno Santiago Pinheiro
// -- Matricula: 405792

module clock ( clock );
 output clock;
 reg    clock;

 initial
  begin
   clock = 1'b0;
  end

 always
  begin
   #2 clock = ~clock;
  end
endmodule

module pulse ( sinal, clock );
 input  clock;
 output sinal;
 reg    sinal;

 always @ ( clock )
  begin
      sinal = 1'b0;
  #20  sinal = 1'b1;
  #20  sinal = 1'b0;
  
  
  end
endmodule // pulse

module teste;

 wire  clock;
 clock clock ( clock );
 reg s;
 wire pt;
 pulse p1 (pt,clock);
 
 initial
 begin
 s = 1'b0;
 end
 
 initial begin
  $dumpfile ( "Exercicio04.vcd" );
  $dumpvars(1, clock, pt);
  		s = 1'b0;
  #50 s = 1'b1; 
  #100 s = 1'b0;
  #150 s = 1'b1;
  #200 $finish;
 end
 endmodule