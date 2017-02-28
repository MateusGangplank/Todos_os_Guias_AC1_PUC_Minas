//
//exercicioguia_09_um
//Nome :Eneas
//Matricula :376507
//-----------------------------------------------------------
module xorgate (s,a,b,c,d);                  // DESNECESSARIO, PODE TIRAR

output s;
input a , b , c , d;
assign s=~ (a|b|c|d);

endmodule //xorgate
//---------------------------------------------------------
module primeiro;                             // DESNECESSARIO, PODE TIRAR
reg a,b,c,d;
wire s;
xorgate Xor1(s,a,b,c,d);
//usando display

initial begin

    $display ("primeiro");
    $display ("xorgate");
	 $display ("\na |b=s\n");
	 a=0;b=0;c=0;d=0;
 #1 $display("%b|%b|%b|%b=%b",a,b,c,d,s);
    a=0;b=0;c=0;d=1;
 #1 $display("%b|%b|%b|%b=%b",a,b,c,d,s);
    a=0;b=0;c=1;d=0;
 #1 $display("%b|%b|%b|%b=%b",a,b,c,d,s);
    a=0;b=0;c=1;d=1;
 #1 $display("%b|%b|%b|%b=%b",a,b,c,d,s);
    a=0;b=1;c=0;d=0;
 #1 $display("%b|%b|%b|%b=%b",a,b,c,d,s);
    a=0;b=1;c=0;d=1;
 #1 $display("%b|%b|%b|%b=%b",a,b,c,d,s);
    a=0;b=1;c=1;d=0;
 #1 $display("%b|%b|%b|%b=%b",a,b,c,d,s);
    a=0;b=1;c=1;d=1;
 #1 $display("%b|%b|%b|%b=%b",a,b,c,d,s);
    a=1;b=0;c=0;d=0;
 #1 $display("%b|%b|%b|%b=%b",a,b,c,d,s);
    a=1;b=0;c=0;d=1;
 #1 $display("%b|%b|%b|%b=%b",a,b,c,d,s);
    a=1;b=0;c=1;d=0;
 #1 $display("%b|%b|%b|%b=%b",a,b,c,d,s);
    a=1;b=0;c=1;d=1;
 #1 $display("%b|%b|%b|%b=%b",a,b,c,d,s);
	 a=1;b=1;c=0;d=0;
 #1 $display("%b|%b|%b|%b=%b",a,b,c,d,s);
    a=1;b=1;c=0;d=1;
 #1 $display("%b|%b|%b|%b=%b",a,b,c,d,s);
    a=1;b=1;c=1;d=0;
 #1 $display("%b|%b|%b|%b=%b",a,b,c,d,s);
     a=1;b=1;c=1;d=1;
 #1 $display("%b|%b|%b|%b=%b",a,b,c,d,s);

end
endmodule //xorgate
//------------------------------------------------------------------
// geradorpulso
module pulso(pul);
output pul;
reg pul;
reg p,q;

initial
begin

pul=1'b0;

end
always
begin
#30 pul=~pul;                // ISSO DEVE FICAR NO GERADOR DE CLOCK
#20 pul=0;                   // ISSO NAO PARECE SER NECESSARIO, PASSAR PARA OUTRO LUGAR
#15 pul=1;                   // ISSO NAO PARECE SER NECESSARIO, PASSAR PARA OUTRO LUGAR
#100 $finish;                // ISSO NAO PARECE SER NECESSARIO, PASSAR PARA O TESTE

//@(pulso)p=q;
end
endmodule
//------------------------------------
//module geraronda(wave);
//initial
//pul=1'b0;
//initial
// begin 

//#15 pul=1;
//#20 pul=0;
//#30 pul=1;
//#60 pul=0;
//end ;	  