//---------
//Exemplo0017 - SOMA EM BINARIO
//Nome: Rafael Lopes Barbosa
//Matricula:435052
//-----------


//------------------
//test number system
//------------------

module test_base_06;
//--------- definir dados
reg[4:0]a;
reg[6:0]b;
reg[9:0]c;
reg[6:0]d;
reg[9:0]e;

//----------- parte principal
initial begin
$display("Exemplo0017 - Rafael Lopes Barbosa - 435052");
$display("Test number system");

a = 6'b100010 + 5'b11010;
b = 5'b11010 + 5'o23;
c = 10'o1234 + 10'h2d;
d = 9'h1a9 - 9'b101101001;
e = (7'd25 * 7'o41) + 7'h6b;

$display("100010(2) + 11010(2) = %b",a);
$display("11010(2) + 23(8) = %b",b);
$display("1234(8) + 2D(16) = %b",c);
$display("1A9(16) - 101101001(2) = %b",d);
$display("25 * 41(8) + 6B(16) = %b",e);

end



endmodule//test_base