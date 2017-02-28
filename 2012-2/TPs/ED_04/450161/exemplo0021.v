// -------------------------
// Exemplo0021 – FULL ADDER
// Nome: Guilherme Alves de Oliveira
// Matricula: 450161
// -------------------------
// -------------------------
//  full adder
// -------------------------
module fullAdder (output s,output carryOut, 
                            input   a, 
                            input   b, 
                            input   carryIn);
									 
output axorb;
output and1;
output and2;
// descrever por portas
xor(axorb,a,b);
xor (s,a,b);
and(and1,axor,caryIn);
and(and2,a,b);
or(carryOut,and1,and2);

endmodule // fullAdder
module test_fullAdder;
// ------------------------- definir dados
      reg  x[2:0];
      reg  y[2:0];
      reg  carry;
		wire [2:0] carry1;
      wire [2:0] soma;
		
		fullAdder soma1(soma[0],carry1[0],x[0],y[0],carry);
		fullAdder soma2 (soma[1],carry1[1],x[1],y[1],carry1[0]);
		fullAdder soma3(soma[2],carry1[2],x[2],y[2],carry1[1]);
// ------------------------- parte principal
initial begin
      $display("Exemplo0021 - Guilherme alves de oliveira - 450161");
      $display("Test ALU’s full adder");
		 x[0] = 1; x[1] = 1'b0; x[2] = 1'b0; y[0] =1'b1; y[1] =1'b0; y[2] = 1'b1;carry = 1'b0;
// projetar testes do somador complete
  $monitor(" ",x[0],x[1],x[2] , "\n","+",y[0],y[1],y[2]);
  
 #1 $monitor("=",soma[0],soma[1],soma[2]);
 
  		



end
endmodule // test_fullAdder0,

