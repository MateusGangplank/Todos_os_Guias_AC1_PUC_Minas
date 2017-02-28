//Guia 02-3 NOT
//Nome: Matheus Felipe Silva Evangelista
//Matricula:417550

module not_cnand (s,x);

output s;
input x;

assign s = ~(x&x);

endmodule

//teste

module testenot_cnand;
reg y;
wire s;

//instanciando
not_cnand not_1(s,y);

//main

initial begin
$display("\n Guia 02-3");
$display("\n Teste Not com Nand");
$display("\n ~(y) = s \n");
	$monitor("~(%b) = (%b)",y,s);
	y=0;
#1	y=1;
end
endmodule

//Resultado
/*

 Guia 02-3
    
     Teste Not com Nand
    
     ~(y) = s 
    
    ~(0) = (1)
    ~(1) = (0)
    



*/
	 

