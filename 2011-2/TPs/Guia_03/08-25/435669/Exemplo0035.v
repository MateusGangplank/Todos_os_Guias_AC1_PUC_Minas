// ------------------------- 
// Exemplo0035 - F4 
// Nome: Mateus Augusto Moraes Ferreira
// Matricula: 435669
// ------------------------- 
 
module ex035 (output [3:0] s0,output [3:0] s1, output [3:0] s2, output [3:0] s3, output [3:0] s4,
              output [3:0] s5,output [3:0] s6,output [3:0] s7,        
				  input  [3:0] x,  input  [3:0] y);

    
  not  not1  [3:0] (s0,x);
  not  not2  [3:0] (s1,y);
  and  and1  [3:0] (s2,x,y);
  nand nand1 [3:0] (s3,x,y);
  or   or1   [3:0] (s4,x,y);
  nor  nor1  [3:0] (s5,x,y);
  xor  xor1  [3:0] (s6,x,y);
  xnor xnor1 [3:0] (s7,x,y);
  


endmodule
 
// ------------------------- parte principal 
module teste;

 reg  [3:0] x,y;
 wire [3:0] s0,s1,s2,s3,s4,s5,s6,s7;
 
 ex035 modulo1 (s0,s1,s2,s3,s4,s5,s6,s7,x,y);
 
 initial begin
  x = 4'b0011;
  y = 4'b0101;
 end
 
 initial begin 
      $display("Exemplo0034 - Mateus Augusto Moraes Ferreira - 435669"); 
      $display("Test LU's module"); 
      $monitor("x=%4b y=%4b s0=%4b s1=%4b s2=%4b s3=%4b s4=%4b s5=%4b s6=%4b s7=%4b  ",
		          x,y,s0,s1,s2,s3,s4,s5,s6,s7);


   end 
endmodule // ex035