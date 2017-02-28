//Guia 03-4 MEIA-SOMA
//Nome: Matheus Felipe Silva Evangelista
//Matricula:417550

module meia_soma(s0,s1,x,y);
output s0,s1;
input x,y;

wire t1,t2,t3,t4,t5,t6,t7,t8;
//combinação para simular uma xor com portas Nors
nor nor1(t1,x);
nor nor2(t2,y);
nor nor3(t3,t1,t2);
nor nor4(t4,x,y);
nor nor5(s0,t3,t4);



//combinação para fazer uma and com portas Nors
nor nor6(t6,y);
nor nor7(t7,x);
nor nor8(s1,t6,t7);

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
$display("\n Meia soma com portas Nors");
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
     Meia diferenÿa com portas Nors


     Vout  A - B =              
      0 ||0 - 0 = 0
      1 ||0 - 1 = 1
      0 ||1 - 0 = 1
      0 ||1 - 1 = 0


*/
