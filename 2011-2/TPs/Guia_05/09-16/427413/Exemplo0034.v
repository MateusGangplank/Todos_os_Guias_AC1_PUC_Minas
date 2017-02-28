
 // ------------------------- 
// Exemplo0034 - Subtrator com Decremento de 1
// Nome: Gustavo Jota Resende
// Matricula: 427413
// ------------------------- 
// ------------------------- 
// meia difrenca
// ------------------------- 

module meiadiferenca (output s, 
						output s1,
                  input a,  
                  input b); 
wire l;


not n1 (l,a);
xor x1 (s, a, b);
and a1 (s1, l, b);
 
endmodule // meiadiferenca 

// ------------------------- 
// subtractor
// ------------------------- 						
module subtractor (output s,
                  input a,  
                  input b,  
                  input b_in);
	
	wire s0,s1,s2,s3;				
						 
	meiadiferenca ha(s0,s1,a,b);
	meiadiferenca ha1(s2,s3,s0,b_in);
	or o1 (s, s3, s1);
	
	endmodule // subtractor

 
 // ------------------------- 
// comparador
// ------------------------- 	
 module decremento (output s,
 						output sx,			 
 						input a, 
						input b,
						input b_in);
 
 reg c,d;
 wire s0,s1,s2,s3,s4;
 
 meiadiferenca ha3(s1,s2,c,d);
 meiadiferenca ha4(s3,s4,s1,b_in);
 subtractor ha5(s0,a,b,b_in);
 meiadiferenca ha6(s,sx,s0,s3);	
 
 endmodule // decremento				
						
 
 
module test_subtractor;  


// ------------------------- definir dados 
 

reg [5:0] a;
reg [5:0] b;
reg b_in; 
wire s [5:0];
wire s1 [5:0];

decremento i0(s[0], s1[0],a[0],b[0], b_in);
decremento i1(s[1], s1[1], a[1],b[1], b_in);
decremento i2(s[2], s1[2], a[2],b[2], b_in);
decremento i3(s[3], s1[3], a[3],b[3], b_in);
decremento i4(s[4], s1[4], a[4],b[4], b_in);
decremento i5(s[5], s1[5], a[5],b[5], b_in);

// ------------------------- parte principal 
initial begin 
$display("Exemplo0021 - Gustavo Jota Resende - 427413"); 
$display("Test ALU's full adder e decremento de 1"); 
// projetar testes do somador complete

#1 a = 6'b000001;  b = 6'b000001;  b_in = 1'b0;
				
		#1 $display("%6b - %6b = 6%b b_in: %1b",a ,b,  b_in); 

 
end 
endmodule // test_fullAdder 

//Teste
//000001 - 000001 = 60 b_in: <%1b>