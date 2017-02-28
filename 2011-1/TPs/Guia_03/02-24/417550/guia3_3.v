//Guia 03-5 MEIA-DIFEREN�A
//Nome: Matheus Felipe Silva Evangelista
//Matricula:417550

module meia_diferenca(s0,s1,x,y);
output s0,s1;
input x,y;

wire t1,t2,t3,t4,t5;
//combina��o para simular uma xor com portas Nands
nand nand1(t1,x,y);
nand nand2(t2,x,t1);
nand nand3(t3,t1,y);
nand nand4(s0,t2,t3);


//combina��o para simular uma not com portas Nands
nand not1(t4,x);

//combina��o para fazer uma and com portas Nands
nand nand5(t5,t4,y);
nand nand6(s1,t5);



endmodule

//teste

module teste_meia_diferenca;
reg a,b;
wire s0,s1;

//instancia
meia_diferenca m1(s0,s1,a,b);

//main
initial begin

$display("\n Guia 03-5");
$display("\n Meia diferen�a com portas Nors");
$display("\n Vout  A - B =              ");
    $monitor("  %b ||%b - %b = %b",s1,a,b,s0);

a=0;b=0;
#1 a=0;b=1;
#1 a=1;b=0;
#1 a=1;b=1;
end
endmodule
//Resultado

/*
	  
     Guia 03-5
    
     Meia diferen�a com portas Nors
    
     Vout  A - B =              
      0 ||0 - 0 = 0
      1 ||0 - 1 = 1
      0 ||1 - 0 = 1
      0 ||1 - 1 = 0


*/
