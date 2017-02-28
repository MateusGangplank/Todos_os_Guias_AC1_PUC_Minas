// ------------------------- 
// Exemplo0031  
// Patrick Flávio Teixeira Coura
// Matricula: 427450 
// ------------------------- 
 
// ------------------------- 
//  halfAdder 
// ------------------------- 
module halfAdder (output s, output carry, 
                               input a,  
                               input b); 
xor(s,a,b);
and(carry,a,b);

endmodule // halfAdder
 
// ------------------------- 
//  fullAdder 
// ------------------------- 
module fullAdder (output s, output carry, 
										input carryIn,
                               input a,  
                               input b); 
wire [5:0] soma;										 
xor(soma[0],a,b);
xor(s,soma[0],carryIn);

and(soma[1],a,b);
and(soma[2],b,carryIn);
and(soma[3],a, carryIn);
or(soma[4],soma[1],soma[2]);
or(carry,soma[3],soma[4]);

endmodule // fullAdder


// ------------------------- 
//  comp2 
// ------------------------- 
module comp2 (output [5:0]s, input[5:0] a); 

wire val1;
wire aux[5:0];
wire carry[5:0];

not(aux[0],a[0]);
not(aux[1],a[1]);
not(aux[2],a[2]);
not(aux[3],a[3]);
not(aux[4],a[4]);
not(aux[5],a[5]);
or (val1, a[0],aux[0]);

halfAdder hA1 (s[0], carry[0], aux[0], val1);
halfAdder hA2 (s[1], carry[1], aux[1], carry[0]);
halfAdder hA3 (s[2], carry[2], aux[2], carry[1]);
halfAdder hA4 (s[3], carry[3], aux[3], carry[2]);
halfAdder hA5 (s[4], carry[4], aux[4], carry[3]);
halfAdder hA6 (s[5], carry[5], aux[5], carry[4]);

endmodule //comp2

// ------------------------- 
//  alu 
// ------------------------- 
module alu (output [5:0]s, input[5:0] a, input[5:0]b, input key); 
//----soma
wire [5:0] auxsoma;
wire [5:0] soma;
wire [5:0] carryOut;
wire nkey;

halfAdder halfAdder1(auxsoma[0], carryOut[0], a[0],b[0]);
fullAdder fullAdder1(auxsoma[1], carryOut[1], carryOut[0], a[1],b[1]);
fullAdder fullAdder2(auxsoma[2], carryOut[2], carryOut[1], a[2],b[2]);
fullAdder fullAdder3(auxsoma[3], carryOut[3], carryOut[2], a[3],b[3]);
fullAdder fullAdder4(auxsoma[4], carryOut[4], carryOut[3], a[4],b[4]);
fullAdder fullAdder5(auxsoma[5], carryOut[5], carryOut[4], a[5],b[5]);

not (nkey, key);
and(soma[0],auxsoma[0],nkey);
and(soma[1],auxsoma[1],nkey);
and(soma[2],auxsoma[2],nkey);
and(soma[3],auxsoma[3],nkey);
and(soma[4],auxsoma[4],nkey);
and(soma[5],auxsoma[5],nkey);

//----subtracao

wire [5:0] sub;
wire [5:0] auxsub;
wire [5:0] carryOut2;
wire [5:0] b2;
comp2 comp21(b2, b);
halfAdder halfAdder2(auxsub[0], carryOut2[0], a[0],b2[0]);
fullAdder fullAdder6(auxsub[1], carryOut2[1], carryOut2[0], a[1],b2[1]);
fullAdder fullAdder7(auxsub[2], carryOut2[2], carryOut2[1], a[2],b2[2]);
fullAdder fullAdder8(auxsub[3], carryOut2[3], carryOut2[2], a[3],b2[3]);
fullAdder fullAdder9(auxsub[4], carryOut2[4], carryOut2[3], a[4],b2[4]);
fullAdder fullAdder10(auxsub[5], carryOut2[5], carryOut2[4], a[5],b2[5]);

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
endmodule //alu



module test_fullAdder;

//---------------definindo dados
reg [5:0] a;
reg [5:0] b;
wire [5:0] resultado;
reg carry;

alu alu1(resultado,a,b,carry);
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0031 - Patrick Flávio Teixeira Coura - 427450"); 
      $display("Test ALU");
		a=6'b100001;b=6'b100011;carry=1;
		$display("A        B      RESULTADO");
		$monitor("%b  %b = %b",a,b,resultado);
		#1 a=6'b100001;b=6'b100011;carry=0;
		#1 a=6'b101101;b=6'b101011;carry=1;
		#1 a=6'b101101;b=6'b101011;carry=0;
		#1 a=6'b100111;b=6'b110011;carry=1;
		#1 a=6'b100111;b=6'b110011;carry=0;
 
 
 end 
 
endmodule // test_fullAdder