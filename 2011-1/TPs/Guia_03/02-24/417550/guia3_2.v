//Guia 03-2 MEIA-SOMA
//Nome: Matheus Felipe Silva Evangelista
//Matricula:417550

module meia_soma(s0,s1,x,y);
output s0,s1;
input x,y;

wire t1,t2,t3;
//combinação para simular uma xor com Nands
nand n1(t1,x,y);
nand n2(t2,x,t1);
nand n3(t3,t1,y);

assign s0 = ~(t2 & t3);

assign s1 = (x & y);

endmodule

//teste

module teste_meia_soma;
reg a,b;
wire s0,s1;

//instancia
meia_soma m1(s0,s1,a,b);

//main
initial begin

$display("\n Guia 03-2");
$display("\n Meia soma com portas nands");
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

 Guia 03-2
    
     Meia soma com portas nands
    
     Vout  A + B =              
      0 ||0 + 0 = 0
      0 ||0 + 1 = 1
      0 ||1 + 0 = 1
      1 ||1 + 1 = 0

*/
