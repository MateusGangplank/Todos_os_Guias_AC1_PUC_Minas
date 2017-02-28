// ------------------------- 
// Exemplo0024  
// Nome: Pedro Ballona
// Matricula: 427455 
// ------------------------- 
 
// ------------------------- 
//  diferente 
// ------------------------- 
module diferente (output s,  
                               input[5:0] a,  
                               input[5:0] b); 
 
// descrever por portas 
wire[5:0] x;
wire[2:0] y;
wire z;
xor(x[0],a[0],b[0]);
xor(x[1],a[1],b[1]);
xor(x[2],a[2],b[2]);
xor(x[3],a[3],b[3]);
xor(x[4],a[4],b[4]);
xor(x[5],a[5],b[5]);
or(y[0],x[0],x[1]);
or(y[1],x[2],x[3]);
or(y[2],x[4],x[5]);
or(z,y[1],y[2]);
or(s,z,y[0]);

 
endmodule // diferente 
 
module test_diferente; 
// ------------------------- definir dados 
      reg [5:0] x; 
      reg [5:0] y; 
      wire s;
		
		diferente diferente(s,x,y); 
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0024 - Pedro Ballona - 427455"); 
      $display("Test ALU’s diferente (1-verdadeiro 0-falso)");
		x=6'b010000; y=6'b100000;
		
		#1 $display("%b != %b (%b)",x,y,s);
 
 // projetar testes do somador complete 
 
 end 
 
endmodule // test_diferente 