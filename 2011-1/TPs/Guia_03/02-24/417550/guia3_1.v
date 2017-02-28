//Guia 03-1 MEIA-SOMA
//Nome: Matheus Felipe Silva Evangelista
//Matricula:417550

module meia_soma(s0,s1,x,y);
output s0,s1;
input x,y;

wire t1,t2,t3,t4;
//combinação para simular uma xor com portas Primitivas
not notx(t1,x);
not noty(t2,y);
and and1(t3,x,t2);
and and2(t4,y,t1);
or or1(s0,t3,t4);

and and3(s1,x,y);

endmodule

//teste

module teste_meia_soma;
reg a,b;
wire s0,s1;

//instancia
meia_soma m1(s0,s1,a,b);

//main
initial begin

$display("\n Guia 03-1");
$display("\n Meia soma com portas primitivas");
$display("\n Vout  A + B =              ");
    $monitor("  %b ||%b + %b = %b",s1,a,b,s0);

a=0;b=0;
#1 a=0;b=1;
#1 a=1;b=0;
#1 a=1;b=1;
end
endmodule
//Resultado

/*

  Guia 03-1
    
     Meia soma com portas primitivas
    
     Vout  A + B =              
      0 ||0 + 0 = 0
      0 ||0 + 1 = 1
      0 ||1 + 0 = 1
      1 ||1 + 1 = 0

*/
