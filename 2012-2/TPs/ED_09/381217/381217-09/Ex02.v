//------------------------------------
//--- Andre Campolina
//--- 381217
//------------------------------------

//------Modulo Flip Flop JK

module jk(output q, output qn, input j, input k, input clock, input set, input clear);
reg q, qn;
always @ (posedge clock)
begin
	if(~clear)
	begin
		if(~set)
		begin		
			if ( j & ~k ) 
				begin 
				q <= 1; 
				qnot <= 0; 
				end 
				else 
				if ( ~j & k ) 
				begin 
				q <= 0; 
				qnot <= 1; 
				end 
				else 
				if ( j & k ) 
				begin 
				q <= ~q; 
				qnot <= ~qnot; 
			end 
		end
	end
end

endmodule // jk

module Ex01;
reg[4:0] cont;
reg pulse;
reg clear;
reg i;

wire w1, w2, w3, w4, w5;

jk ff1(w1,cont[0],i,i,pulse,0,clear);
jk ff2(w2,cont[1],i,i,w1,0,clear);
jk ff3(w3,cont[2],i,i,w2,0,clear);
jk ff4(w4,cont[3],i,i,w3,0,clear);
jk ff5(w5,cont[4],i,i,w4,0,clear);

always
#5 pulse = ~pulse;begin

initial begin
$display("Andre Campolina - 381217");
pulse = 0;
clear = 1;
i = 1;
#15 clear = 0;

end




endmodule