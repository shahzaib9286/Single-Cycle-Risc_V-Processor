`timescale 1ns / 1ps

`timescale 1ns / 1ps

module tb_top;

    reg clk;
    reg rst;
    
    wire [31:0] pc;
    wire [31:0] insn;

    top uut (.clk(clk), .rst(rst), .pc(pc), .insn(insn));

    always begin
        #5 clk = ~clk;
    end

    initial begin
        
        clk = 0;
        rst = 1; 

        uut.data_m.memory[0] = 8'h2A; // LSB
        uut.data_m.memory[1] = 8'h00;
        uut.data_m.memory[2] = 8'h00;
        uut.data_m.memory[3] = 8'h00; // MSB

        #15;
        rst = 0; 

        $monitor("Time: %0t | PC: %d | INSN: %h | ALU_Out: %d | RegWrite: %b | ResultSrc: %b", 
                  $time, pc, insn, uut.ALU_result_wire, uut.reg_write_to_reg_file, uut.ResultSrc_to_mux3);

        #100;

        $finish;
    end

endmodule