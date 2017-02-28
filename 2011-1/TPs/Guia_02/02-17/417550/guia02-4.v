//Guia 02-4 NOR
//Nome: Matheus Felipe Silva Evangelista
//Matricula:417550

module nor_cnand(s,x,y);
output s;
input x,y;
wire t1,t2,t3;

nand n1(t1,x);
nand n2(t2,y);
nand n3(t3,t1,t2);

assign s =~(t3&t3);
endmodule

//teste
module testeNor_cnands;
reg a,b;
wire s;

//instanciando

nor_cnand nor1(s,a,b);

//main
initial begin
$display("\n Guia 02-4");
$display("\n Teste Nor com Nands");
$monitor("~(%b | %b )= %b",a,b,s);
a=0;b=0;
#1 a=0;b=1;
#1 a=1;b=0;
#1 a=1;b=1;
end

endmodule

//Resultado
/*
  ~(0 | 0 )= 1
    ~(0 | 1 )= 0
    ~(1 | 0 )= 0
    ~(1 | 1 )= 0
    */