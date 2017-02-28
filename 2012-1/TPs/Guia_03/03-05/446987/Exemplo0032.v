// ------------------------- 
// Exemplo0032 - F4 
// Nome: Luhan Mairinck Reis 
// Matricula: 446987
// ------------------------- 

// ------------------------- 
// EX2_gate 
// ------------------------- 

module SEL (output s, input f1, input f2,
             input c); 
wire p1, p2, notc;

and AND1 (p1,f2,c);
not NOT1 (notc,c);
and AND2 (p2,notc,f1);
or OR1 (s,p1, p2); 

endmodule // SEL

module EX2 (output s1,input a, input b,
             input chave);
wire w, w1;

and AND1 (w,a,b);				 				
or OR1 (w1,a,b);
SEL modulo (s1,w,w1,chave);

endmodule // OR1 

module test_EX2; 

// ------------------------- definir dados 

reg x, y, z;  
wire p;

EX2 modulo (p, x, y, z); 

// ------------------------- parte principal 

initial begin 
$display("Exemplo0032 - Luhan Mairinck Reis - 446987"); 
$display("Test LU's module"); 

x = 'b0; y = 'b0; z = 'b0;

// projetar testes do modulo 
#1 $display("\na b chave s"); 
#1 $monitor("%b %b %b     %b" ,x,y,z,p); 

#1 x = 'b0; y = 'b0; z = 'b1;
#1 x = 'b0; y = 'b1; z = 'b0;
#1 x = 'b0; y = 'b1; z = 'b1;
#1 x = 'b1; y = 'b0; z = 'b0;
#1 x = 'b1; y = 'b0; z = 'b1;
#1 x = 'b1; y = 'b1; z = 'b0;
#1 x = 'b1; y = 'b1; z = 'b1;


end 
endmodule // test_f4 