// -------------------------
// Exemplo0034 - F4
// Nome: Miguel Sousa
// Matricula: 463985
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output s, input a , input b, input [1:0] key); 
wire temp0, temp1, temp2, temp3,temp4, temp5, temp6, temp7, temp8;
wire [1:0] keytemp;
//-----Entradas-------
or OR1(temp0, a, b);
xor XOR1(temp1,a, b);
//--multiplexador
not NOT1(keytemp[0], key[1]);
not NOT2(keytemp[1], key[0]);
and AND1(temp3, temp0, keytemp[0]);
and AND2(temp4, temp1, key[0]);
or OR2(temp5, temp3, temp4);
//-----negação----
not NOT3( temp6,temp5);
//--------------------------------
and AND1(temp7, temp5, keytemp[1]);
and AND2(temp8, temp6, key[1]);
or OR3(s, temp7, temp8);

endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg x; 
reg y;
reg [1:0]v; 
wire  z;
f4 Teste (z, x, y, v);
 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0034 - Miguel Sousa  - 463985"); 
$display("Test LU's module");  
x = 1; y = 0; v=2'b00; 
// projetar testes do modulo 
#1 $display("x or y = ",z);
v=2'b01;
#1 $display("x nor y = ",z);
v=2'b10;
#1 $display("x xor y = ",z);
v=2'b11;
#1 $display("x xnor y = ",z);
end 
endmodule