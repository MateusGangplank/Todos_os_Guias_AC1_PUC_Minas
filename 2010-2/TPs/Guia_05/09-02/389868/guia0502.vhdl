//--Felipe Pacífico -- 389868
//--Guia 0502

module meiaDiferenca(o0,o1,i1,i2);
output o0,o1;
input i1,i2;

xor Xor1(o0,i1,i2);
and And1(o1,~i1,i2);
endmodule //--end meiaDiferenca



module diferencaCompleta (o0,o1,i1,i2,i3);
output o0,o1;
input i1,i2,i3;
wire  w1,w2,w3;

meiaDiferenca Md1(w1,w2,i1,i2);
meiaDiferenca Md2(o0,w3,i3,w1);
or And1(o1,w2,w3);
endmodule  //--end diferencaCompleta



module difDoisBits(o0,o1,o2,i1,i2,i3,i4);
output o0,o1,o2;
input i1,i2,i3,i4;
wire w1;
meiaDiferenca Ddb1 (w1,o0,i2,i4);
diferencaCompleta Ddb2 (o2,o1,i3,w1,i1);
endmodule //--end difDoisBits



module guia0502;
reg a,b;
reg c,d;
wire o2,o1,o0;

difDoisBits Ddb(o2,o1,o0,a,b,c,d);

initial begin
$display("Felipe Pacifico -- 389868");
$display("Guia 0502");
$display("Diferença Completa de 2 bits");
$display("");

a=0; b=0; c=0; d=0;

$display("a  b   c  d   o2  o1  o0");
$monitor("%b  %b - %b  %b = %b  %b  %b", a, b, c, d, o2, o1, o0);

#1 d=1;
#1 c=1; d=0;
#1 c=1; d=1;
#1 b=1; c=0; d=0;
#1 d=1;
#1 c=1; d=0;
#1 d=1;
#1 a=1; b=0; c=0; d=0;
#1 d=1;
#1 d=0; c=1;
#1 d=1;
#1 b=1; c=0; d=0;
#1 d=1;
#1 d=0; c=1;
#1 d=1;
#1 $finish;

end
endmodule