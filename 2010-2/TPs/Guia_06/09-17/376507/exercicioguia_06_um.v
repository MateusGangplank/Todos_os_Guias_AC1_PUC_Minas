//
//exercicioguia_06_um
//Nome :Eneas
//Matricula:376507

module orgate(a0,a1,b0,b1,s2);
output s2;
input a0,a1,b0,b1 ;
assign s2= (a0|a1|b0|b1);
//somador completo e comparador   // E' SO' UMA PORTA or !

endmodule//orgate
module ALU1 ;
reg a0,a1,b0,b1;
wire s2;

initial begin
    $display (" ALU1 ");
    $display ("orgate ");
    $display ("\na |b=s2\n");
    a0=0;a1=0;b0=0;b1=0;
 #1 $display ("%b |%b|%b %b|%b=%b",a0,a1,b0,b1,s2);
    a0=0;a1=0;b0=0;b1=1;
 #1 $display ("%b |%b|%b %b|%b=%b",a0,a1,b0,b1,s2);
    a0=0;a1=0;b0=1;b1=0;
 #1 $display ("%b |%b|%b %b|%b=%b",a0,a1,b0,b1,s2);
    a0=0;a1=0;b0=1;b1=1;
 #1 $display ("%b |%b|%b %b|%b=%b",a0,a1,b0,b1,s2);
    a0=0;a1=1;b0=0;b1=0;
 #1 $display ("%b |%b|%b %b|%b=%b",a0,a1,b0,b1,s2);
    a0=0;a1=1;b0=0;b1=1;
 #1 $display ("%b |%b|%b %b|%b=%b",a0,a1,b0,b1,s2);
    a0=0;a1=1;b0=1;b1=0;
 #1 $display ("%b |%b|%b %b|%b=%b",a0,a1,b0,b1,s2);
    a0=0;a1=1;b0=1;b1=1;
 #1 $display ("%b |%b|%b %b|%b=%b",a0,a1,b0,b1,s2);
    a0=1;a1=0;b1=0;b0=0;
 #1 $display ("%b |%b|%b %b|%b=%b",a0,a1,b0,b1,s2);
    a0=1;a1=0;b0=0;b1=1;
 #1 $display ("%b |%b|%b %b|%b=%b",a0,a1,b0,b1,s2);
    a0=1;a1=0;b0=1;b1=0;
 #1 $display ("%b |%b|%b %b|%b=%b",a0,a1,b0,b1,s2);
    a0=1;a1=0;b0=1;b1=1;
 #1 $display ("%b |%b|%b %b|%b=%b",a0,a1,b0,b1,s2);
    a0=1;a1=1;b0=0;b1=0;
 #1 $display ("%b |%b|%b %b|%b=%b",a0,a1,b0,b1,s2);
    a0=1;a1=1;b0=0;b1=1;
 #1 $display ("%b |%b|%b %b|%b=%b",a0,a1,b0,b1,s2);
    a0=1;a1=1;b0=1;b1=0;
 #1 $display ("%b |%b|%b %b|%b=%b",a0,a1,b0,b1,s2);
    a0=1;a1=1;b0=1;b1=1;
 #1 $display ("%b |%b|%b %b|%b=%b",a0,a1,b0,b1,s2);
	 

end
endmodule//orgate