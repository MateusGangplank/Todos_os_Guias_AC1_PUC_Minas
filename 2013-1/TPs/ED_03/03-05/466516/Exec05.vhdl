// -------------------------
// Exemplo0035 - F4
// Nome: Matheus de Souza Castro Santos
// Matricula: 466516
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output s, input a , input b, input [2:0] key); 
wire temp0, temp1, temp2, temp3,temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, temp12, temp13, temp14;
wire [2:0] keytemp;
//--portas
and AND0(temp0, a, b);
or OR0(temp1, a, b);
xor XOR0(temp2,a, b);
not NOT0(temp3,a);
//--negação das chaves
not NOT1(keytemp[0], key[0]);
not NOT2(keytemp[1], key[1]);
not NOT3(keytemp[2], key[2]);
//--multiplexador and e or
and AND1(temp4, temp0, keytemp[2]);
and AND2(temp5, temp1, key[2]);
or OR1(temp6, temp4, temp5);
//--multiplexador xor e not
and AND3(temp7, temp2, keytemp[2]);
and AND4(temp8, temp3, key[2]);
or OR2(temp9, temp7, temp8);
//--multiplexador conjunto
and AND5(temp10, temp6, keytemp[1]);
and AND6(temp11, temp9, key[1]);
or OR3(temp12, temp10, temp11);
//--multiplexador negado
and AND7(temp13, temp12, keytemp[0]);
and AND8(temp14, (~temp12), key[0]);
or OR4(s, temp13, temp14);

endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg x; 
reg y;
reg [2:0]v; 
wire  z;
f4 Teste (z, x, y, v);
 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0035 - Matheus de Souza Castro Santos - 466516"); 
$display("Test LU's module"); 
x = 1; y = 0; v=3'b000; 
// projetar testes do modulo 
#1 $display("x and y = ",z);
v=3'b001;
#1 $display("x nand y = ",z);
v=3'b010;
#1 $display("x xor y = ",z);
v=3'b011;
#1 $display("x xnor y = ",z);
v=3'b100;
#1 $display("x or y = ",z);
v=3'b101;
#1 $display("x nor y = ",z);
v=3'b110;
#1 $display("x not y = ",z);
end 
endmodule

// SE POSSIVEL, TROCAR A EXTENSAO DO ARQUIVO PARA .v

