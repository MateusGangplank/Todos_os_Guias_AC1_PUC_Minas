//------------------------------------
//--- Andre Campolina
//--- 381217
//------------------------------------

//------Modulo Flip Flop JK

module jk ( output q, output qnot, input j, input k, input clk ); 
reg q, qnot; 
always @( posedge clk ) 
begin 
if ( j & ~k ) 
begin 
q <= 1; 
qnot <= 0; 
end 
else 
	if ( ~j & k ) 
	begin 
	q <= 0; 
	qnot <= 1; 
	end 
	else 
if ( j & k ) 
begin 
q <= ~q; 
qnot <= ~qnot; 
	end 
end 

endmodule // jk

module Ex01;
reg[4:0] cont;
reg pulse = 0;
reg clear;
reg i;

wire w1, w2, w3, w4, w5;

jk ff1(,w1,i,i,pulse,0,clear);
jk ff2(,w2,i,i,w1,0,clear);
jk ff3(,w3,i,i,w2,0,clear);
jk ff4(,w4,i,i,w3,0,clear);
jk ff5(,w5,i,i,w4,0,clear);

cont[0] = w1;
cont[1] = w2;
cont[2] = w3;
cont[3] = w4;
cont[5] = w5;

always
#5 pulse = ~pulse;begin

initial begin 
$display ( "Guia 09 - Guilherme Moreira Nunes" );
$display ( "Exercicio02 - Flip Flop" ); 

// initial values 
clr = 0; 
pulso = 0; 

$monitor( "%4d %4b", $time, reg );  
#50 $finish;
end 


endmodule