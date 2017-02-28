// --------------------------------------- 
// Guia 02 - Exercicio 01  
// Nome: Alvaro Henrique de Araujo Rungue 
// Matricula: 395487
// ---------------------------------------

module definirRegistradores;

//-- Registradores letra A

reg[2:0] dois;
reg[3:0] quinze; 
reg[4:0] respA;

//-- Registradores letra B

reg[1:0] tres;
reg[3:0] oito; 
reg[4:0] respB;

//-- Registradores letra C

reg[5:0] trintaedois;
reg[1:0] tresC; 
reg[6:0] respC;

//-- Registradores letra D

reg[4:0] vinteum;
reg[3:0] onze; 
reg[6:0] respD;

//-- Registradores letra E

reg[1:0] doisE;
reg[2:0] cinco;
reg[2:0] seis;
reg[1:0] um;
reg[3:0] respE;

// ------------------------- parte principal 
initial begin 
$display("Guia 02 - Exercicio 01 - Alvaro Henrique de Araujo Rungue - 395487"); 
$display("\n\n\nQuestoes:"); 

//-- Letra A

dois = 2; 
quinze = 15; 
respA = dois + quinze; 

$display("\nLetra A:"); 
$display("%d + %d = %4b", dois, quinze, respA); 

//-- Letra B

tres = 3; 
oito = 8; 
respB = tres * oito; 


$display("\nLetra B:"); 
$display("%d * %d = %4b", tres, oito, respB);

//--Letra C

trintaedois = 32; 
tresC = 3; 
respC  = trintaedois / tresC; 

$display("\nLetra C:"); 
$display("%d / %d = %4b", trintaedois, tresC, respC);

//--Letra D

vinteum = 21;
onze = 11; 
respD = vinteum - onze; 

$display("\nLetra D:"); 
$display("%d - %d = %4b", vinteum, onze, respD);

//--Letra E

doisE = 2; 
cinco = 5; 
seis = 6;
um = 1; 
respE = doisE * cinco + seis - um; 


$display("\nLetra E:"); 
$display("%d * %d + %d - %d = %4b", doisE, cinco, seis, um, respE);

end 
endmodule //--DefinirRegistradores