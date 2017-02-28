
 // ------------------------- 
// Exemplo0033 - Somador com Incremento de 1
// Nome: Gustavo Jota Resende
// Matricula: 427413
// ------------------------- 
// ------------------------- 
// half adder 
// ------------------------- 

module halfAdder (output s, 
						output s1,
                  input a,  
                  input b); 

xor x1 (s, a, b);
and a1 (s1, a, b);
 
endmodule // halfAdder 

// ------------------------- 
// full adder 
// ------------------------- 						
module fullAdder (output s,
                  input a,  
                  input b,  
                  input carryIn);
	
	wire s0,s1,s2,s3;				
						 
	halfAdder ha(s0,s1,a,b);
	halfAdder ha1(s2,s3,s0,carryIn);
	or o1 (s, s3, s1);
	
	endmodule // fullAdder

 
 // ------------------------- 
// incremento
// ------------------------- 	
 module incremento (output s,
 						output sx,			 
 						input a, 
						input b,
						input carryIn);
 
 reg c,d;
 wire s0,s1,s2,s3,s4;
 
 halfAdder ha3(s1,s2,c,d);
 halfAdder ha4(s3,s4,s1,carryIn);
 fullAdder ha5(s0,a,b,carryIn);
 halfAdder ha6(s,sx,s0,s3);	
 
 endmodule // incremento				
						
 
 
module test_fullAdder;  


// ------------------------- definir dados 
 

reg [5:0] a;
reg [5:0] b;
reg carryIn; 
wire s [5:0];
wire s1 [5:0];

incremento i0(s[0], s1[0],a[0],b[0], carryIn);
incremento i1(s[1], s1[1], a[1],b[1], carryIn);
incremento i2(s[2], s1[2], a[2],b[2], carryIn);
incremento i3(s[3], s1[3], a[3],b[3], carryIn);
incremento i4(s[4], s1[4], a[4],b[4], carryIn);
incremento i5(s[5], s1[5], a[5],b[5], carryIn);

// ------------------------- parte principal 
initial begin 
$display("Exemplo0021 - Gustavo Jota Resende - 427413"); 
$display("Test ALU's full adder e subtrator igualdade"); 
// projetar testes do somador complete

#1 a = 6'b000001;  b = 6'b000001;  carryIn = 1'b0;
				
		#1 $display("%6b + %6b = %b CarryIn: %1b",a ,b, s,  s1, carryIn); 

 
end 
endmodule // test_fullAdder 

//Teste
//Ocorreu uma erro na execucao no qual nao entendi o problema