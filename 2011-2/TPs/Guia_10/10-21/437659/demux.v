module demux(y,a,b);
output y;

input a,b;
not(a_bar,a),(b_bar,b);
and(y,a_bar,b_bar);
endmodule