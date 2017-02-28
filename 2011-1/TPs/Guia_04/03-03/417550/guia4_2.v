//Guia 04-2 MEIA-SOMA
//Nome: Matheus Felipe Silva Evangelista
//Matricula:417550

module meia_soma(Vout,Soma,x,y);
output Vout,Soma;
input x,y;

xor xor1(Vout,x,y);
and and1(Soma,x,y);

endmodule

module soma_completa(Vout1,Soma1,w,z,Vin);
output Vout1,Soma1;
input w,z,Vin;
wire t1,t2,t3;

meia_soma m1(t1,t2,w,z);

meia_soma m2(Soma1,t3,Vin,t1);
or or1(Vout1,t3,t2);

endmodule

//teste 
module teste_soma_completa;
reg a,b,Vin1;
wire Soma2,Vout2;


//instancia 
soma_completa s1(Vout2,Soma2,a,b,Vin1);




//main 
initial begin
$display("\n Guia 04-2");
$display("\n Soma Completa com subcircuitos");
$display("\n a  b  Vin  Vout S  ");
 $monitor(" %b  %b  %b     %b   %b",a,b,Vin1,Vout2,Soma2);
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
 Guia 04-2
    
     Soma Completa com subcircuitos
    
     a  b  Vin  Vout S  
     0  0  0     0   0
     0  0  1     0   1
     0  1  0     0   1
     0  1  1     1   0
     1  0  0     0   1
     1  0  1     1   0
     1  1  0     1   0
     1  1  1     1   1


*/