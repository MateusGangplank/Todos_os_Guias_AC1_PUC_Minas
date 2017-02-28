// -------------------------
// Exemplo0032 - F4
// Nome: Matheus de Souza Castro Santos
// Matricula: 466516
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output s,input a, input b, input key); 
wire temp0, temp1, temp2, temp3, keytemp;
or OR1(temp0, a, b);
and AND1(temp1, a, b);
not NOT1(keytemp, key);
and AND2(temp3, temp1, key);
and AND3(temp4, temp0, keytemp);
or OR2(s, temp3, temp4);


endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg x; 
reg y;
reg w; 
wire  z;
f4 Teste (z, x, y, w);
 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0032 - Matheus de Souza Castro Santos - 466516"); 
$display("Test LU's module"); 
x = 1; y = 0; w=0; 
// projetar testes do modulo 
#1 $display("x or y = ",z);
w=1;
#1 $display("x and y = ",z);
end 
endmodule