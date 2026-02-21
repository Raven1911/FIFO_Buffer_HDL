`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2025 06:00:51 PM
// Design Name: 
// Module Name: fifo_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo_tb();

    localparam ADDR_WIDTH = 3;
    localparam DATA_WIDTH = 8;
    localparam T = 10; //clock period

    reg clk, reset_n;
    reg wr, rd;

    reg [DATA_WIDTH - 1 : 0] w_data; //writing data

    wire [DATA_WIDTH - 1 : 0] r_data; //reading data
    wire full, empty;
    wire [ADDR_WIDTH - 1 : 0] wr_ptr, rd_ptr;

    //instantiate module under test
    fifo_unit #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) uut(
        .clk(clk), 
        .reset_n(reset_n),
        .wr(wr), 
        .rd(rd),
        .wr_ptr(wr_ptr),
        .rd_ptr(rd_ptr),
        .w_data(w_data),
        .r_data(r_data),

        .full(full),
        .empty(empty)
    );

    initial begin
        clk = 0;
        forever begin
            #(T/2) clk = ~clk;
        end
    end
    
    // reset for the first half cylce
    initial begin
        reset_n = 1'b0;
        rd = 1'b0;
        wr = 1'b0;
        @(negedge clk);
        reset_n = 1'b1;
    end
    
    //test 
    initial begin
        //-----------empty-----------
        //write
        @(negedge clk);
        w_data = 'd5;
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;

        //write
        repeat(1)@(negedge clk);
        w_data = 'd8;
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;

        //write
        repeat(1)@(negedge clk);
        w_data = 'd2;
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;

        //read
        repeat(1)@(negedge clk);
        rd = 1'b1;
        @(negedge clk);
        rd = 1'b0;

        //write
        repeat(1)@(negedge clk);
        w_data = 'd0;
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;

        //write
        repeat(1)@(negedge clk);
        w_data = 'd9;
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;

        //write
        repeat(1)@(negedge clk);
        w_data = 'd3;
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;

        //write
        repeat(1)@(negedge clk);
        w_data = 'd6;
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;

        //write
        repeat(1)@(negedge clk);
        w_data = 'd1;
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;

        //write
        repeat(1)@(negedge clk);
        w_data = 'd3;
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;
        
        //--------FULL-----------
        //read
        repeat(1)@(negedge clk);
        rd = 1'b1;
        @(negedge clk);
        rd = 1'b0;

        //read
        repeat(1)@(negedge clk);
        rd = 1'b1;
        @(negedge clk);
        rd = 1'b0;

        //read
        repeat(1)@(negedge clk);
        rd = 1'b1;
        @(negedge clk);
        rd = 1'b0;

        //read
        repeat(1)@(negedge clk);
        rd = 1'b1;
        @(negedge clk);
        rd = 1'b0;

        //read
        repeat(1)@(negedge clk);
        rd = 1'b1;
        @(negedge clk);
        rd = 1'b0;

        //read
        repeat(1)@(negedge clk);
        rd = 1'b1;
        @(negedge clk);
        rd = 1'b0;

        //read
        repeat(1)@(negedge clk);
        rd = 1'b1;
        @(negedge clk);
        rd = 1'b0;

        //read
        repeat(1)@(negedge clk);
        rd = 1'b1;
        @(negedge clk);
        rd = 1'b0;

        //write & read
        repeat(1)@(negedge clk);
        w_data = 'd7;
        wr = 1'b1;
        rd = 1'b1;
        @(negedge clk);
        wr = 1'b0;
        rd = 1'b0;

        //write & read
        repeat(1)@(negedge clk);
        w_data = 'd5;
        wr = 1'b1;
        rd = 1'b1;
        @(negedge clk);
        wr = 1'b0;
        rd = 1'b0;
        
        //read /// test 1 empty = 1 
        repeat(1)@(negedge clk);
        rd = 1'b1;
        @(negedge clk);
        rd = 1'b0;
        
        ////write
         //write
        repeat(1)@(negedge clk);
        w_data = 'd0;
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;

        //write
        repeat(1)@(negedge clk);
        w_data = 'd120;
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;

        //write & read
        repeat(1)@(negedge clk);
        w_data = 'd10;
        wr = 1'b1;
        rd = 1'b1;
        @(negedge clk);
        wr = 1'b0;
        rd = 1'b0;

        //write & read
        repeat(1)@(negedge clk);
        w_data = 'd9;
        wr = 1'b1;
        rd = 1'b1;
        @(negedge clk);
        wr = 1'b0;
        rd = 1'b0;

        //write
        repeat(1)@(negedge clk);
        w_data = 'd20;
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;

        //write
        repeat(1)@(negedge clk);
        w_data = 'd30;
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;

        //write
        repeat(1)@(negedge clk);
        w_data = 'd55;
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;

        //write
        repeat(1)@(negedge clk);
        w_data = 'd16;
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;

        //write
        repeat(1)@(negedge clk);
        w_data = 'd175;
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;

        //write
        repeat(1)@(negedge clk);
        w_data = 'd111;
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;

        $stop;

    end




    
endmodule
