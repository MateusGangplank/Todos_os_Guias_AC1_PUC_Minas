// ----------------------
// Guia 05
// Nome: Karen Alves Pereira
// Matricula: 407451
// -----------------------

//-- Soma completa 4 bits
 module somacompleta4bits (s,x,y);
 output [4:0] s;
 input [3:0] x, y;
 
 wire c1, c2, c3;


 meiasoma HA1 (s[0],c1,x[0],y[0]);
 somacompleta FA1 (s[1],c2,x[1],y[1],c1);
 somacompleta FA2 (s[2],c3,x[2],y[2],c2);
 somacompleta FA3 (s[3],s[4],x[3],y[3],c3);

 endmodule 

//-- Meia Soma
 module meiasoma(s0, s1,x, y);    
 output s0, s1;                  
 input x, y;                     

 xor XOR1(s0, x, y);
 and AND1(s1, x, y);
 
 endmodule

// -- Soma Completa 
 module somacompleta(s0, s1, x, y, v1);
 output s0, s1;
 input x, y, v1;
 wire s4, s5, s2;
 
 meiasoma HA1(s2, s4, x, y);
 meiasoma HA2(s0, s5, s2, v1);
 or OR1(s1,s5,s4);
 
 endmodule

// -- TESTE
  
 module test4bits;
 reg [3:0]  x, y;
 wire [4:0] s;
 integer a,b;
          
 somacompleta4bits  SOM1 (s,x,y);
 
 initial begin    //definindo valores iniciais
      x=0; y=0;
 end
 
 initial begin  //inicio
      $display("Guia 05 - Karen Alves Pereira - 407451");
      $display("Soma completa de dois valores com 4 bits");
		$display("\n   A   +   B  =   S  \n");
		$monitor("  %b%b%b%b + %b%b%b%b = %b%b%b%b%b", x[3],x[2],x[1],x[0],y[3],y[2],y[1],y[0],s[4],s[3],s[2],s[1],s[0]); 
 
   for(a=0; a <= 15; a = a+1) 
  	begin
	
   for(b=0; b <= 15; b = b+1) 
  	begin
	#1 x = a; y = b;
	
 end	
 end 
 end    
 endmodule 