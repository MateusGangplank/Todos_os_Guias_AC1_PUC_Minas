// --------------------------------------
// Exemplo0034 - XOROR XNORXOR
// Nome:Alvaro Henrique de Araujo Rungue
// Matricula: 395487
// --------------------------------------


module and2bit(output [1:0] s , input [1:0] a , input [1:0] b);

and AND0(s[0],a[0],b[0]); 
and AND1(s[1],a[1],b[1]);

endmodule //--fim and2Bit



module or2bit(output [1:0] s , input [1:0] a , input [1:0] b);

or OR0(s[0],a[0],b[0]); 
or OR1(s[1],a[1],b[1]);

endmodule //--fim or2Bit



module not2bit(output [1:0] s , input [1:0] a);

not NOT0( s[0] , a[0] );
not NOT1( s[1] , a[1] );

endmodule //-- Fim not2bit



// ------------------------- 
// xorXNOR
// ------------------------- 

module xorXNOR ( output [1:0] s1 , output [1:0] s2 , input [1:0] a , input [1:0] b);
 
//-- and para os bits - saida s1
xor XOR0(s1[0],a[0],b[0]); 
xor XOR1(s1[1],a[1],b[1]);

//-- or para os bits - saida s2
xnor XNOR0(s2[0],a[0],b[0]); 
xnor XNOR1(s2[1],a[1],b[1]);

endmodule //-- xorXNOR

// ------------------------- 
// orNOR 
// ------------------------- 

module orNOR ( output [1:0] s1 , output [1:0] s2 , input [1:0] a , input [1:0] b);
 
//-- and para os bits - saida s1
or OR0(s1[0],a[0],b[0]); 
or OR1(s1[1],a[1],b[1]);

//-- or para os bits - saida s2
nor NOR0(s2[0],a[0],b[0]); 
nor NOR1(s2[1],a[1],b[1]);

endmodule //-- orNOR



//-------------------------------------------------------------------------------------------------------------------------------------------------------------------



// ------------------------- 
// Seletor
// ------------------------- 

module seletor( output [1:0] s1 , output [1:0] s2 , input[1:0] flag, input [1:0] a , input [1:0] b );

//--primeira parte seletor

//--saida xor xnor

wire [1:0]tmpXOR1;//-- saida XOR
wire [1:0]tmpXNOR1;//-- saida XNOR

xorXNOR XORXNOR1( tmpXOR1 , tmpXNOR1 , a , b );

//-- saida or nor

wire [1:0]tmpOR1;//-- saida OR
wire [1:0]tmpNOR1;//-- saida NOR

orNOR ORNOR1( tmpOR1 , tmpNOR1 , a , b );

//--operacoes com Flag
wire [1:0] st1;
wire [1:0] st2;
wire [1:0] st3;
wire [1:0] st4;

and2bit AND1( st1 , tmpXOR1 , ~flag );
and2bit AND2( st2 , tmpXNOR1 , ~flag );
and2bit AND3( st3 , tmpOR1 , flag );
and2bit AND4( st4 , tmpNOR1 , flag );

//--Saidas
or2bit OR1( s1 , st1 , st3 ); //-- saida XOR ou OR
or2bit OR2( s2 , st2 , st4 ); //-- saida XNOR ou NOR


endmodule //--seletor


//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module teste; 

// ------------------------- definir dados
reg [1:0] x; //-- x vai ser o a no teste
reg [1:0] y; //-- y vai ser o b no teste
reg [1:0] flag;
wire [1:0] s1; //-- saida XOR ou OR
wire [1:0] s2; //-- saida XNOR ou NOR
seletor andNANDorNOR ( s1 , s2 , flag , x , y); 

// ------------------------- parte principal 

initial begin 

$display("Exemplo0034 - Alvaro Henrique de Araujo Rungue - 395487"); 
$display("\nTest LU's module XOR ou NOR / XNOR ou NOR:"); 

//-- projetar testes do modulo com flag 00
x = 2'b00; y = 2'b00; flag = 2'b00; 
$display("\nFlag = 0:");
#1 $display("x ,	y ,	Flag ,	Saida XOR ou OR , Saida XNOR ou NOR:");
#1 $monitor("%2b	%2b	%2b	%2b		    %2b ", x , y , flag , s1 , s2);

#1 x = 2'b00; y = 2'b01; flag = 2'b00;
#1 x = 2'b00; y = 2'b10; flag = 2'b00;
#1 x = 2'b00; y = 2'b11; flag = 2'b00;
#1 $display("\n");
#1 x = 2'b01; y = 2'b00; flag = 2'b00;
#1 x = 2'b01; y = 2'b01; flag = 2'b00;
#1 x = 2'b01; y = 2'b10; flag = 2'b00;
#1 x = 2'b01; y = 2'b11; flag = 2'b00;
#1 $display("\n");
#1 x = 2'b10; y = 2'b00; flag = 2'b00;
#1 x = 2'b10; y = 2'b01; flag = 2'b00;
#1 x = 2'b10; y = 2'b10; flag = 2'b00;
#1 x = 2'b10; y = 2'b11; flag = 2'b00;
#1 $display("\n");
#1 x = 2'b11; y = 2'b00; flag = 2'b00;
#1 x = 2'b11; y = 2'b01; flag = 2'b00;
#1 x = 2'b11; y = 2'b10; flag = 2'b00;
#1 x = 2'b11; y = 2'b11; flag = 2'b00;

//-- projetar testes do modulo com flag 11
#1 $display("\nFlag = 1:");
#1 $display("x ,	y ,	Flag ,	Saida XOR ou OR , Saida XNOR ou NOR:");

#1 x = 2'b00; y = 2'b00; flag = 2'b11; 
//--#1 $monitor("%2b	%2b	%2b	%2b", x , y , flag , s);
#1 x = 2'b00; y = 2'b01; flag = 2'b11;
#1 x = 2'b00; y = 2'b10; flag = 2'b11;
#1 x = 2'b00; y = 2'b11; flag = 2'b11;
#1 $display("\n");
#1 x = 2'b11; y = 2'b00; flag = 2'b11;
#1 x = 2'b11; y = 2'b01; flag = 2'b11;
#1 x = 2'b11; y = 2'b10; flag = 2'b11;
#1 x = 2'b11; y = 2'b11; flag = 2'b11;
#1 $display("\n");
#1 x = 2'b01; y = 2'b00; flag = 2'b11;
#1 x = 2'b01; y = 2'b01; flag = 2'b11;
#1 x = 2'b01; y = 2'b10; flag = 2'b11;
#1 x = 2'b01; y = 2'b11; flag = 2'b11;
#1 $display("\n");
#1 x = 2'b10; y = 2'b00; flag = 2'b11;
#1 x = 2'b10; y = 2'b01; flag = 2'b11;
#1 x = 2'b10; y = 2'b10; flag = 2'b11;
#1 x = 2'b10; y = 2'b11; flag = 2'b11;

end 

endmodule //-- f4comSelecao