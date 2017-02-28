// -------------------------
// Exemplo0033 - F4
// Nome: Matheus de Souza Castro Santos
// Matricula: 466516
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output s,output t, input a, input b, input key ); 
wire temp0, temp1, temp2, temp3, keytemp,temp5, temp6 ;
or OR1(temp0, a, b);
and AND1(temp1, a, b);
not NOT1(keytemp, key);
and AND2(temp3, temp1, keytemp);
and AND3(temp4, temp0, keytemp);


and AND4(temp5, (~temp1), key);
and AND5(temp6, (~temp0), key);

or OR6(s, temp3, temp5);
or OR7(t, temp4, temp6);



endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg x; 
reg y;
reg v; 
wire  z, w;
f4 Teste (z, w, x, y, v);
 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0033 - Matheus de Souza Castro Santos - 466516"); 
$display("Test LU's module"); 
x = 1; y = 0; v=0; 
// projetar testes do modulo 
#1 $display("x or y = ",w);
#1 $display("x and y = ",z);
v=1;
#1 $display("x nor y = ",w);
#1 $display("x nand y = ",z);
end 
endmodule