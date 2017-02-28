// -------------------------

// Nome: Lucas Siqueira Chagas 
// Matricula: 380783
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
// -------------------------------

		 module deslocamentoEsq;
         reg clk, clear, preset;
         wire [4:0]q;
		   wire [4:0]qnot;

        dff DFF1 (q[0], qnot[0], qnot[4], clk, clear,preset);
        dff DFF2 (q[1], qnot[1], q[0],clk, clear,preset);
        dff DFF3 (q[2], qnot[2], q[1],clk,clear,preset);
        dff DFF4 (q[3], qnot[3], q[2],clk,clear,preset);
		  dff DFF5 (q[4], qnot[4], q[3],clk,clear,preset);

// -------------------------------

       initial
        begin



       // initial values
          clk = 0;
			  preset = 0;
			 clear = 1;
			 clk = ~clk;
			#1 clear = ~clear;
			



	       #80 $finish;
        end // initial

       always
          #5 clk = ~clk;

       always @( posedge clk )
        begin
           $display ( "%b\%b\%b\%b", q[3],q[2],q[1],q[0] );
        end // always at positive edge clocking changing

    endmodule // deslocamentoEsq
