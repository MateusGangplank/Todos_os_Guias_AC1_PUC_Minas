//Guia 02-1 OR
//Nome: Matheus Felipe Silva Evangelista
//Matricula:417550

module or_cnand(s,x,y);
output s;
input x,y;

wire t1,t2;

nand n1 (t1,x);
nand n2 (t2,y);

assign s = ~(t1 & t2);

endmodule

// teste
module testeOr_cnand;
reg a,b;
wire s;

//instancia
 or_cnand or1 (s,a,b);
 
 //main
 
 initial begin
 
$display("\n Guia 02-1");
$display("\n Teste Or com Nands");
$monitor("%b | %b = %b",a,b,s);
a=0;b=0;
#1 a=0;b=1;
#1 a=1;b=0;
#1 a=1;b=1;

end
endmodule
//Resultado

/*
Guia 02-1
    
     Teste Or com Nands
    0 | 0 = 0
    0 | 1 = 1
    1 | 0 = 1
    1 | 1 = 1
    
    */
    
// SUGESTAO: TENTE USAR MAIS AS DEFINICOES DE PORTAS.
//           PROCURE EVITAR AS EXPRESSOES.

    

