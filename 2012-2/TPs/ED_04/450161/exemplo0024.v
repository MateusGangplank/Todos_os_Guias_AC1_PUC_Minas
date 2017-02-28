// -------------------------
// Exemplo0021 – diferençia
// Nome: guilherme alves
// Matricula: 450161
// -------------------------
// -------------------------
//  diferencia
// -------------------------
module dif (output s, 
                            input [2:0]  a, 
                            input [2:0]  b 
                            );
									 
output xor1;
output xor2;
output xor3;

// descrever por portas
not(nota,a);
xor(xor1,a[0],b[0]);
xor(xor2,a[1],b[1]);
xor(xor3,a[2],b[2]);
or(s,xor1,xor2,xor3);


endmodule // fullAdder
module test_fullAdder;
// ------------------------- definir dados
      reg [2:0]  x;
      reg  [2:0] y;
      
      wire  s;
		
		dif di(s,x,y);
		
// ------------------------- parte principal
initial begin
      $display("Exemplo0024 - guilherme alves - 450161");
      $display("Test ALU’s diferencia de bits");
		 x[0] = 1; x[1] = 1'b0; x[2] = 1'b0; y[0] =1'b1; y[1] =1'b0; y[2] = 1'b0;
// projetar testes do somador complete
  $monitor(" ",x[0],x[1],x[2] , "\n","<>",y[0],y[1],y[2]);
  
 #1 $monitor("=",s);
 
  		



end
endmodule // test_fullAdder0,

