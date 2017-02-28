
module clock #(parameter delay = 5)
            (output reg SIGNAL);
    initial begin
        SIGNAL = 0;
    end
    always begin
        #(delay) SIGNAL = ~SIGNAL;
    end
endmodule

module moore_fsm(input A, input CLK,
                output reg S);
    reg [3:0] FF;
    reg [1:0] COUNTER;
    
    initial begin
        FF = 4'b1111;
        S = 0;
        COUNTER = 0;
    end
    always @ (posedge CLK) begin
        COUNTER = COUNTER + 1;
        FF[0] = FF[1];
        #1 FF[1] = FF[2];
        #1 FF[2] = FF[3];
        #1 FF[3] = A;
        #1 S = FF == 4'b0110 ? 1 : 0;
    end
    always @ (negedge CLK) begin
        if (COUNTER == 0)
            FF = 4'b1111;
    end
endmodule

module testbench();
    reg A;
    wire S, CLK_SIG;
    
    clock CLOCK(CLK_SIG);
    moore_fsm FSM(A, CLK_SIG, S);
    
    initial begin
        $monitor("A = %b; S = %b; FSM:%b; CLOCK = %b;", A, S, FSM.FF, CLK_SIG);
        A = 0;
        #10 A = 1;
        #10 A = 1;
        #10 A = 0;
        #10 A = 1;
        #10 A = 1;
        #10 A = 0;
        #30 $finish;
    end
endmodule