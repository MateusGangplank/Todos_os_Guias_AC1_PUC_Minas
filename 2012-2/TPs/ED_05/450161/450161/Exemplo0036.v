// -------------------------
// Exemplo0033 – FULL ADDER/SUB 
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

module Exemplo0033(input [2:0]a,input[2:0]b,output[2:0]resp,input cin,output  [2:0]cout);
wire [2:0] s;

xor(s[0],b[0],cin);
xor(s[1],b[1],cin);
xor(s[2],b[2],cin);

      
		fullAdder soma1(resp[0],cout[0],a[0],s[0],cin);
		fullAdder soma2 (resp[1],cout[1],a[1],s[1],cout[0]);
		fullAdder soma3(resp[2],cout[2],a[2],s[2],cout[1]);




endmodule//exemplo0033

module is0(input[2:0]u,output s);
wire [2:0]temp;
not(temp[0],u[0]);
not(temp[1],u[1]);
not(temp[2],u[2]);

and(s,temp);


endmodule//is0

module over(output s,input a);

 assign s = a;

endmodule//over

module test_Exemplo033;
// ------------------------- definir dados
      reg  [2:0] x;
      reg  [2:0] y;
      reg  carry;
		wire ov;
		wire [2:0] carry1;
      wire [2:0] re;
		wire e0;
		Exemplo0033 e1(x,y,re,carry,carry1);
		over o (ov, carry1[2]);
		is0 flag0(re,e0);
// ------------------------- parte principal
initial begin
      $display("Exemplo0021 - Guilherme alves de oliveira - 450161");
      $display("Test");
		 x[0] = 0; x[1] = 1'b0; x[2] = 1'b0; y[0] =1'b0; y[1] =1'b0; y[2] = 1'b1;carry = 1'b1;
// projetar testes do somador complete
  $monitor(" ",x[0],x[1],x[2] , "\n",y[0],y[1],y[2]);
  
 #1 $monitor("=",re[0],re[1],re[2]);
 
 #2  $display("FLAG 0 = ",e0);	

#3 $display("OVERFLOW ",ov);

end
endmodule // test,

