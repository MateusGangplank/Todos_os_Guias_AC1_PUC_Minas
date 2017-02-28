//------------------------
//Guia08 - Flip-flop tipo D
//Nome: Felipe Barros
//Matricula: 376508
//------------------------

module dff (output q, output qnot, input d, input clk,input clear );
reg q, qnot;

always @(posedge clk)
if(~clear)
begin
q<=0; qnot<=~q;
end
else
begin
q<=d;
qnot=~q;
end

endmodule // dff



