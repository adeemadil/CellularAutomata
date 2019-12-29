`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/28/2019 09:05:59 PM
// Design Name: 
// Module Name: module1
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


module module1(input clk, input logic[63:0] data_in, output logic[7:0][7:0] data_out);    
    
    logic[63:0] tempdata_in;
    logic[7:0][7:0] tempdata_out;
    assign tempdata_in = data_in;
    
  always_ff@(posedge clk) begin
    for(int k =0; k<8; k++)
    for(int j=0; j<8; j++)begin
        tempdata_out[k][j] = tempdata_in;        
    end
    end
    
  assign data_out = tempdata_out;
  
endmodule
