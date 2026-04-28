module testbench();

logic clk;
logic reset;
logic [31:0] WriteData, DataAdr;
logic MemWrite;

// instantiate device
top dut(clk, reset, WriteData, DataAdr, MemWrite);

// initialize
initial begin
    clk = 0;
    reset = 1;
    #20;
    reset = 0;
end

// clock
always begin
    #5 clk = ~clk;
end

// check
always @(negedge clk) begin
    if (MemWrite) begin
        if (DataAdr === 100 && WriteData === 25) begin
            $display("Simulation succeeded");
            $stop;
        end 
        else if (DataAdr !== 96) begin
            $display("Simulation failed");
            $stop;
        end
    end
end

endmodule