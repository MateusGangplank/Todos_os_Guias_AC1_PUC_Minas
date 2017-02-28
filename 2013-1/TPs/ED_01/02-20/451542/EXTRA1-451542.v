//--------------------------------
// EXTRA 1
//--------------------------------

module norG8(output s, input a, input b, input c, input d, input e, input f, input g, input h);
assign s = ~(a|b|c|d|e|f|g|h);

endmodule

module testnorG8;
reg [7:0]count;
reg a, b, c, d, e, f, g, h;
wire s;

norG8 NOR1(s, a, b, c, d,	e ,f ,g, h);

initial begin:start
count=0;
a=0;b=0;c=0;
d=0;e=0;f=0;
g=0;h=0;

end

initial begin

$display("~(a | b | c | d | e | f | g | h = s)");
$monitor("(%b | %b | %b | %b | %b | %b | %b | %b |= %b)", a, b, c, d, e, f, g, h, s);

count = 0; 

	repeat (255) begin
				count <= count + 1;
				#1 a<=count[7];b<=count[6];c<=count[5];d<=count[4];e<=count[3];f<=count[2];g<=count[1];h<=count[0];
				
	end

end

endmodule