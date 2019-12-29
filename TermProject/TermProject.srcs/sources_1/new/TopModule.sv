`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2019 09:11:35 PM
// Design Name: 
// Module Name: TopModule
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


module TopModule(input clk, digit0, digit1, digit2, digit3, assignvalue0, assignvalue1, load, bits0, bits1, 
                        buttonload, restart, reset, butL, butR, butU, butD,
                 output a, b, c, d, e, f, g, dp, [3:0] an,
                 output [15:0] LED,
                 output [7:0] rowsOut,
                 output shcp, stcp, mr, oe, ds);
                 
    logic [3:0] value0, value1, value2, value3;
    logic lateload;
    logic[63:0] register;
    logic [7:0][7:0] temparray;
    
    
    ButtonClock mybuttonclock(clk, buttonload, lateload);
    ValueAssigner myAssigner(clk, digit0, digit1, digit2, digit3, assignvalue0, assignvalue1, load, value0, value1, value2, value3);
    SevenSegmentDisplay mydisplay(clk, value0, value1, value2, value3, a, b, c, d, e, f, g, dp, an);
    Register myregister(clk, bits0, bits1, lateload, value0, value1, value2, value3, LED, register);
    //module1 mod1( clk, register, temparray);
       
    always_comb begin
    temparray[7][7:0] = register[63:56];
    temparray[6][7:0] = register[55:48];
    temparray[5][7:0] = register[47:40];
    temparray[4][7:0] = register[39:32];
    temparray[3][7:0] = register[31:24];
    temparray[2][7:0] = register[23:16];
    temparray[1][7:0] = register[15:8];
    temparray[0][7:0] = register[7:0];
    end
    converter( clk, temparray, rowsOut, shcp, stcp, mr, oe, ds);
    //matrice mat1( clk, butL, butR, butU, butD, restart, temparray);
    
endmodule
