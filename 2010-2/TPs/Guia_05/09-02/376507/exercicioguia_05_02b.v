//
//exercicioguia_05_02
//Nome :Eneas
//Numero:376507
//------------------------------------------------------
module xorgate (s0,a,b);
output s0;
input a,b;
assign s0= (a|b);

endmodule // xorgate
module primeiro;
reg a,b;
wire s0,s1;

xorgate XOR1(s0,a,b);
//usando display

initial begin
   $display ("exercicioguia_05_02");
   $display ("xorgate");
   $display ("\na | b=s0 \n");
   a=0;b=0;
#1 $display("%b |%b=%b ",a,b,s0);
   a=0;b=1;
#1 $display("%b |%b=%b ",a,b,s0);
   a=1;b=0;
#1 $display("%b |%b=%b ",a,b,s0);
   a=1;b=1;
#1 $display("%b |%b=%b ",a,b,s0);
end
endmodule // xorgate

//fazendo para a outra parte and
module andgate (s1,a,b);
output s1;
input a,b;
assign s1=(a&b);
endmodule // nandgate

module segundaparte;
reg a,b;
wire s1;
andgate AND1(s1,a,b);

//usando display
initial begin
    $display("exercicioguia_04_02");
	 $display("andgate");
	 $display("\na & b=s1 \n ");
	 a=0;b=0;
#1  $display("%b & %b	=%b ",a,b,s1);
    a=0;b=1;
#1  $display("%b & %b	=%b ",a,b,s1);
    a=1;b=0;
#1  $display("%b & %b	=%b ",a,b,s1);
    a=1;b=1;
#1  $display("%b & %b	=%b ",a,b,s1);
end
endmodule //andgate

//colocando a parte de inversao
module notgate (s1,b);
output s1;
input b;
assign s1=~(&b);
endmodule // notgate
module terceiraparte;
reg b;
wire s1;
notgate NOT1(s1,b);
//usando o display
initial begin
   $display ("exercicioguia_04_02");
   $display ("notgate");
   $display ("\na ~ b=s1\n");
   b=0;
#1 $display("%b~ =%b",b,s1);
   b=1;
#1 $display("%b~ =%b",b,s1);
end
endmodule //notgate
 	 		