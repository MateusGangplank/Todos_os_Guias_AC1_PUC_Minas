  // FAVOR COLOCAR NOME E MATRICULA

module clock #(parameter delay = 5)
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
    reg [2:0] FF;
                                        // SE POSSIVEL, USAR PORTAS
    assign S = A & ~FF[2] & FF[1] & ~FF[0];
    
    initial begin
        FF = 0;
    end
    always @ (posedge CLK) begin
        FF[0] = FF[1];
        #1 FF[1] = FF[2];
        #1 FF[2] = A;
    end
endmodule

module testbench();
    reg A;
    wire S, CLK_SIG;
    
    clock CLOCK(CLK_SIG);
    mealy_fsm FSM(A, CLK_SIG, S);
    
    initial begin
        $dumpvars;
        A = 1;
        #10 A = 0;
        #10 A = 1;
        #10 A = 0;
        #10 A = 1;
        #10 A = 0;
        #10 A = 0;
        #30 $finish;
    end
endmodule