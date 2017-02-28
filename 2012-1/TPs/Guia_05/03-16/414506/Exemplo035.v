//----------------------
//Exemplo035 - comparador
//Nome:Fernando Silva
//Matricula:414506
//----------------------


module comparador(output [3:0]saida,input [1:0]a,input [1:0]b);

wire saida1,saida2,saida3,saida4,saida5,saida6,saida7,saida8,saida9;

xor O1(saida1,a[0],~b[0]);
xor O2(saida2,a[1],~b[1]);      
and A1(saida3,saida1,saida2); //a=b
and A2(saida4,a[0],~b[0]);
and A3(saida5,saida1,a[1],~b[1]);
and A4(saida6,~a[0],b[0]);
and A5(saida7,saida1,~a[1],b[1]);
or O3(saida8,saida4,saida5);   //a>b
or O4(saida9,saida6,saida7);   //a<b

// PODE USAR AS SAIDAS DIRETAMENTE NAS PORTAS
assign saida[0]=saida3;
assign saida[1]=saida8;
assign saida[2]=saida9;


endmodule //fim comparador


module test_comparador;

reg [1:0]x;
reg [1:0]y;
wire [3:0]z;

comparador compara(z,x,y);

initial begin

$display("Exemplo0035 - Fernando Silva - 414506"); 
$display("Test Comparador"); 
$display("x  comparador  y  = resultado");
 x=4'b01; y=4'b01;
$monitor("%2b  %2b = %1b  ", x,y,z);   
#1 x=4'b01; y=4'b01; 
#1 x=4'b00; y=4'b01; 
#1 x=4'b11; y=4'b01; 
end
endmodule//fim test_comparador
