`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2019 09:15:32 PM
// Design Name: 
// Module Name: ValueAssigner
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


module ValueAssigner(input logic clk, digit0, digit1, digit2, digit3, assignvalue0, assignvalue1, load,
                     output logic [3:0] value0, value1, value2, value3);
                     
    logic [3:0] temp0, temp1, temp2, temp3;
    
    assign value0 = temp0;
    assign value1 = temp1;
    assign value2 = temp2;
    assign value3 = temp3;
    
    
    always_ff @ (posedge clk)
    begin
        case({assignvalue1, assignvalue0})
            2'b00:
            begin
                if(load) begin
                    temp3[0] <= digit0;
                    temp3[1] <= digit1;
                    temp3[2] <= digit2;
                    temp3[3] <= digit3;
                end    
            end
            
            2'b01:
            begin
                if(load) begin
                    temp2[0] <= digit0;
                    temp2[1] <= digit1;
                    temp2[2] <= digit2;
                    temp2[3] <= digit3;
                end
            end
            
            2'b10:
            begin
                if(load) begin
                    temp1[0] <= digit0;
                    temp1[1] <= digit1;
                    temp1[2] <= digit2;
                    temp1[3] <= digit3;
                end
            end
            
            2'b11:
            begin
                if(load) begin
                    temp0[0] <= digit0;
                    temp0[1] <= digit1;
                    temp0[2] <= digit2;
                    temp0[3] <= digit3;
                end
            end
        endcase
    end
endmodule
