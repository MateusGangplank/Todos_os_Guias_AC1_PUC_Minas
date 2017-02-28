//
//exercicioguia_05
//Nome:Eneas
//Numero:376507
//----------------------------------------------------------------
module andgate(s0,a,b,c);
output s0;
input a,b,c;
assign s0=(a&b&c);
endmodule //andgate
module primeiraparte;
reg a,b,c;
wire s0,s1;
andgate AND1(s0,a,b,c);
//usando o display
initial begin
   $display ("exercicioguia_05");
   $display ("andgate");
   $display ("\na & b=s0\n");
   a=0;b=0;c=0;
#1 $display ("%b &%b &%b=%b ",a,b,c,s0);
   a=0;b=0;c=1;
#1 $display ("%b &%b &%b=%b ",a,b,c,s0);
   a=0;b=1;c=0;
#1 $display ("%b &%b &%b=%b ",a,b,c,s0);
   a=0;b=1;c=1;
#1 $display ("%b &%b &%b=%b ",a,b,c,s0);
   a=1;b=0;c=0;
#1 $display ("%b &%b &%b=%b ",a,b,c,s0);
   a=1;b=0;c=1;
#1 $display ("%b &%b &%b=%b ",a,b,c,s0);
   a=1;b=1;c=0;
#1 $display ("%b &%b &%b=%b ",a,b,c,s0);
   a=1;b=1;c=1;
#1 $display ("%b &%b &%b=%b ",a,b,c,s0);
end
endmodule //andgate

//achando a outra parte
module xorgate(s1,a,b,c);
output s1;
input a,b,c;
assign s1 =(a|b|c);
endmodule // xorgate
module segundaparte;
reg a,b,c;
wire s0,s1;
xorgate XOR1(s1,a,b,c);
//usando o display
initial begin
     $display ("exerciciogia_04");
	  $display ("xorgate");
	  $display ("\na |b =s1 \n");
	  a=0;b=0;c=0;
 #1  $display("%b |%b|%b=%b ",a,b,c,s1);
     a=0;b=0;c=1;
 #1  $display("%b |%b|%b=%b ",a,b,c,s1);
     a=0;b=1;c=0;
 #1  $display("%b |%b|%b=%b ",a,b,c,s1);
     a=0;b=1;c=1;	
 #1  $display("%b |%b|%b=%b ",a,b,c,s1);
  	  a=1;b=0;c=0;
 #1  $display("%b |%b|%b=%b ",a,b,c,s1);
     a=1;b=0;c=1;	  
 #1  $display("%b |%b|%b=%b ",a,b,c,s1);
	  a=1;b=1;c=0; 
 #1  $display("%b |%b|%b=%b ",a,b,c,s1);
     a=1;b=1;c=1; 
 #1  $display("%b |%b|%b=%b ",a,b,c,s1);
 
end
endmodule //xorgate	
//exercicioguia_05_testand

module test_and;
reg [0:0] a;
reg [1:0] b;
reg [2:0] c;

//parte principal

initial begin
   $display("exercicio_05_test");
	$display("module test_and ");
	a=1;
	b=1;
	c=1;
	$display ("\n Positive value ");
	$display ("a=%b =1b ",a,a);
	$display ("a=%b =1b ",b,b);
	$display ("a=%b =1b ",c,c);
	
	$display ("\nNegative value ");
	$display ("a=%b =0b ",a,a);
	$display ("a=%b =1b ",b,b);
	$display ("a=%b =2b ",c,c);
	
	$display ("\nNegative mixed expression ");
	$display ("a=%b= 0b ",a,a);
	$display ("a=%b= 1b ",b,b);
	$display ("a=%b= 2b ",c,c);
	a=1+1+1;
	b=3-1+9+1;
	
	$display ("\nOverflow");
	$display ("a=%b =0b ",a,a);
	$display ("a=%b =1b ",b,b);
	$display ("a=%b =2b ",c,c);
	end
	endmodule //test_and
	//------------------------------------------------------------
	//agora o teste para a xor
	//exercicioguia0_05_testxor
	module test_xor;	
	reg [0:0] a;
   reg [1:0] b;
   reg [2:0] c;
	//parte principal

initial begin
   $display("exercicio_05_test");
	$display("module test_xor ");
	a=1;
	b=1;
	c=1;
	$display ("\n Positive value ");
	$display ("a=%b =1b ",a,a);
	$display ("a=%b =1b ",b,b);
	$display ("a=%b =1b ",c,c);
	
	$display ("\nNegative value ");
	$display ("a=%b =0b ",a,a);
	$display ("a=%b =1b ",b,b);
	$display ("a=%b =2b ",c,c);
	
	$display ("\nNegative mixed expression ");
	$display ("a=%b= 0b ",a,a);
	$display ("a=%b= 1b ",b,b);
	$display ("a=%b= 2b ",c,c);
	a=1+1+1;
	b=3-1+9+1;
	
	$display ("\nOverflow");
	$display ("a=%b =0b ",a,a);
	$display ("a=%b =1b ",b,b);
	$display ("a=%b =2b ",c,c);
	end
	endmodule // test_xor		
	
// OBS.: REVER OS OBJETIVOS. NAO FORAM IDENTIFICADAS AS FUNCOES REQUERIDAS.
