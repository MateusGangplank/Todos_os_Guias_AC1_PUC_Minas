//Guia 02-5 NOR
//Nome: Matheus Felipe Silva Evangelista
//Matricula:417550

module Nand_cnor(s,x,y);
output s;
input x,y;
wire t1,t2,t3;

nor n1(t1,x);
nor n2(t2,y);
nor n3(t3,t1,t2);

assign s = ~(t3 | t3);

endmodule

//teste
module testeNand_cnor;
reg a,b;
wire s;

//instanciando

Nand_cnor n1 (s,a,b);

//main
initial begin
$display("\n Guia 02-5");
$display("\n Teste Nands com Nors");
$monitor("~(%b & %b )= %b",a,b,s);
a=0;b=0;
#1 a=0;b=1;
#1 a=1;b=0;
#1 a=1;b=1;
end

endmodule

//Resultado
/*
 Guia 02-5
    
     Teste Nands com Nors
    ~(0 & 0 )= 1
    ~(0 & 1 )= 1
    ~(1 & 0 )= 1
    ~(1 & 1 )= 0
    
    */