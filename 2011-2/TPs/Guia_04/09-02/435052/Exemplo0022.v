// ------------------------- 
// Exemplo0022 - FULL SUBTRATOR
// Nome: Rafael Lopes Barbosa
// Matricula: 435052
// ------------------------- 
// ------------------------- 
// full adder 
// ------------------------- 
module meiaDiferenca (output s,output s1, 
input a, 
input b); 
// descrever por portas

xor(s,a,b);
and(s1,~a,b);


endmodule // fullAdder 
 
// ------------------------- definir dados 
module fullSubtrator(output s, output s1,
						  input a, input b,
						  input borrowIn);
//descrever por portas

wire ms1[0:1]; 
wire ms2[0:1];

meiaDiferenca hs1(ms1[1],ms1[0],a,b);						  
meiaDiferenca hs2(ms2[1],ms2[0],ms1[1],borrowIn);

assign s = ms2[1];
or (s1,ms1[0],ms2[0]);	

endmodule // fullAdder			

module test_fullAdder;
//-------------------------------- definir dados

reg [5:0] x;
reg [5:0] y;
wire [5:0] diferenca;
wire borrow;
wire borrow2;
wire borrow3;
wire borrow4;
wire borrow5;
wire borrow6;		  


		meiaDiferenca dife0(diferenca[0],borrow,x[0],y[0]);
		fullSubtrator dife1(diferenca[1],borrow2,x[1],y[1],borrow);
		fullSubtrator dife2(diferenca[2],borrow3,x[2],y[2],borrow2);
		fullSubtrator dife3(diferenca[3],borrow4,x[3],y[3],borrow3);
		fullSubtrator dife4(diferenca[4],borrow5,x[4],y[4],borrow4);
		fullSubtrator dife5(diferenca[5],borrow6,x[5],y[5],borrow5);
 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0022 - Rafael Lopes Barbosa - 435052"); 
$display("Test ALU's full subtrator"); 
x = 6'b00011; y = 6'b00101;
#1 $display("%b - %b = %b",x,y,diferenca);

// projetar testes do somador complete 
end 
endmodule // test_fullAdder 