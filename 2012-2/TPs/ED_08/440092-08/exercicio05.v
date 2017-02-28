// -------------------------
// Nome: Ailton Gomes 
// Matricula: 440092
// -------------------------
module dff ( output q, output qnot, 
input d, input clk, input clear, input preset ); 
reg q, qnot; 
always @( posedge clk or clear or preset  ) 
begin 
	if (clear)
		begin
			q <= 0; qnot <= 1; 
		end
		else if (preset)
		begin
			q <= 1; qnot <= 0; 
		end 
		else
		begin
			q <= d; qnot <= ~d;
		end
end
endmodule // dff 

module paralelo_serie;
reg clock, clear, preset;
reg a,b,c,d,e;
reg entrada;
wire q1,q2,q3,q4,q5;
wire qnot; //inutil
wire preset1, preset2, preset3,preset4,preset5;

and And1(preset1, preset, a);
and And2(preset2, preset, b);
and And3(preset3, preset, c);
and And4(preset4, preset, d);
and And5(preset5, preset, e);

dff DFF1 (q1, qnot, entrada, clock, clear, preset1);
dff DFF2 (q2, qnot, q1,clock, clear, preset2); 
dff DFF3 (q3, qnot, q2,clock,clear, preset3); 
dff DFF4 (q4, qnot, q3,clock,clear, preset4); 
dff DFF5 (q5, qnot, q4,clock,clear, preset5);

      initial 
        begin 
		  clock = 1;
		  entrada = 1;
		  a = 0;
		  b = 0;
		  c = 0;
		  d = 0;
		  e = 0;
		  clear = 0;
		  preset = 1;
#1 clear = 1;
#1 clear = 0;
  $display ( "%b\%b\%b\%b\%b", q1, q2, q3, q4, q5 );
  #1 clock = 0;
 #1 clock = 1;
  $display ( "%b\%b\%b\%b\%b", q1, q2, q3, q4, q5);
		  end
		  /*
		         always 
         #4 clock = ~clock; 

       always @( posedge clock ) 
        begin 
           $display ( "%b\%b\%b\%b\%b", q1, q2, q3, q4, q5 ); 
			end
			*/
			
endmodule