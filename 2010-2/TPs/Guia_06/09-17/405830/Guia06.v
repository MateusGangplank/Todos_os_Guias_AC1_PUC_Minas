// ---------------------
// Guia06
// Nome: Pedro Siqueira
// Matricula: 405830
// ---------------------
module meiasoma(s, s1, a, b);
input a, b;
output s, s1;
xor XOR1 (s,a,b);
and AND1 (s1,a,b);
endmodule//meiasoma
module somacompleta(s2, s4, a, b, c);
input a, b, c;
output  s2, s4;
wire s, s1, s3;
meiasoma MS1 (s, s1, a, b);
meiasoma MS2 (s2, s3, s, c);
or OR1 (s4, s1, s3);
endmodule//somacompleta
module somacom4bits(s,s1,s2,s3,a1,a2,a3,a4,b1,b2,b3,b4);
input a1,a2,a3,a4,b1,b2,b3,b4;
output s,s1,s2,s3;
wire s4,s5,s6;
meiasoma MS1(s,s4,a1,b1);
somacompleta SC1(s1,s5,s4,a2,b2);
somacompleta SC2(s2,s6,s5,a3,b3);
somacompleta SC3(s3,s7,s6,a4,b4);
endmodule//somacomquatrobits
module comparador(s,a1,a2,a3,a4,b1,b2,b3,b4);
input a1,a2,a3,a4,b1,b2,b3,b4;
output s;
wire s1,s2,s3,s4,s5,s6;
xor  XOR1 (s1,a1,b1);
xor  XOR2 (s2,a2,b2);
xor  XOR3 (s3,a3,b3);
xor  XOR4 (s4,a4,b4);
or   OR1 (s5,s1,s2);
or   OR2 (s6,s3,s4);
or   OR3 (s,s5,s6);
endmodule//comparador
module complemento2(s,s1,s2,s3,a1,a2,a3,a4);
input a1,a2,a3,a4;
output s,s1,s2,s3;
wire s4,s5,s6,s7;
not  NOT1 (s4,a1);  
not  NOT2 (s5,a2);
not  NOT3 (s6,a3);
not  NOT3 (s7,a4);
somacom4bits SCB1 (s,s1,s2,s3,s4,s5,s6,s7,1,1,1,1);
endmodule
module main;
initial begin: start
end
 
          // parte principal
 initial begin : main
      $display("Guia06 - Pedro Siqueira - 405830");
      $display(" ");
      $display("");
 	   $monitor("");
		end
endmodule
