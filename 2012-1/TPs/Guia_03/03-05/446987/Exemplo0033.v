// ------------------------- 
// Exemplo0033 - F4 
// Nome: Luhan Mairinck Reis 
// Matricula: 446987
// ------------------------- 

// ------------------------- 
// EX3_gate 
// ------------------------- 

module SEL (output s2, output s3,input f1, input f2,
            input f3, input f4, input c); 
wire p1, p2, p3, p4, notC;

not NOT1 (notc,c);
and AND1 (p1,f1,notC);
and AND2 (p2,notC,f2);
or OR1 (s,p1,p2);
and AND3 (p3,f3,c);
and AND4 (p4,f4,c);
or OR2 (s1,p3,p4); 

endmodule // SEL

module EX3 (output s, output s1, input a,
            input b, input chave);
wire w, w1, w2, w3;

and AND1 (w,a,b);				 				
or OR1 (w1,a,b);
nand NAND1 (w2,a,b);
NOR NOR1 (w3,a,b);

SEL modulo (s,s1,w,w1,w2,w3,chave);

endmodule // OR1 

module test_EX3; 

// ------------------------- definir dados 

reg x, y, z;  
wire p, q;

EX3 modulo (p, q, x, y, z); 

// ------------------------- parte principal 

initial begin 
$display("Exemplo0033 - Luhan Mairinck Reis - 446987"); 
$display("Test LU's module"); 

x = 'b0; y = 'b0; z = 'b0;

// projetar testes do modulo 
#1 $display("\na b chave s s1"); 
#1 $monitor("%b %b %b     %b %b" ,x,y,z,p,q); 

#1 x = 'b0; y = 'b0; z = 'b1;
#1 x = 'b0; y = 'b1; z = 'b0;
#1 x = 'b0; y = 'b1; z = 'b1;
#1 x = 'b1; y = 'b0; z = 'b0;
#1 x = 'b1; y = 'b0; z = 'b1;
#1 x = 'b1; y = 'b1; z = 'b0;
#1 x = 'b1; y = 'b1; z = 'b1;


end 
endmodule // test_EX3 