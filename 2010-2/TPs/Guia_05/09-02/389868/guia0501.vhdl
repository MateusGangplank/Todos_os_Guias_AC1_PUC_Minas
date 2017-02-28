//--Felipe Pacífico
//--Guia 0501

module meiasoma(o, o1, a, b);
input a, b;
output o, o1;
xor XOR1 (o,a,b);
and AND1 (o1,a,b);
endmodule //--end meiasoma



module somacompleta(o2, o4, a, b, c);
input a, b, c;
output  o2, o4;
wire o, o1, o3;
meiasoma MS1 (o, o1, a, b);
meiasoma MS2 (o2, o3, s, c);
or OR1 (o4, o1, o3);
endmodule  //--end somacompleta



module testsomacombits;
 reg   a, b, c, d, e ,f;
 wire  o, o1, o2, o3, o4, o5;
          
			 
			 //--instancia
meiasoma MS3(o,o1,c,f);
somacompleta SC1(o2, o3, o1, b, e);
somacompleta SC2(o4, o5, o3, a, d);


initial begin: start
a=0; b=0; c=0; d=0; e=0; f=0;
end
 
         
 initial begin : main
      $display("Felipe Pacifico -- 389868");
      $display("Guia 0501");     
		 $display("Soma com 3 bits ");
      $display("\n a b c + d e f =  s");
 	   $monitor("%b %b %b + %b %b %b = %b%b%b vai %b", a, b, c, d, e, f, o4, o2, o, o5);
 		
                 
                #1 a=0; b=0; c=0; d=0; e=0; f=1;
		#1 a=0; b=0; c=0; d=0; e=1; f=0;
		#1 a=0; b=0; c=0; d=0; e=1; f=1;
		#1 a=0; b=0; c=0; d=1; e=0; f=0;
		#1 a=0; b=0; c=0; d=1; e=0; f=1;
		#1 a=0; b=0; c=0; d=1; e=1; f=0;
		#1 a=0; b=0; c=0; d=1; e=1; f=1;
		#1 a=0; b=0; c=1; d=0; e=0; f=0;
		#1 a=0; b=0; c=1; d=0; e=0; f=1;
		#1 a=0; b=0; c=1; d=0; e=1; f=0;
		#1 a=0; b=0; c=1; d=0; e=1; f=1;
		#1 a=0; b=0; c=1; d=1; e=0; f=0;
		#1 a=0; b=0; c=1; d=1; e=0; f=1;
		#1 a=0; b=0; c=1; d=1; e=1; f=0;
		#1 a=0; b=0; c=1; d=1; e=1; f=1;
		#1 a=0; b=1; c=0; d=0; e=0; f=0;
		#1 a=0; b=1; c=0; d=0; e=0; f=1;
		#1 a=0; b=1; c=0; d=0; e=1; f=0;
		#1 a=0; b=1; c=0; d=0; e=1; f=1;
		#1 a=0; b=1; c=0; d=1; e=0; f=0;
		#1 a=0; b=1; c=0; d=1; e=0; f=1;
		#1 a=0; b=1; c=0; d=1; e=1; f=0;
		#1 a=0; b=1; c=0; d=1; e=1; f=1;
		#1 a=0; b=1; c=1; d=0; e=0; f=0;
		#1 a=0; b=1; c=1; d=0; e=0; f=1;
		#1 a=0; b=1; c=1; d=0; e=1; f=0;
		#1 a=0; b=1; c=1; d=0; e=1; f=1;
		#1 a=0; b=1; c=1; d=1; e=0; f=0;
		#1 a=0; b=1; c=1; d=1; e=0; f=1;
		#1 a=0; b=1; c=1; d=1; e=1; f=0;
		#1 a=0; b=1; c=1; d=1; e=1; f=1;
		#1 a=1; b=1; c=0; d=0; e=0; f=0;
		#1 a=1; b=0; c=0; d=0; e=0; f=1;
		#1 a=1; b=0; c=0; d=0; e=1; f=0;
		#1 a=1; b=0; c=0; d=0; e=1; f=1;
		#1 a=1; b=0; c=0; d=1; e=0; f=0;
		#1 a=1; b=0; c=0; d=1; e=0; f=1;
		#1 a=1; b=0; c=0; d=1; e=1; f=0;
		#1 a=1; b=0; c=0; d=1; e=1; f=1;
		#1 a=1; b=0; c=1; d=0; e=0; f=0;
		#1 a=1; b=0; c=1; d=0; e=0; f=1;
		#1 a=1; b=0; c=1; d=0; e=1; f=0;
		#1 a=1; b=0; c=1; d=0; e=1; f=1;
		#1 a=1; b=0; c=1; d=1; e=0; f=0;
		#1 a=1; b=0; c=1; d=1; e=0; f=1;
		#1 a=1; b=0; c=1; d=1; e=1; f=0;
		#1 a=1; b=0; c=1; d=1; e=1; f=1;
		#1 a=1; b=1; c=0; d=0; e=0; f=0;
		#1 a=1; b=1; c=0; d=0; e=0; f=1;
		#1 a=1; b=1; c=0; d=0; e=1; f=0;
		#1 a=1; b=1; c=0; d=0; e=1; f=1;
		#1 a=1; b=1; c=0; d=1; e=0; f=0;
		#1 a=1; b=1; c=0; d=1; e=0; f=1;
		#1 a=1; b=1; c=0; d=1; e=1; f=0;
		#1 a=1; b=1; c=0; d=1; e=1; f=1;
		#1 a=1; b=1; c=1; d=0; e=0; f=0;
		#1 a=1; b=1; c=1; d=0; e=0; f=1;
		#1 a=1; b=1; c=1; d=0; e=1; f=0;
		#1 a=1; b=1; c=1; d=0; e=1; f=1;
		#1 a=1; b=1; c=1; d=1; e=0; f=0;
		#1 a=1; b=1; c=1; d=1; e=0; f=1;
		#1 a=1; b=1; c=1; d=1; e=1; f=0;
		#1 a=1; b=1; c=1; d=1; e=1; f=1;
		
 end

endmodule //--end testsomacompleta

// OBS.: E OS ARQUIVOS .circ ?
//       SE POSSIVEL, DEIXAR OS ARQUIVOS COM EXTENSAO .v
