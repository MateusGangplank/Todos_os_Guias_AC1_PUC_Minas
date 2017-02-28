// ------------------------- 
// Exemplo0031 - F4 
// Nome: Luhan Mairinck Reis 
// Matricula: 446987
// ------------------------- 

// ------------------------- 
// f4_gate 
// ------------------------- 

module f4a (output s, input a, input b,
             input c, input d); 

and AND1 (s,a,b,c,d);

endmodule // AND1

module f4b (output s1,input a, input b,
             input c, input d);
				 				
or OR1 (s1,a,b,c,d);

endmodule // OR1 

module test_f4; 

// ------------------------- definir dados 

reg x, y, w, z;  
wire p;
wire q;

f4a modulo (p, x, y, w ,z); 
f4b modulo2 (q, x, y, w, z);

// ------------------------- parte principal 

initial begin 
$display("Exemplo0031 - Luhan Mairinck Reis - 446987"); 
$display("Test LU's module"); 

x = 'b0; y = 'b0; w = 'b0; z = 'b0;

// projetar testes do modulo 
#1 $display("\na b c d s s1"); 
#1 $monitor("%b %b %b %b %b %b" ,x,y,w,z,p,q); 

#1 x = 'b0; y = 'b0; w = 'b0; z = 'b1;
#1 x = 'b0; y = 'b0; w = 'b1; z = 'b0;
#1 x = 'b0; y = 'b0; w = 'b1; z = 'b1;
#1 x = 'b0; y = 'b1; w = 'b0; z = 'b0;
#1 x = 'b0; y = 'b1; w = 'b0; z = 'b1;
#1 x = 'b0; y = 'b1; w = 'b1; z = 'b0;
#1 x = 'b0; y = 'b1; w = 'b1; z = 'b1;
#1 x = 'b1; y = 'b0; w = 'b0; z = 'b0;
#1 x = 'b1; y = 'b0; w = 'b0; z = 'b1;
#1 x = 'b1; y = 'b0; w = 'b1; z = 'b0;
#1 x = 'b1; y = 'b0; w = 'b1; z = 'b1;
#1 x = 'b1; y = 'b1; w = 'b0; z = 'b0;
#1 x = 'b1; y = 'b1; w = 'b0; z = 'b1;
#1 x = 'b1; y = 'b1; w = 'b1; z = 'b0;
#1 x = 'b1; y = 'b1; w = 'b1; z = 'b1;



end 
endmodule // test_f4 