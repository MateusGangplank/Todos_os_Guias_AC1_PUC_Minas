// ------------------------- 
// Exemplo0023  
// Nome: Pedro Ballona
// Matricula: 427455 
// ------------------------- 
 
// ------------------------- 
//  equals 
// ------------------------- 
module equals (output s,  
                               input[5:0] a,  
                               input[5:0] b); 
 
// descrever por portas 
wire[5:0] x;
wire[2:0] y;
wire z;
xnor(x[0],a[0],b[0]);
xnor(x[1],a[1],b[1]);
xnor(x[2],a[2],b[2]);
xnor(x[3],a[3],b[3]);
xnor(x[4],a[4],b[4]);
xnor(x[5],a[5],b[5]);
and(y[0],x[0],x[1]);
and(y[1],x[2],x[3]);
and(y[2],x[4],x[5]);
and(z,y[1],y[2]);
and(s,z,y[0]);

 
endmodule // equals 
 
module test_equals; 
// ------------------------- definir dados 
      reg [5:0] x; 
      reg [5:0] y; 
      wire s;
		
		equals igual(s,x,y); 
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0023 - Pedro Ballona - 427455"); 
      $display("Test ALU’s equals (1-verdadeiro 0-falso)");
		x=6'b010000; y=6'b010000;
		
		#1 $display("%b == %b (%b)",x,y,s);
 
 // projetar testes do somador complete 
 
 end 
 
endmodule // test_equals 