//Guia 04-3 DIFERENÇA COMPLETA
//Nome: Matheus Felipe Silva Evangelista
//Matricula:417550

module meia_diferenca(d,Vout,x,y);
output d,Vout;
input x,y;

xor xor1(d,x,y);
and and1(Vout,~x,y);

endmodule

module diferenca_completa(d1,Vout1,Vin,w,z);
output d1,Vout1;
input w,z,Vin;
wire t1,t2,t3;

meia_diferenca m1(t1,t2,w,z);
meia_diferenca m2(d1,t3,t1,Vin);
or or1(Vout1,t3,t2);

endmodule

//teste

module TesteDiferenca;
reg a,b,Vin1;
wire d2,Vout2;

//intancia

diferenca_completa diferenca(d2,Vout2,Vin1,a,b);
//main
initial begin
$display("\n Guia 04-3");
$display("\n Diferença Completa com subcircuitos");
$display("\na  b Vin Vout Diferenca"); 
$monitor("%b  %b  %b  %b  %b",a,b,Vin1,Vout2,d2);
a=0; b=0; Vin1=0;
#1  a=0; b=0; Vin1=1; 
#1  a=0; b=1; Vin1=0;
#1  a=0; b=1; Vin1=1; 
#1  a=1; b=0; Vin1=0;
#1  a=1; b=0; Vin1=1; 
#1  a=1; b=1; Vin1=0;
#1  a=1; b=1; Vin1=1; 
end
endmodule

//Resultado

/*
   Guia 04-3
    
     Diferenÿa Completa com subcircuitos
    
    a  b Vin Vout Diferenca
    0  0  0  0  0
    0  0  1  1  1
    0  1  0  1  1
    0  1  1  1  0
    1  0  0  0  1
    1  0  1  0  0
    1  1  0  0  0
    1  1  1  1  1
    
   */