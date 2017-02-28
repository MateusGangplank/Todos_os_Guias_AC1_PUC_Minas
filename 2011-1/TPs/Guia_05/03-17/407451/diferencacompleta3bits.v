// ----------------------
// Guia 05
// Nome: Karen Alves Pereira
// Matricula: 407451
// -----------------------


 module diferencacompleta3bits(s, x, y);
 output [2:0] s;
 input  [2:0] x, y;
 wire c1, c2;
 
 meiadiferenca FU1(s[0],c1,x[0],y[0]); 
 diferencacompleta FU2(s[1],c2,x[1],y[1],c1);
 diferencacompleta FU3(s[2],c3,x[2],y[2],c2);
 
 endmodule
 
 
 module meiadiferenca(s0, s1, x, y);    
 output s0, s1;                         
 input x, y;                            
 
 xor XOR1(s0, x, y);                   
 and AND1(s1, ~x, y);
   
 endmodule   
 
 module diferencacompleta(s0, s1, x, y, e1);   
 output s0, s1;                                
 input x, y, e1;                                
 
 meiadiferenca FU1(s2, s3, x, y);        
 meiadiferenca FU2(s0, s4, s2, e1);      
 or OR1(s1, s3,s4);                     
 
 endmodule  
 
 // -- TESTE
  
 module test3bits;
 reg [2:0]  x,y;
 wire [2:0] s;
 integer a,b;
          
 diferencacompleta3bits DIF1 (s,x,y);
 
 initial begin    //definindo valores iniciais
      x=0; y=0;
 end
 
 initial begin  //inicio
      $display("Guia 05 - Karen Alves Pereira - 407451");
      $display("Diferenca completa de dois valores com 3 bits");
		$display("\n   A   -   B  =   S  \n");
		$monitor("  %b%b%b - %b%b%b = %b%b%b", x[2],x[1],x[0],y[2],y[1],y[0],s[2],s[1],s[0]); 
 
   for(a=0; a <= 7; a = a+1) 
  	begin
	
   for(b=0; b <= 7; b = b+1) 
  	begin
	#1 x = a; y = b;
	
 end	
 end 
 end    
 endmodule  