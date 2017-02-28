// -------------------------
// Exemplo0021 – complemento
// Nome: Guilherme alves de oliveira
// Matricula: 450161
// -------------------------
// -------------------------
//  complemento
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

module complemento (output [2:0] s,output[2:0] carry1, 
                            input [2:0]  a 
                             
                            );
									 
output [2:0] nota;
// descrever por portas
not(nota[0],a[0]);
not(nota[1],a[1]);
not(nota[2],a[2]);
fullAdder soma1(s[0],carry1[0],nota[0],0,0);
fullAdder soma2 (s[1],carry1[1],nota[1],0,carry1[0]);
fullAdder soma3(s[2],carry1[2],nota[2],1,carry1[1]);

endmodule // fullAdder
module test_fullAdder;
// ------------------------- definir dados
      reg [2:0]  x;
    
      reg  carry;
		wire [2:0] carry1;
      wire [2:0] resp;
		
		complemento com(resp,carry1,x);
// ------------------------- parte principal
initial begin
      $display("Exemplo0025 - Guilherme alves - 450161");
      $display("Test ALU’s complemento");
		 x[0] = 0; x[1] = 1'b0; x[2] = 1'b1;
// projetar testes do somador complete
  $monitor(" ",x[0],x[1],x[2] , "\n","+");
  
#2 $display("=",resp[0],resp[1],resp[2]);
 
  		



end
endmodule // test_fullAdder0,

