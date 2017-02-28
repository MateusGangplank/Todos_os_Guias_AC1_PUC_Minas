//Guia 02-2 AND
//Nome: Matheus Felipe Silva Evangelista
//Matricula:417550

module and_cnors (s,x,y);
output s;
input x,y;
wire t1,t2;

nor n1(t1,x);
nor n2(t2,y);

assign s = ~(t1|t2);

endmodule

//teste And com Nors

module testeAnd_cnors;
reg a,b;
wire s;

//intanciando
and_cnors and_cnors1(s,a,b);
//main
initial begin
$display("\n Guia 02-2");
$display("\n Teste And com Nors");
$monitor("%b & %b = %b",a,b,s);
a=0;b=0;
#1 a=0;b=1;
#1 a=1;b=0;
#1 a=1;b=1;
end
endmodule
//Resultado
/*
   Guia 02-2
    
     Teste And com Nors
    0 & 0 = 0
    0 & 1 = 0
    1 & 0 = 0
    1 & 1 = 1
    */
