//------------------------------
// Extra guia 1
// Luiz Marques de Oliveira
// 417138
// -----------------------------

module extra1(output s, input a,input b,input c,input d,input e ,input f,input g,input h);

endmodule


module testextra1;
reg a,b,c,d,e,f,g,h;
wire s;

nand NAND1(s,a,b,c,d,e,f,g,h);

initial begin:start

a=0; b=0;c=0; d=0;e=0; f=0;g=0; h=0;

end


initial begin:main

$display("Extra 1 - Luiz Marques de olveira - 417138");
$display("PORTA NAND 1 BYTE");
$display("a  b  c  d  e  f  g  h = s");
$monitor("%b  %b  %b  %b  %b  %b  %b  %b  = %b",a,b,c,d,e,f,g,h,s);


#1 a=0; b=0;c=0; d=0;e=0; f=0;g=0; h=1;

end
	
	endmodule // extra1