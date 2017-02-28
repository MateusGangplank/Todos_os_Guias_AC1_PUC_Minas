//---------------------
//-- Guia_11
//-- Nome: José Erimá
//-- Matricula: 405807
//---------------------


`define found    1
`define notfound 0

//Exercício 01 - Mealy: 101
module ex01 ( y, x, clk, reset );
 output y;
 input  x;
 input  clk;
 input  reset;

 reg    y;

 parameter         //identificadores de estado
   start  = 2'b00,
   id1    = 2'b01,
   id10   = 2'b10;

   reg [1:0] E1;	//variável de estado atual
   reg [1:0] E2;	//próxima variável de estado

//próximo estado lógico
   always @( x or E1 )
    begin
     y = `notfound;
     case ( E1 )
      start:
        if ( x )
         E2 = id1;
        else
         E2 = start;
      id1:
        if ( x )
         E2 = start;
        else
         E2 = id10;
      id10:
        if ( x )
	 begin
	   E2 =  id1;
	   y  = `found;
	 end
	else
	 begin
	   E2 =  start;
	   y  = `notfound;
	 end
      default:   //estado indefinido
           E2 =  2'bxx;
     endcase
    end

// state variables
   always @( posedge clk or negedge reset )
    begin
     if ( reset )
      E1 = E2;    //atualizar estado atual
     else
      E1 = 0;     //resetar
    end

endmodule//ex01

//Exercício 02 0101
module  ex02 ( y, x, clk, reset );
 output y;
 input  x;
 input  clk;
 input  reset;

 reg    y;

 parameter
   start  = 3'b000,
   id0    = 3'b001,
   id01   = 3'b011,
   id010  = 3'b010,
   id0101 = 3'b110;

   reg [2:0] E1;
   reg [2:0] E2;

   always @( x or E1 )
    begin
     case( E1 )
      start:
        if ( x )
         E2 = start;
        else
         E2 = id0;
      id0:
        if ( x )
         E2 = id01;
        else
         E2 = start;
      id01:
        if ( x )
         E2 = start;
        else
         E2 = id010;
      id010:
        if ( x )
         E2 = id0101;
        else
         E2 = start;
      id0101:
        if ( x )
         E2 = start;
        else
         E2 = start;
     default:
         E2 = 3'bxxx;
     endcase
    end

   always @( posedge clk or negedge reset )
    begin
     if ( reset )
      E1 = E2;
     else
      E1 = 0;
    end

   always @( E1 )
    begin
     y = E1[2];
    end

endmodule//ex02


//Exercicio 03 - Mealy: 1001
module ex03 ( y, x, clk, reset );
 output y;
 input  x;
 input  clk;
 input  reset;

 reg    y;

 parameter 
   start  = 2'b00,
   id1    = 2'b01,
   id10   = 2'b10,
   id100  = 2'b11;

   reg [1:0] E1, E2;	//E2 variável de estado atual - E1 próximo estado

//próximo estado lógico
always @( x or E1 )
    begin
     y = `notfound;
     case ( E1 )
      start:
        if ( x )
         E2 = id1;
        else
         E2 = start;
      id1:
        if ( x )
         E2 = start;
        else
         E2 = id10;
      id10:
        if ( x )
         E2 = start;
        else
         E2 = id100;
      id100:
        if ( x )  
	 begin
	   E2 =  id1;
	   y  = `found;
	 end
	else
	 begin
	   E2 =  start;
	   y  = `notfound;
	 end
      default:
           E2 =  2'bxx;
     endcase
    end

// state variables
   always @( posedge clk or negedge reset )
    begin
     if ( reset )
      E1 = E2;    //atualizar estado atual
     else
      E1 = 0;     //resetar
    end

endmodule//ex03

//Exercicio 04 - Mealy: 010 ou 101
module ex04 ( y, x, clk, reset );
 output y;
 input  x;
 input  clk;
 input  reset;

 reg    y;

 parameter         //identificadores de estado
   start  = 2'b00,//Acho que não entendi essa parte...
   id1    = 2'b01,//não consegui fazer nem no 4 nem no 5, e não
   id10   = 2'b10,//consegui ver porque o 3 está errado e não sei se o 2
   id0    = 2'b10,//está totalmente correto.
   id01   = 2'b11;

   reg [1:0] E1;	//variável de estado atual
   reg [1:0] E2;	//próxima variável de estado

//próximo estado lógico
   always @( x or E1 )
    begin
     y = `notfound;
     case ( E1 )
      start:
        if ( x )
         E2 = id1;
        else
         E2 = id0;
      id1:
        if ( x )
         E2 = start;
        else
         E2 = id10;
      id10:
        if ( x )
			 begin
			   E2 =  id1;
			   y  = `found;
			 end
			else
			 begin
			   E2 =  start;
			   y  = `notfound;
			 end
      id0:
        if ( x )
         E2 = id01;
        else
         E2 = start;
      id01:
        if ( x )
			 begin
			   E2 =  start;
			   y  = `notfound;
			 end
			else
			 begin
			   E2 =  id0;
			   y  = `found;
			 end
      default:
           E2 =  2'bxx;
     endcase
    end

   always @( posedge clk or negedge reset )
    begin
     if ( reset )
      E1 = E2;    //atualizar estado atual
     else
      E1 = 0;     //resetar
    end
endmodule//ex04

//Exercicio 05 - Mealy: 111 ou 000
module ex05 ( y, x, clk, reset );
 output y;
 input  x;
 input  clk;
 input  reset;

 reg    y;

 parameter         //identificadores de estado
	start  = 2'b00,
   id1    = 2'b01,
   id11   = 2'b11,
	id0    = 2'b00,
	id00   = 2'b00;

   reg [1:0] E1;	//variável de estado atual
   reg [1:0] E2;	//próxima variável de estado

//próximo estado lógico
   always @( x or E1 )
    begin
     y = `notfound;
     case ( E1 )
      start:
        if ( x )
         E2 = id1;
        else
         E2 = id0;
      id1:
        if ( x )
         E2 = id11;
        else
         E2 = start;
      id11:
        if ( x )
			 begin
			   E2 =  id1;
			   y  = `found;
			 end
			else
			 begin
			   E2 =  start;
			   y  = `notfound;
			 end
      id0:
        if ( x )
         E2 = start;
        else
         E2 = id00;
      id00:
        if ( x )
			 begin
			   E2 =  start;
			   y  = `notfound;
			 end
			else
			 begin
			   E2 =  id0;
			   y  = `found;
			 end
      default:
           E2 =  2'bxx;
     endcase
    end

   always @( posedge clk or negedge reset )
    begin
     if ( reset )
      E1 = E2;    //atualizar estado atual
     else
      E1 = 0;     //resetar
    end
endmodule//ex05

//Módulo de testes
module testes;
 reg   clk, reset, x;//Clock, relógio, entrada.
 wire  m1, m2, m3, m4, m5;//Valores de saída.

 ex01 EX1 ( m1, x, clk, reset );
 ex02 EX2 ( m2, x, clk, reset );
 ex03 EX3 ( m3, x, clk, reset );
 ex04 EX4 ( m4, x, clk, reset );
 ex05 EX5 ( m5, x, clk, reset );
 
 initial
  begin
   $display ("Guia 11");
	$display (" Clock    X     ex1   ex2   ex3   ex4");

// initial values
       clk   = 1;
       reset = 0;
       x     = 0;

// input signal changing
  #1  reset = 1;
  #10 x = 0;
  #10 x = 1;
  #10 x = 0;
  #10 x = 0;
  #10 x = 0;
  #10 x = 1;
  #10 x = 1;
  #10 x = 0;
  #10 x = 1;
  #10 x = 1;
  #10 x = 1;
  #10 x = 0;
  #10 x = 1;
  #10 x = 0;
  #10 x = 1;
  #10 x = 1;
  #10 x = 0;
  #10 x = 0;
  #10 x = 1;

  #20 $finish;
 end // initial

 always
  #5 clk = ~clk;

 always @( posedge clk )
  begin
   $display ( "%4d  %5b  %5b %5b %5b %5b %5b", $time, x, m1, m2, m3, m4, m5 );
  end // always at positive edge clocking changing

endmodule // seq1101_test