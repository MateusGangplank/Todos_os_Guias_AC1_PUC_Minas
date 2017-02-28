// Nome: Andre Sulivam 391998
// Guia 05 ex02

module meiaDiferenca(s0,s1,e1,e2);
output s0,s1;
input e1,e2;

xor Xor1(s0,e1,e2);
and And1(s1,~e1,e2);
endmodule // end meiaDiferenca



module diferencaCompleta (s0,s1,e1,e2,e3);
output s0,s1;
input e1,e2,e3;
wire  w1,w2,w3;

meiaDiferenca Md1(w1,w2,e1,e2);
meiaDiferenca Md2(s0,w3,e3,w1);
or And1(s1,w2,w3);
endmodule  // end diferencaCompleta



module difDoisBits(s0,s1,s2,e1,e2,e3,e4);
output s0,s1,s2;
input e1,e2,e3,e4;
wire w1;
meiaDiferenca Ddb1 (w1,s0,e2,e4);
diferencaCompleta Ddb2 (s2,s1,e3,w1,e1);
endmodule // end difDoisBits



module guia0502;
reg a,b;
reg c,d;
wire s2,s1,s0;

difDoisBits Ddb(s2,s1,s0,a,b,c,d);

initial begin
$display("Andre Sulivam 391998");
      $display("Guia 05 Ex:02");
$display("Diferença Completa de 2 bits");
$display("");

a=0; b=0; c=0; d=0;

$display("a  b   c  d   s2  s1  s0");
$monitor("%b  %b - %b  %b = %b  %b  %b", a, b, c, d, s2, s1, s0);

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