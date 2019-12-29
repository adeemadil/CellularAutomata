`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2019 10:04:03 PM
// Design Name: 
// Module Name: Register
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


module Register( input logic clk, bits0, bits1, buttonload,
                 input logic [3:0] value0, value1, value2, value3,
                 output logic [15:0] led, output logic[63:0] register);
                 
    logic [63:0] tempregister;
    logic [15:0] templed;
    
    assign led = templed;
    assign register = tempregister;
    
    always_ff@(posedge clk)
    begin
        case({bits1, bits0, buttonload})
        3'b001:
        begin
            tempregister[63:60] <= value3;
            tempregister[59:56] <= value2;
            tempregister[55:52] <= value1;
            tempregister[51:48] <= value0;
        end
        
        3'b011:
        begin
            tempregister[47:44] <= value3;
            tempregister[43:40] <= value2;
            tempregister[39:36] <= value1;
            tempregister[35:32] <= value0;
        end
        
        3'b101:
        begin
            tempregister[31:28] <= value3;
            tempregister[27:24] <= value2;
            tempregister[23:20] <= value1;
            tempregister[19:16] <= value0;
        end
        
        3'b111:
        begin
            tempregister[15:12] <= value3;
            tempregister[11:8] <= value2;
            tempregister[7:4] <= value1;
            tempregister[3:0] <= value0;
        end
        endcase
    end
    
    always_ff@(posedge clk)
    begin
        case({bits1, bits0})
        2'b00:
        begin
            templed <= tempregister[63:48];
        end
        
        2'b01:
        begin
            templed <= tempregister[47:32];
        end
        
        2'b10:
        begin
            templed <= tempregister[31:16];
        end
        
        2'b11:
        begin
            templed <= tempregister[15:0];
        end
        endcase
    end
    
endmodule
