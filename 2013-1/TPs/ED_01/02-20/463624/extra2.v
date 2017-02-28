// Nome: Mateus Cunha da Silva
// Matricula: 463624
// ---------------------
// ---------------------
// 
// ---------------------
module extra(output s,
            input  [0:7] p);
assign s = (((((((p[0] & p[1]) & p[2]) & p[3]) & p[4]) & p[5]) & p[6]) & p[7]);
endmodule

module teste;

reg a[0:7];
wire s;
reg cont;

extra ex();

initial begin:start

a[0] = 0;
a[1] = 0;
a[2] = 0;
a[3] = 0;
a[4] = 0;
a[5] = 0;
a[6] = 0;
a[7] = 0;
cont = 0;

end

initial begin:main
    $display("Extra2 - Mateus Cunha da Silva - 463624");
    $display("Tabela ");
    
    $monitor(" %b  %b  %b  %b  %b  %b  %b  %b = %b ", a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0], s);
 	repeat (15) begin
   count <= count + 1;
	
     #1 a[7]<=count[7]; a[6]<=count[6]; a[5]<=count[5]; a[4]<=count[3]; a[2]<=count[1]; a[0]<=count[0];
end
endmodule