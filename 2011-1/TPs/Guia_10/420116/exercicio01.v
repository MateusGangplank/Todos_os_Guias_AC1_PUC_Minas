
module clock #(parameter delay = 1)
            (output reg SIGNAL);
    initial begin
        SIGNAL = 0;
    end
    always begin
        #(delay) SIGNAL = ~SIGNAL;
    end
endmodule

module mealy_fsm(input A, input CLK,
                output S);
    reg [1:0] FF;
    
    assign S = ~A & FF[1] & ~FF[0];
    
    initial begin
        FF = 0;
    end
    always @ (posedge CLK) begin
        FF[0] = FF[1];
        #1 FF[1] = A;
    end
endmodule

module testbench();
    wire CLK_SIG;
    reg A;
    wire S;
    
    clock #(5) CLOCK(CLK_SIG);
    mealy_fsm FSM(A, CLK_SIG, S);
    
    initial begin
        $monitor("A = %b; S = %b; FSM:%b; CLOCK = %b;", A, S, FSM.FF, CLK_SIG);
        A = 0;
        #10 A = 1;
        #10 A = 0;
        #30 $finish;
    end
endmodule