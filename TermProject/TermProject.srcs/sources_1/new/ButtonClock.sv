`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2019 02:27:01 AM
// Design Name: 
// Module Name: ButtonClock
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


module ButtonClock(input logic clk, buttonload,
                   output logic lateload);
    logic outt;
    logic [26:0] count = 27'd0;
    
    assign lateload = outt;
    
    always_ff@(posedge clk)
    begin
        outt <= 0;
        if(count < 27'd50000000 && buttonload == 1)
        begin
            count <= count + 1;
        end
        else if(buttonload == 0) begin
            count <= 0;
        end
        else if (buttonload == 1) begin
            outt <= 1;
            count <= 0;
        end
    end
    
endmodule
