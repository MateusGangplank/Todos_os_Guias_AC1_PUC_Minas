//---------------------
//Exemplo032 - ALU - detector de zero
//Nome: Fernando Silva
//Matricula: 414506
//----------------------

module fullAdder (output [5:0]saidaFinal, input [3:0]a, input [3:0]b, input carryIn); 
wire [1:0]s,ss,s1,ss1,s3,ss3,s4,ss4;
wire [3:0]s5,ss5,ss6,ss7;
wire s8,s9;

soma SOMADOR(s,a[0],b[0],carryIn);
soma SOMADOR1(s1,a[1],b[1],s[1]);
soma SOMADOR2(s3,a[2],b[2],s1[1]);
soma SOMADOR3(s4,a[3],b[3],s3[1]);


assign s5[3] = s4[0];
assign s5[2] = s3[0];
assign s5[1] = s1[0];
assign s5[0] = s[0];

subtrator SUBTRADOR(ss,a[0],b[0],carryIn);
subtrator SUBTRADOR1(ss1,a[1],b[1],ss[1]);
subtrator SUBTRADOR2(ss3,a[2],b[2],ss1[1]);
subtrator SUBTRADOR3(ss4,a[3],b[3],ss3[1]);

assign ss5[3] = ss4[0];
assign ss5[2] = ss3[0];
assign ss5[1] = ss1[0];
assign ss5[0] = ss[0];

and A5[3:0](ss6,s5,~carryIn);
and A6[3:0](ss7,ss5,carryIn);
or  O3[3:0](saidaFinal[3:0],ss6,ss7);
//---------------Seleciona overflow------------------------
and A7(s8,s4[1],~carryIn);
and A8(s9,ss4[1],carryIn);
or O4(saidaFinal[4],s8,s9);
//-------------------end---------------------

//---------------Verifica se saida e zero--------

   or O5(saidaFinal[5],saidaFinal[3],saidaFinal[2],saidaFinal[1],saidaFinal[0]);
//----------------------end--------------------

//----------------SElECTOR-----------------



//-----------------------------------------
endmodule // fullAdder 

//-------------------------------------------
module soma(output [1:0]saida,input entrada1,input entrada2,input carry_in);
wire a1,a2,a3,a4,a5; 

xor X1(a1,entrada1,entrada2);
and A1(a2,entrada1,entrada2);
xor X2(a3,a1,carry_in);
and A2(a4,a1,carry_in);
or O1(a5,a2,a4);
assign saida[0]=a3;
assign saida[1]=a5;
endmodule

//--------------------------------------------
//--------------------------------------------

module subtrator(output [1:0]saida1,input entradaa1,input entradab2,input carry_In);
wire aa1,aa2,aa3,aa4,aa5;
xor X3(aa1,entradaa1,entradab2);
and A3(aa2,~entradaa1,entradab2);
xor X4(aa3,aa1,carry_In);
and A4(aa4,~aa1,carry_In);
xor O2(aa5,aa2,aa4);
assign saida1[0]=aa3;
assign saida1[1]=aa5;

endmodule

//-----------------------------------------------
module test_fullAdder; 
// ------------------------- definir dados 
reg [3:0]x; 
reg  [3:0]y; 
reg carry; 
wire [5:0] soma; 


fullAdder full(soma,x,y,carry);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0032 - Fernando Silva - 414506"); 
$display("Test ALU's full adder"); 
$display("x  +  y  = carry_on resultado");
#1 x=4'b0000; y=4'b0000; carry=1'b0;
$monitor("%3b + %3b = %1b %3b resultado zero = %1b | carry_in = ", x,y,soma[4],soma[3:0],soma[5],carry);   
#1 x=4'b0011; y=4'b0001; carry=1'b0;
#1 x=4'b0001; y=4'b0001; carry=1'b1;
#1 x=4'b0111; y=4'b0001; carry=1'b1;


// projetar testes do somador complete 
end 
endmodule // test_fullAdder 