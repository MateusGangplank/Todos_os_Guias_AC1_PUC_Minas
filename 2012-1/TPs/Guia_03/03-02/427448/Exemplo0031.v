// ------------------------- 
// Exemplo0031 - F4 
// Nome: Michelle da Costa Silva 
// Matricula: 427448
// -------------------------
 
// ------------------------- 
// f4_gate 
// ------------------------- 

   module f4 (output [7:0]saida, input [3:0]entrada1, input [3:0]entrada2);
	 
	  and AND1(saida[0], entrada1[0], entrada2[0]);
     and AND2(saida[1], entrada1[1], entrada2[1]);
     and AND3(saida[2], entrada1[2], entrada2[2]);
     and AND4(saida[3], entrada1[3], entrada2[3]);

	  or OR1(saida[7], entrada1[3], entrada2[3]);
     or OR2(saida[6], entrada1[2], entrada2[2]);
     or OR3(saida[5], entrada1[1], entrada2[1]);
     or OR4(saida[4], entrada1[0], entrada2[0]); 

    endmodule //f4

// ------------------------- 
// -- test f4
// -------------------------
    
	  module test_f4; 

// ------------------------- definir dados 
    
	  reg  [3:0] x;
	  reg  [3:0] y;
	  wire [7:0] z;
	 
// ------------------------- instancia 
	 
     f4 modulo (z, x, y);
	  
// ------------------------- parte principal 
    
	 initial begin

      $display("Exemplo0031 - Michelle da Costa Silva");
      $display("Test LU's module \n");
		 #1 x = 4'b0011;	y = 4'b0101;
		$monitor("AND: %4b & %4b = %4b \nOR: %3b | %3b = %4b \n",x,y,z[3:0],x,y,z[7:4]);
		 #1 x = 4'b0000;	y = 4'b1111;
   	 #1 x = 4'b1010;	y = 4'b0101;

     end
endmodule // test_f4