// ------------------------- 
// Exemplo0034 - F4 
// Nome: Luhan Mairinck Reis 
// Matricula: 446987
// ------------------------- 

// ------------------------- 
// EX4_gate 
// ------------------------- 

module SEL (output s,input f1, input f2,
            input f3, input f4, input [1:0] c); 
wire p1, p2, p3, p4, notC, notC1;

not NOT1 (notC,c[0]);
not NOT2 (notC1,c[1]);
and AND1 (p1,f1,notC,notC1);
and AND2 (p2,f2,c[0],notC1);
and AND3 (p3,f3,c[1],notC);
and AND4 (p4,f4,c[0],c[1]);
or OR1 (s,p1,p2,p3,p4);

endmodule // SEL

module EX4 (output s1,input a, input b,
             input [1:0] chave);
wire w, w1, w2, w3;
				 				
or OR1 (w,a,b);
nor NOR1 (w1,a,b);
xor XOR1 (w2,a,b);
xnor XNOR1 (w3,a,b);
SEL modulo (s1,w,w1,w2,w3,chave);

endmodule // OR1 

module test_EX4; 

// ------------------------- definir dados 

reg x, y;
reg [1:0]z;  
wire p;

EX4 modulo (p, x, y, z); 

// ------------------------- parte principal 

initial begin 
$display("Exemplo0034 - Luhan Mairinck Reis - 446987"); 
$display("Test LU's module"); 

x = 'b0; y = 'b0; z = 2'b00;

// projetar testes do modulo 
#1 $display("\na b chave s"); 
#1 $monitor("%b %b %2b    %b" ,x,y,z,p); 

#1 x = 'b0; y = 'b1; z = 2'b00;
#1 x = 'b1; y = 'b0; z = 2'b00;
#1 x = 'b1; y = 'b1; z = 2'b00;
#1 x = 'b0; y = 'b0; z = 2'b10;
#1 x = 'b0; y = 'b1; z = 2'b10;
#1 x = 'b1; y = 'b0; z = 2'b10;
#1 x = 'b1; y = 'b1; z = 2'b10;
#1 x = 'b0; y = 'b0; z = 2'b01;
#1 x = 'b0; y = 'b1; z = 2'b01;
#1 x = 'b1; y = 'b0; z = 2'b01;
#1 x = 'b1; y = 'b1; z = 2'b01;
#1 x = 'b0; y = 'b0; z = 2'b11;
#1 x = 'b0; y = 'b1; z = 2'b11;
#1 x = 'b1; y = 'b0; z = 2'b11;
#1 x = 'b1; y = 'b1; z = 2'b11;



end 
endmodule // test_f4 