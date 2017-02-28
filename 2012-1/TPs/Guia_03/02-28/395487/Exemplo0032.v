// --------------------------------------
// Exemplo0032 - and e or com flag 
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
// f4_gate 
// ------------------------- 

module f4 ( output [1:0] s1 , output [1:0] s2 , input [1:0] a , input [1:0] b);
 
//-- and para os bits - saida s1
and AND0(s1[0],a[0],b[0]); 
and AND1(s1[1],a[1],b[1]);

//-- or para os bits - saida s2
or OR0(s2[0],a[0],b[0]); 
or OR1(s2[1],a[1],b[1]);

endmodule //-- f4 



//-------------------------------------------------------------------------------------------------------------------------------------------------------------------



// ------------------------- 
// f4_gate com selecao
// ------------------------- 

module f4comSelecao( output [1:0] s , input[1:0] flag, input [1:0] a , input [1:0] b );

//--primeira parte f4

wire [1:0]tmpAND1;//-- saida AND
wire [1:0]tmpOR1;//-- saida OR

f4 moduloF4( tmpAND1 , tmpOR1 , a , b );

//--segunda parte usando o seletor e AND1 AND2 e OR1

//-- 00 para OR
//-- 11 para AND

//-- primeiro AND1
wire [1:0] tmp;
and2bit AND1( tmp , tmpAND1 , flag );

//-- Segundo AND2
wire [1:0] tmp1;
wire [1:0] tmpNot;
not2bit NOT1( tmpNot , flag );
and2bit AND2( tmp1 , tmpOR1 , tmpNot );

//-- OR

or2bit OR3( s , tmp , tmp1);


endmodule //--f4 com selecao



module test_f4; 

// ------------------------- definir dados
reg [1:0] x; 
reg [1:0] y; 
reg [1:0] flag;
wire [1:0] s;
f4comSelecao modulo ( s , flag , x , y); 

// ------------------------- parte principal 

initial begin 

$display("Exemplo0032 - Alvaro Henrique de Araujo Rungue - 395487"); 
$display("\nTest LU's module:"); 

//-- projetar testes do modulo com flag 00
x = 2'b00; y = 2'b00; flag = 2'b00; 
$display("\nFlag = 0:");
#1 $display("x ,	y ,	Flag ,	Saida:");
#1 $monitor("%2b	%2b	%2b	%2b", x , y , flag , s);

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
#1 $display("x ,	y ,	Flag ,	Saida:");

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