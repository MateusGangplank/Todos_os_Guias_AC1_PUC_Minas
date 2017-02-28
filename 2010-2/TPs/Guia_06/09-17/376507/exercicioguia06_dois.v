//
//exercicioguia_06_dois
//Nome :Eneas 
//Numero:376507

module xnorgate(a,b,c,d ,s1);
output s1;
input a0,a1,b0,b1 ;
assign s1 =~(a0 |a1|b0|b1);      // E' SO' UMA PORTA nor
endmodule//xnorgate

module ALU2;
reg a0,a1,b0,b1;
wire s1;

//xnorgate  XNOR1(s1,a0,a1,b0,b1);
initial begin
//realizar um operador de soma completa ALU com 4 bits com subtrator copleto
   // $display ("exercicio_06_dois");
    $display ("ALU2");
    $display ("xnorgate");
    $display ("signal=1+amplitude=3");
    $display ("subtrator completo");
    $display ("\na |b=s1\n");
    a0=0;a1=0;b0=0;b1=0;
#1  $display ("%b |%b|%b|%b=%b",a0,a1,b0,b1,s1);
    a0=0;a1=0;b0=0;b1=1;
#1  $display ("%b |%b|%b|%b=%b",a0,a1,b0,b1,s1);
    a0=0;a1=0;b0=1;b1=0;
#1  $display ("%b |%b|%b|%b=%b",a0,a1,b0,b1,s1);
    a0=0;a1=0;b0=1;b1=1;
#1  $display ("%b |%b|%b|%b=%b",a0,a1,b0,b1,s1);
    a0=0;a1=1;b0=0;b1=0;
#1  $display ("%b |%b|%b|%b=%b",a0,a1,b0,b1,s1);
    a0=0;a1=1;b0=0;b1=1;
#1  $display ("%b |%b|%b|%b=%b",a0,a1,b0,b1,s1);
    a0=0;a1=1;b0=1;b1=0;
#1  $display ("%b |%b|%b|%b=%b",a0,a1,b0,b1,s1);
    a0=0;a1=1;b0=1;b1=1;
#1  $display ("%b |%b|%b|%b=%b",a0,a1,b0,b1,s1);
    a0=1;a1=0;b0=0;b1=0;
#1  $display ("%b |%b|%b|%b=%b",a0,a1,b0,b1,s1);
    a0=1;a1=0;b0=0;b1=1;
#1  $display ("%b |%b|%b|%b=%b",a0,a1,b0,b1,s1);
    a0=1;a1=0;b0=1;b1=0;
#1  $display ("%b |%b|%b|%b=%b",a0,a1,b0,b1,s1);
    a0=1;a1=0;b0=1;b1=1;
#1  $display ("%b |%b|%b|%b=%b",a0,a1,b0,b1,s1);
    a0=1;a1=1;b0=0;b1=0;
#1  $display ("%b |%b|%b|%b=%b",a0,a1,b0,b1,s1);
    a0=1;a1=1;b0=0;b1=1;
#1  $display ("%b |%b|%b|%b=%b",a0,a1,b0,b1,s1);
    a0=1;a1=1;b0=1;b1=0;
#1  $display ("%b |%b|%b|%b=%b",a0,a1,b0,b1,s1);
    a0=1;a1=1;b0=1;b1=1;
#1  $display ("%b |%b|%b|%b=%b",a0,a1,b0,b1,s1);
end
endmodule //xnorgate
 
 
 
  