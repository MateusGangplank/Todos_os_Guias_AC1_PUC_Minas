// ------------------------- 
// Exercicio 0008 
// Nome: Miller 
// Matricula: 449048 
// -------------------------
// -------- AND 3 ----------

module ANDtriplo(output u, input h, input j, input o);
assign u = (h&j&o);
endmodule

module novo;
reg a, b, c;
wire u;

ANDtriplo pendrive(u, a, b, c);
initial begin:start
a=0; b=0; c=0;
end

initial begin

$display("Miller - 449048");
$display("Porta AND com 3 entradas");
$display(" ");

$monitor(" %b & %b & %b = %b", a, b, c, u);

#1
#1 a=1;
#1 a=0; b=1;
#1 a=0; b=0; c=1;
#1 a=1; b=1; c=0;
#1 a=1; b=0; c=1;
#1 a=0; b=1; c=1;
#1 a=1; b=1; c=1;

end
endmodule
