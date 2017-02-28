// ------------------------- 
// Exemplo0033 - F4 
// Nome: Mateus Augusto Moraes Ferreira
// Matricula: 435669
// ------------------------- 
 
module ex033 (output [3:0] s1, output [3:0] s2, output [3:0] s3, output [3:0] s4, 
              input  [3:0] x,  input  [3:0] y,  input  [3:0] chave);

  wire [3:0] w1;
  wire [3:0] w2;
  wire [3:0] w3;
  wire [3:0] w4;
  
  nand nand1 [3:0] (w1,x,y);
  not  not1  [3:0] (nchave,chave);
  and  and2  [3:0] (s1,w1,nchave);

  nor  nor1  [3:0] (w2,x,y);
  and  and3  [3:0] (s2,w2,nchave);
  and  and1  [3:0] (w3,x,y);
  and  and4  [3:0] (s3,w3, chave);
  or   or2   [3:0] (w4,x,y);
  and  and5  [3:0] (s4,w4, chave);



endmodule
 
// ------------------------- parte principal 
module teste;

 reg  [3:0] x,y,z;
 wire [3:0] s1,s2,s3,s4;
 
 ex033 modulo1 (s1,s2,s3,s4,x,y,z);
 
 initial begin
  x = 4'b0011;
  y = 4'b0101;
  z = 4'b0000;
 end
 
 initial begin 
      $display("Exemplo0032 - Mateus Augusto Moraes Ferreira - 435669"); 
      $display("Test LU's module"); 
      $monitor("x=%4b y=%4b z=%4b s1=%4b s2=%4b s3=%4b s4=%4b ",
		          x,y,z,s1,s2,s3,s4);
  #1  z = 4'b1111;

   end 
endmodule // test_f4 