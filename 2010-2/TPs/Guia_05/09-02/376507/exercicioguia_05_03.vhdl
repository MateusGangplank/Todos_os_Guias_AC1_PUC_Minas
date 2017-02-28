//
//exercicioguia_05_03
//Nome :Eneas
//Numero:376507
//-------------------------------------------------------------
module xorgate(s0,a,b);
output s0;
input a,b ;
assign s0 =(a|b);
endmodule // nandgate
module terceiro;
reg a,b;
wire s0;

xorgate XOR3(s0,a,b);
//usando display
 initial begin
   $display ("exercicio_05_03");
   $display ("xorgate");
   $display ("\na | b=s0 \n");
   a=0;b=0;
#1 $display ("%b |%b=%b",a,b,s0);
   a=0;b=1;
#1 $display ("%b |%b=%b",a,b,s0);
   a=1;b=0;
#1 $display ("%b |%b=%b",a,b,s0);
   a=1;b=1;	
#1 $display ("%b |%b=%b",a,b,s0);
end 
endmodule //xorgate
//----------------------------------------------------------------
//agora achando a porta and
 
 module andgate(s1,a,b);
 output s1;
 input a,b;
 assign s1=(a & b);
 
 endmodule // nandgate
 module primeiro;
 reg a,b;
 wire s1;
 andgate AND3(s1,a,b);
 
 //iniciado o display
 initial begin
   $display ("exercicio_05_03");
   $display ("andgate");
	$display ("\na & b=s1 \n");
	a=0;b=0;
#1 $display ("%b & %b=%b",a,b,s1);
   a=0;b=1;
#1 $display ("%b & %b=%b",a,b,s1);
   a=1;b=0;
#1 $display ("%b & %b=%b",a,b,s1);
   a=1;b=1;
#1 $display ("%b & %b=%b",a,b,s1);
end
endmodule // andgate	
//----------------------------------------------------------------
//realizando os testes

//realizando os teste para and
module test_and
reg[0:0]a;
reg[1:0]b;
//parte principal 
//iniciando os testes
initial begin 
  $display("exercicioguia_04_03");
  $display ("module test_and ");
   a=1;
	b=1;
	$display ("\nPositive value ");
	$display ("a=%b =1b",a,a);
	$display ("a=%b =1b",b,b);
	
	$display ("\nNegative value ");
	$display ("a=%b=0b",a,a);
	$display ("a=%b=0b",b,b);
	
	$display ("\nNegative mixed expression");
	$display ("a=%b=  0b ",a,a);
	$display ("a=%b=  1b ",b,b);
	a=1+1;
	b=2-1+4+1;
	
	$display("\nOverflow");
	$display("a=%b =0b"a,a);
	$display("a=%b =0b"b,b);
end
endmodule //module test_and

		