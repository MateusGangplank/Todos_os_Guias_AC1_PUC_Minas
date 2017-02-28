// -------------------------
// Exemplo0021 – igualdade
// Nome: guilherme alves de oliveira
// Matricula: 450161
// -------------------------
// -------------------------
//  igualdade
// -------------------------
module igual (output s, 
                            input [2:0]  a, 
                            input [2:0]  b 
                            );
									 
output xnor1;
output xnor2;
output xnor3;

// descrever por portas
not(nota,a);
xnor(xnor1,a[0],b[0]);
xnor(xnor2,a[1],b[1]);
xnor(xnor3,a[2],b[2]);
and(s,xnor1,xnor2,xnor3);


endmodule // igual
module test_igual;
// ------------------------- definir dados
      reg [2:0]  x;
      reg  [2:0] y;
      
      wire  s;
		
		igual ig(s,x,y);
		
// ------------------------- parte principal
initial begin
      $display("Exemplo0021 - xxx yyy zzz - 999999");
      $display("Test ALU’s igual");
		 x[0] = 1; x[1] = 1'b0; x[2] = 1'b0; y[0] =1'b1; y[1] =1'b0; y[2] = 1'b0;
// projetar testes do somador complete
  $monitor(" ",x[0],x[1],x[2] , "\n","=",y[0],y[1],y[2]);
  
 #1 $monitor("=",s);
 
  		



end
endmodule // test_igual,

