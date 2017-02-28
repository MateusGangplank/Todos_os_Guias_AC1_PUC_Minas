// ------------------------- 
// Exercicio 0006 
// Nome: Miller 
// Matricula: 449048 
// -------------------------
// --------- XNOR ----------

module portaXNOR (output w, input y, input k);
assign w = ((~y&k)|(y&~k));
endmodule

module tester;
reg p, q;
wire w;

portaXNOR gogogo(w, p, q);

initial begin:start
p=0; q=0;
end

initial begin
$display("Miller - 449048");
$display("Porta XNOR");
$display(" ");
$monitor("( %b = %b' %b + %b %b')", w, p, q, p, q);

#1
#1 p=1;
#1 p=0; q=1;
#1 p=1;

end
endmodule

