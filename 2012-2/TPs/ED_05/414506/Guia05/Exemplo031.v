//---------------------
//Exemplo031 - ALU
//Nome: Fernando Silva
//Matricula: 414506
//----------------------

module fullAdder (output [2:0]saidaFinal, input [2:0]a, input [2:0]b, input carryIn); 
wire [1:0]s,ss,s1,ss1,s3,ss3,s4,ss4;
wire [2:0]s5,ss5,ss6,ss7;

soma SOMADOR(s,a[0],b[0],carryIn);
soma SOMADOR1(s1,a[1],b[1],s[1]);
soma SOMADOR2(s3,a[2],b[2],s1[1]);




assign s5[2] = s3[0];
assign s5[1] = s1[0];
assign s5[0] = s[0];

subtrator SUBTRADOR(ss,a[0],b[0],carryIn);
subtrator SUBTRADOR1(ss1,a[1],b[1],ss[1]);
subtrator SUBTRADOR2(ss3,a[2],b[2],ss1[1]);


assign ss5[2] = ss3[0];
assign ss5[1] = ss1[0];
assign ss5[0] = ss[0];

and A5[2:0](ss6,s5,~carryIn);
and A6[2:0](ss7,ss5,carryIn);
or  O3[2:0](saidaFinal,ss6,ss7);

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
reg [2:0]x; 
reg  [2:0]y; 
reg carry; 
wire [2:0] soma; 


fullAdder full(soma,x,y,carry);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0021 - Fernando dos Santos Silva - 414506"); 
$display("Test ALU's full adder"); 
$display("x  +  y  = carry_on resultado");
#1 x=4'b001; y=4'b001; carry=1'b0;
$monitor("%3b + %3b = %1b | carry_in = ", x,y,soma,carry);   
#1 x=4'b011; y=4'b101; carry=1'b0;
#1 x=4'b000; y=4'b001; carry=1'b0;
#1 x=4'b001; y=4'b011; carry=1'b1;


// projetar testes do somador complete 
end 
endmodule // test_fullAdder 