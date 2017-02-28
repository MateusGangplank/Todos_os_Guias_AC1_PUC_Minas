// Exemplo0025 - addition of 2
// Nome: Fernando Silva 
// Matricula: 414506
//-----------------------

//addition of 2

module fullAdder (output [16:0]s, input [3:0]a, input [3:0]b, input carryIn); 


xor X1(s[0],a[0],b[0]);
xor X2(s[1],a[1],b[1]);
xor X3(s[2],a[2],b[2]);
xor X4(s[3],a[3],b[3]);

and A1(s[7],a[0],b[0]);
and A2(s[6],a[1],b[1]);
and A3(s[5],a[2],b[2]);
and A4(s[4],a[3],b[3]);

xor X4(s[11],s[0],carryIn);
xor X5(s[10],s[1],carryIn);
xor X6(s[9],s[2],carryIn);
xor X7(s[8],s[3],carryIn);

and A5(s[15],s[0],carryIn);
and A6(s[14],s[1],carryIn);
and A7(s[13],s[2],carryIn);
and A8(s[12],s[3],carryIn);

or  O1(s[16],s[7],s[6],s[5],s[4],s[15],s[14],s[13],s[12]);


endmodule // fullAdder 


module circuit_additionOf2(output [3:0]s,input [3:0]a );

reg carry=1'b0; 
wire [16:0] soma; 


fullAdder full(soma,~a,1'b1,carry);//negacao da entrada e soma 1 >> complemento de 2
 
assign s[0] = soma[11];
assign s[1] = soma[10];
assign s[2] = soma[9];
assign s[3] = soma[8]; 

endmodule // endAdditionOf2
//------------------------------
//test additionOf2
//------------------------------

module  test_circuit_additionOf2;

reg [3:0]x;
wire [3:0]z;

 circuit_additionOf2 addtion(z,x);
 
 initial begin:main
 
 $display("Exemplo0025 - Fernando Silva - 414506"); 
 $display("Test ALU's addition of 2"); 
 
 x = 4'b0101;
 $monitor("%3b + 1 =  %3b",x,z);
  #1 x = 4'b1111; 
  #1 x = 4'b1010; 
  #1 x = 4'b0110; 
 
 
 end //endbegin

endmodule //end test_circuit_addition of 