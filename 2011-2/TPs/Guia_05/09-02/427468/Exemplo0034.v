//---------
//Exemplo0034
//Nome: Úrsula Rosa Monteiro de Castro
//Matricula: 427468
//----------

//----------
// meia diferenca
//----------
module meiaDiferenca(output s, output s1,
							input a, input b);
							
xor(s,a,b);
and(s1,~a,b);

endmodule // meiaDiferenca							
							

//----------
// meia soma
//----------
module meiaSoma(output s, output carry,
					 input a, input b);
					 
xor(s,a,b);
and(carry,a,b);

endmodule // meiaSoma


//---------
// full adder
//----------
module fullAdder(output s, output carry,
					  input carryIn,
					  input a, input b);
					  
wire [5:0] soma;

xor(soma[0],a,b);
xor(s,soma[0],carryIn);
and(soma[1],a,b);
and(soma[2],b,carryIn);
and(soma[3],a,carryIn);
or(soma[4],som[1],soma[2]);
or(carry,soma[3],soma[4]);

endmodule // fullAdder;
//----------------
//	complemento de 2
//--------------
module c2 (output [5:0]s, input[5:0] a); 

wire valor;
wire aux[5:0];
wire carry[5:0];

not(aux[0],a[0]);
not(aux[1],a[1]);
not(aux[2],a[2]);
not(aux[3],a[3]);
not(aux[4],a[4]);
not(aux[5],a[5]);
or (valor, a[0],aux[0]);

meiaSoma ha1(s[0],carry[0],aux[0],valor);
meiaSoma ha2(s[1],carry[1],aux[1],carry[0]);
meiaSoma ha3(s[2],carry[2],aux[2],carry[1]);
meiaSoma ha4(s[3],carry[3],aux[3],carry[2]);
meiaSoma ha5(s[4],carry[4],aux[4],carry[3]);
meiaSoma ha6(s[5],carry[5],aux[5],carry[4]);

endmodule //comp2


//-------------
// unidade logica
//--------------
module alu(output[5:0]s, input[5:0] a, input[5:0]b, input key);
//--adder
wire [5:0] auxsoma;
wire [5:0] soma;
wire [5:0] carryOut;
wire nkey;

meiaSoma ha1(auxsoma[0], carryOut[0], a[0],b[0]);
fullAdder fa1(auxsoma[1], carryOut[1], carryOut[0], a[1],b[1]);
fullAdder fa2(auxsoma[2], carryOut[2], carryOut[1], a[2],b[2]);
fullAdder fa3(auxsoma[3], carryOut[3], carryOut[2], a[3],b[3]);
fullAdder fa4(auxsoma[4], carryOut[4], carryOut[3], a[4],b[4]);
fullAdder fa5(auxsoma[5], carryOut[5], carryOut[4], a[5],b[5]);

not(nkey,key);
and(soma[0],auxsoma[0],nkey);
and(soma[1],auxsoma[1],nkey);
and(soma[2],auxsoma[2],nkey);
and(soma[3],auxsoma[3],nkey);
and(soma[4],auxsoma[4],nkey);
and(soma[5],auxsoma[5],nkey);

//--subtrator
wire [5:0] sub;
wire [5:0] auxsub;
wire [5:0] carryOut2;
wire [5:0] b2;

c2 complemento(b2,b);

meiaSoma  ha2(auxsub[0], carryOut2[0], a[0],b2[0]);
fullAdder fa6(auxsub[1], carryOut2[1], carryOut2[0], a[1],b2[1]);
fullAdder fa7(auxsub[2], carryOut2[2], carryOut2[1], a[2],b2[2]);
fullAdder fa8(auxsub[3], carryOut2[3], carryOut2[2], a[3],b2[3]);
fullAdder fa9(auxsub[4], carryOut2[4], carryOut2[3], a[4],b2[4]);
fullAdder fa10(auxsub[5], carryOut2[5], carryOut2[4], a[5],b2[5]);

and(sub[0],auxsub[0],key);
and(sub[1],auxsub[1],key);
and(sub[2],auxsub[2],key);
and(sub[3],auxsub[3],key);
and(sub[4],auxsub[4],key);
and(sub[5],auxsub[5],key);

or (s[0],soma[0],sub[0]);
or (s[1],soma[1],sub[1]);
or (s[2],soma[2],sub[2]);
or (s[3],soma[3],sub[3]);
or (s[4],soma[4],sub[4]);
or (s[5],soma[5],sub[5]);

endmodule // unidade logica

//----------
//	igual a 0
//-------------
module igual(output s , input[5:0]a);

wire [4:0]aux;

or(aux[0],a[0],a[1]);
or(aux[1],a[2],a[3]);
or(aux[2],a[4],a[5]);
or(aux[3],aux[0],aux[1]);
or(aux[4],aux[2],aux[3]);
not(s,aux[4]);

endmodule // igualdade

//-------
// incremento de 1
//-------

module incremento1(output [5:0]s, input [5:0]a);

wire n;
wire incre;
wire [5:0] carry;

not(n,a[0]);
or(incre,a[0],n);

meiaSoma ha1(s[0],carry[0],a[0],incre);
meiaSoma ha2(s[1],carry[1],a[1],carry[0]);
meiaSoma ha3(s[2],carry[2],a[2],carry[1]);
meiaSoma ha4(s[3],carry[3],a[3],carry[2]);
meiaSoma ha5(s[4],carry[4],a[4],carry[3]);
meiaSoma ha6(s[5],carry[5],a[5],carry[4]);

endmodule // incremento de 1

module decremento1(output[5:0] s, input[5:0] a);
wire n;
wire decre;
wire [5:0] borrow;

not(n,a[0]);
or(decre,a[0],n);

meiaDiferenca hs1(s[0],borrow[0],a[0],decre);
meiaDiferenca hs2(s[1],borrow[1],a[1],borrow[0]);
meiaDiferenca hs3(s[2],borrow[2],a[2],borrow[1]);
meiaDiferenca hs4(s[3],borrow[3],a[3],borrow[2]);
meiaDiferenca hs5(s[4],borrow[4],a[4],borrow[3]);
meiaDiferenca hs6(s[5],borrow[5],a[5],borrow[4]);

endmodule // incremento de 1

//-------------------------------------
module teste;

	reg [5:0] a;
	reg [5:0] b;
	wire [5:0] resultado;
	reg key;
	wire i;
	wire[5:0] incre1;
	wire[5:0] decre1;

alu ul1(resultado,a,b,key);
igual i2(i, resultado);
incremento1 increm(incre1,a);
decremento1 decrem(decre1,b);
//-------- parte principal
initial begin
$display("Exemplo0034 - Ursula Rosa - 427468"); 
$display("Test ALU");

a = 6'b000001;  b = 6'b000011;   key = 1;

 #1 $display("%b + %b = %b      %b",a,b,resultado,i);
 #1 $display("%b  incremento de 1 = %b",a,incre1);
 #1 $display("%b  decremento de 1 = %b",b,decre1);
end


endmodule // soma e subtração