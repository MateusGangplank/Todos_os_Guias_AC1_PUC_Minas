//---------
//Exemplo0016 - SOMA
//Nome: Rafael Lopes Barbosa
//Matricula:435052
//-----------


//------------------
//test number system
//------------------

module test_base_06;
//--------- definir dados
reg[4:0]a;
reg[4:0]b;
reg[3:0]c;
reg[3:0]d;
reg[3:0]e;

//----------- parte principal
initial begin
$display("Exemplo0016 - Rafael Lopes Barbosa - 435052");
$display("Test number system");

a = 2+14;
b = 3*7;
c = 34 / 3;
d = 19 - 11;
e = 2*4+6-1;

$display("2 + 14 = %b",a);
$display("3 * 7 = %b",b);
$display("34 / 3 = %b",c);
$display("19 - 11 = %b",d);
$display("2*4+6-1 = %b",e);

end



endmodule//test_base