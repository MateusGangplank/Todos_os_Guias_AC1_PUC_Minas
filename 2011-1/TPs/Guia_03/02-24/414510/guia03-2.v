//-----------
// Guia03-2 - Meia Soma NAND
// Nome : Marley Ribeiro
// Matricula : 414510
//-----------------


//---------------
// -- Meia soma
//---------------

module meiasoma ( s0 , s1 , a , b );


output s0 , s1;
input a,b;
wire temp2,temp3,temp4,temp5;

nand nandgate1 ( temp2 , a , b);
nand nandgate2 ( s1, temp2 , temp2);
nand nandgate3 ( temp3 ,a, b);
nand nandgate4 (temp4 ,a , temp3);
nand nandgate5 (temp5, temp3 , b);
nand nandgate6 ( s0, temp4 , temp5);

endmodule// fim meia soma

//-----------------------------
//---- teste nand meia soma 
//
//---------------------------

 module testmeiasoma;
 
 reg a, b;
 wire s0 , s1 ;
 
 //instancia
 
 meiasoma MEIASOMA1 (s0,s1,a,b);
 
 initial begin
 
      $display("Guia 03-02 -Marley Ribeiro - 414510");
      $display("Test Meia Soma com NAND gate");
      $display("\n a & b = s0 s1\n");
      $monitor(" %b & %b = %b %b", a, b, s0, s1);
		
		a=0; b=0;
  #1  a=0; b=1; 
  #1  a=1; b=0; 
  #1  a=1; b=1; 
  
 end

endmodule//testeandmeiasoma