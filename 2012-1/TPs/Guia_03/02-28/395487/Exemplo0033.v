// --------------------------------------
// Exemplo0033 - andOR nandNOR
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
// andOR 
// ------------------------- 

module andOR ( output [1:0] s1 , output [1:0] s2 , input [1:0] a , input [1:0] b);
 
//-- and para os bits - saida s1
and AND0(s1[0],a[0],b[0]); 
and AND1(s1[1],a[1],b[1]);

//-- or para os bits - saida s2
or OR0(s2[0],a[0],b[0]); 
or OR1(s2[1],a[1],b[1]);

endmodule //-- andOR

// ------------------------- 
// nandNOR 
// ------------------------- 

module nandNOR ( output [1:0] s1 , output [1:0] s2 , input [1:0] a , input [1:0] b);
 
//-- and para os bits - saida s1
nand NAND0(s1[0],a[0],b[0]); 
nand NAND1(s1[1],a[1],b[1]);

//-- or para os bits - saida s2
nor NOR0(s2[0],a[0],b[0]); 
nor NOR1(s2[1],a[1],b[1]);

endmodule //-- nandNOR



//-------------------------------------------------------------------------------------------------------------------------------------------------------------------



// ------------------------- 
// Seletor
// ------------------------- 

module seletor( output [1:0] s1 , output [1:0] s2 , input[1:0] flag, input [1:0] a , input [1:0] b );

//--primeira parte seletor

//--saida andOR

wire [1:0]tmpAND1;//-- saida AND
wire [1:0]tmpOR1;//-- saida OR

andOR ANDOR( tmpAND1 , tmpOR1 , a , b );

//-- saida nandNOR

wire [1:0]tmpNAND1;//-- saida NAND
wire [1:0]tmpNOR1;//-- saida NOR

nandNOR NANDNOR( tmpNAND1 , tmpNOR1 , a , b );

//--operacoes com Flag
wire [1:0] st1;
wire [1:0] st2;
wire [1:0] st3;
wire [1:0] st4;

and2bit AND1( st1 , tmpAND1 , ~flag );
and2bit AND2( st2 , tmpOR1 , ~flag );
and2bit AND3( st3 , tmpNAND1 , flag );
and2bit AND4( st4 , tmpNOR1 , flag );

//--Saidas
or2bit OR1( s1 , st1 , st3 ); //-- saida AND ou NAND
or2bit OR2( s2 , st2 , st4 ); //-- saida OR ou NOR


endmodule //--seletor


//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module teste; 

// ------------------------- definir dados
reg [1:0] x; //-- x vai ser o a no teste
reg [1:0] y; //-- y vai ser o b no teste
reg [1:0] flag;
wire [1:0] s1; //-- saida AND ou NAND
wire [1:0] s2; //-- saida OR ou NOR
seletor andNANDorNOR ( s1 , s2 , flag , x , y); 

// ------------------------- parte principal 

initial begin 

$display("Exemplo0033 - Alvaro Henrique de Araujo Rungue - 395487"); 
$display("\nTest LU's module and ou NAND / or ou NOR:"); 

//-- projetar testes do modulo com flag 00
x = 2'b00; y = 2'b00; flag = 2'b00; 
$display("\nFlag = 0:");
#1 $display("x ,	y ,	Flag ,	Saida AND ou NAND , Saida OR ou NOR:");
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
#1 $display("x ,	y ,	Flag ,	Saida AND ou NAND , Saida OR ou NOR:");

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