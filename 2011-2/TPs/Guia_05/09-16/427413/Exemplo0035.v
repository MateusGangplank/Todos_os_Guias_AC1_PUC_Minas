
 // ------------------------- 
// Exemplo0035 - Comprador: menor, maior ou Igual
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
                  output sx,
                  input a,  
                  input b,  
                  input b_in);
	
	wire s0,s1,s2;				
						 
	meiadiferenca ha(s0,s1,a,b);
	meiadiferenca ha1(sx,s2,s0,b_in);
	or o1 (s, s2, s1);
	
	endmodule // subtractor

 
 // ------------------------- 
// comparador
// ------------------------- 	
 module comparador (output s,			 
 						input a, 
						input b,
						input b_in);
 
 wire s0,s1;
 
 subtractor ha5(s0,s1,a,b,b_in);
 xor x2 (s, so, s1);
 	
 
 endmodule // comparador				
						
 
 
module test_subtractor;  


// ------------------------- definir dados 
 

reg [5:0] a;
reg [5:0] b;
reg b_in; 
wire s [5:0];
wire s1 [5:0];

comparador i0(s[0], a[0],b[0], b_in);
comparador i1(s[1], a[1],b[1], b_in);
comparador i2(s[2], a[2],b[2], b_in);
comparador i3(s[3], a[3],b[3], b_in);
comparador i4(s[4], a[4],b[4], b_in);
comparador i5(s[5], a[5],b[5], b_in);

// ------------------------- parte principal 
initial begin 
$display("Exemplo0021 - Gustavo Jota Resende - 427413"); 
$display("Test ALU's full adder e decremento de 1"); 
// projetar testes do somador complete

#1 a = 6'b000001;  b = 6'b000001;  b_in = 1'b0;
      
		#1 $display("Resultados 000000=iguais s[0]=1=menor, s[0]=0=maior ");		
		
		#1 $display("%6b - %6b = 6%b b_in: %1b" ,a ,b,  b_in); 

 
end 
endmodule // test_fullAdder 

//Teste
//000001 - 000001 = 60 b_in: <%1b>
//Ocorreu uma erro na execucao no qual nao entendi o problema