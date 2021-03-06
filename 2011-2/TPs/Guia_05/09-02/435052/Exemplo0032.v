//---------
//Exemplo0032 - Soma e Subtra��o
//Nome: Rafael Lopes Barbosa
//Matricula: 435052
//----------

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
or(soma[4],soma[1],soma[2]);
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
module alu(output[5:0]s, input[5:0] a, input[5:0]b, input chave);
//--adder
wire [5:0] aux;
wire [5:0] soma;
wire [5:0] carryOut;
wire chave;

meiaSoma ha1(aux[0], carryOut[0], a[0],b[0]);
fullAdder fa1(aux[1], carryOut[1], carryOut[0], a[1],b[1]);
fullAdder fa2(aux[2], carryOut[2], carryOut[1], a[2],b[2]);
fullAdder fa3(aux[3], carryOut[3], carryOut[2], a[3],b[3]);
fullAdder fa4(aux[4], carryOut[4], carryOut[3], a[4],b[4]);
fullAdder fa5(aux[5], carryOut[5], carryOut[4], a[5],b[5]);


and(soma[0],aux[0],~chave);
and(soma[1],aux[1],~chave);
and(soma[2],aux[2],~chave);
and(soma[3],aux[3],~chave);
and(soma[4],aux[4],~chave);
and(soma[5],aux[5],~chave);

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

and(sub[0],auxsub[0],chave);
and(sub[1],auxsub[1],chave);
and(sub[2],auxsub[2],chave);
and(sub[3],auxsub[3],chave);
and(sub[4],auxsub[4],chave);
and(sub[5],auxsub[5],chave);

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

module teste;
	
	reg [5:0] a;
	reg [5:0] b;
	wire [5:0] resultado;
	reg chave;
	wire i;

alu ul1(resultado,a,b,chave);
igual i2(i, resultado);


//-------- parte principal
initial begin
$display("Exemplo0032 - Rafael Lopes Barbosa - 435052"); 
$display("Test ALU");

a = 6'b000001;  b = 6'b000001;   chave = 1;
 
 #1 $display("%b + %b = %b         %b (0)n�o � igual a zero (1)igual a zero",a,b,resultado,i);
end


endmodule // soma e subtra��o