// ------------------------- 
// Exemplo0031 - F4 
// Nome: Filipe Viana de Miranda 
// Matricula: 446415
// ------------------------- 
// ------------------------- 
// f4_gate 
// -------------------------
module f0 (output s1,
input a,
input b,
input c,
input d);
and AND1 (s1,a,b,c,d);
endmodule//f0
module f1 (output s2,
input a,
input b,
input c,
input d);
or OR1 (s2,a,b,c,d);
endmodule//f1
module testf;
// ------------------------- definir dados 
reg  x,y,d,e;  
wire z;
wire w; 
f0 modulo ( z, x, y,d,e); 
f1 modulo1 ( w, x, y,d,e);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0031 - Filipe Viana de Miranda - 446415"); 
$display("Test LU's module"); 
x = 'b0; y = 'b0;d ='b0;e ='b0;  
// projetar testes do modulo
#1 $display("\na b c d s1 s2");
#1 $monitor("%b %b %b %b %b %b",x,y,d,e,z,w);
#1 x = 'b0; y = 'b0;d ='b0;e ='b1;
#1 x = 'b0; y = 'b0;d ='b1;e ='b0;
#1 x = 'b0; y = 'b0;d ='b1;e ='b1;
#1 x = 'b0; y = 'b1;d ='b0;e ='b0;
#1 x = 'b0; y = 'b1;d ='b0;e ='b1;
#1 x = 'b0; y = 'b1;d ='b1;e ='b0;
#1 x = 'b0; y = 'b1;d ='b1;e ='b1;
#1 x = 'b1; y = 'b0;d ='b0;e ='b1;
#1 x = 'b1; y = 'b0;d ='b1;e ='b0;
#1 x = 'b1; y = 'b0;d ='b1;e ='b1;
#1 x = 'b1; y = 'b1;d ='b0;e ='b0;
#1 x = 'b1; y = 'b1;d ='b0;e ='b1;
#1 x = 'b1; y = 'b1;d ='b1;e ='b0;
#1 x = 'b1; y = 'b1;d ='b1;e ='b1;


end 
endmodule // test_f4 