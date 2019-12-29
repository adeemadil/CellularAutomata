`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2019 05:53:39 AM
// Design Name: 
// Module Name: matrice
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


module matrice( input clk, butL, butR, butU, butD, restart,
                input[7:0][7:0]array,
                output[7:0][7:0] arrayOut);
                
    logic[63:0] temparray;
    logic[7:0][7:0] array_out;
//    logic[7:0][7:0] array_out;
    int a;
    
    assign temparray = array;
    
    //always@(posedge clk) begin
    always@* begin
    if( butL)
        a = 1;
    else if( butR)
        a = 2;
    else if( butU)
        a = 3;
    else
        a = 4;
    
    case(a)
    1: begin    
        fsm(clk, restart, array[0][7], array[0][1], array[7][0], array[1][0], temparray, array_out, array[0][0]);
        fsm(clk, restart, array[0][1], array[0][3], array[7][2], array[1][2], temparray, array_out, array[0][2]);
        fsm(clk, restart, array[0][3], array[0][5], array[7][4], array[1][4], temparray, array_out, array[0][4]);
        fsm(clk, restart, array[0][5], array[0][7], array[7][6], array[1][6], temparray, array_out, array[0][6]);
        
        fsm(clk, restart, array[2][7], array[2][1], array[1][0], array[3][0], temparray, array_out, array[2][0]);
        fsm(clk, restart, array[2][1], array[2][3], array[1][2], array[3][2], temparray, array_out, array[2][2]);
        fsm(clk, restart, array[2][3], array[2][5], array[1][4], array[3][4], temparray, array_out, array[2][4]);
        fsm(clk, restart, array[2][5], array[2][7], array[1][6], array[3][6], temparray, array_out, array[2][6]);
        
        fsm(clk, restart, array[5][0], array[5][2], array[4][1], array[6][1], temparray, array_out, array[5][1]);
        fsm(clk, restart, array[5][2], array[5][4], array[4][3], array[6][3], temparray, array_out, array[5][3]);
        fsm(clk, restart, array[5][3], array[5][5], array[4][4], array[6][4], temparray, array_out, array[5][4]);
        fsm(clk, restart, array[5][5], array[5][7], array[4][6], array[6][6], temparray, array_out, array[5][6]);
                                                                                                                 
        fsm(clk, restart, array[7][0], array[7][2], array[6][1], array[1][0], temparray, array_out, array[7][1]);
        fsm(clk, restart, array[7][2], array[7][4], array[6][3], array[1][0], temparray, array_out, array[7][3]);
        fsm(clk, restart, array[7][3], array[7][5], array[6][4], array[1][0], temparray, array_out, array[7][4]);
        fsm(clk, restart, array[7][5], array[7][7], array[6][6], array[1][0], temparray, array_out, array[7][6]);                                                                                                             
    end
    2: begin
        fsm(clk, restart, array[0][0], array[0][1], array[7][1], array[1][1], temparray, array_out, array[0][1]);
        fsm(clk, restart, array[0][2], array[0][4], array[7][3], array[1][3], temparray, array_out, array[0][3]);
        fsm(clk, restart, array[0][4], array[0][6], array[7][5], array[1][5], temparray, array_out, array[0][5]);
        fsm(clk, restart, array[0][6], array[0][0], array[7][7], array[1][7], temparray, array_out, array[0][7]);
        
        fsm(clk, restart, array[2][7], array[2][0], array[1][0], array[3][1], temparray, array_out, array[2][1]);
        fsm(clk, restart, array[2][1], array[2][2], array[1][2], array[3][3], temparray, array_out, array[2][3]);
        fsm(clk, restart, array[2][3], array[2][4], array[1][5], array[3][5], temparray, array_out, array[2][5]);
        fsm(clk, restart, array[0][6], array[0][0], array[1][7], array[3][7], temparray, array_out, array[2][7]);
        
        fsm(clk, restart, array[5][7], array[5][1], array[4][0], array[6][0], temparray, array_out, array[5][0]);
        fsm(clk, restart, array[5][2], array[5][4], array[4][2], array[6][3], temparray, array_out, array[5][2]);
        fsm(clk, restart, array[5][3], array[5][5], array[4][5], array[6][6], temparray, array_out, array[5][5]);
        fsm(clk, restart, array[5][5], array[5][7], array[4][7], array[6][7], temparray, array_out, array[5][7]);
                                                                                                                 
        fsm(clk, restart, array[7][7], array[7][1], array[6][0], array[0][0], temparray, array_out, array[7][0]);
        fsm(clk, restart, array[7][1], array[7][3], array[6][2], array[0][2], temparray, array_out, array[7][2]);
        fsm(clk, restart, array[7][4], array[7][6], array[6][5], array[0][5], temparray, array_out, array[7][5]);
        fsm(clk, restart, array[7][6], array[7][0], array[6][7], array[0][7], temparray, array_out, array[7][7]);
        
    end
    3: begin
        fsm(clk, restart, array[1][7], array[1][1], array[0][0], array[2][0], temparray, array_out, array[1][0]);
        fsm(clk, restart, array[1][1], array[1][3], array[0][2], array[2][2], temparray, array_out, array[1][2]);
        fsm(clk, restart, array[1][3], array[1][5], array[0][4], array[2][4], temparray, array_out, array[1][4]);
        fsm(clk, restart, array[1][5], array[1][7], array[0][6], array[2][6], temparray, array_out, array[1][6]);
        
        fsm(clk, restart, array[3][7], array[3][1], array[2][0], array[4][0], temparray, array_out, array[3][0]);
        fsm(clk, restart, array[3][1], array[3][3], array[2][2], array[4][2], temparray, array_out, array[3][2]);
        fsm(clk, restart, array[3][3], array[3][5], array[2][4], array[4][4], temparray, array_out, array[3][4]);
        fsm(clk, restart, array[3][5], array[3][7], array[2][6], array[4][6], temparray, array_out, array[3][6]);
        
        fsm(clk, restart, array[4][7], array[4][1], array[3][0], array[5][0], temparray, array_out, array[4][0]);
        fsm(clk, restart, array[4][1], array[4][3], array[3][2], array[5][2], temparray, array_out, array[4][2]);
        fsm(clk, restart, array[4][4], array[4][6], array[3][5], array[5][5], temparray, array_out, array[4][5]);
        fsm(clk, restart, array[4][6], array[4][0], array[3][7], array[5][7], temparray, array_out, array[4][7]);
                                                                                                                 
        fsm(clk, restart, array[6][7], array[6][1], array[5][0], array[7][0], temparray, array_out, array[6][0]);
        fsm(clk, restart, array[6][1], array[6][3], array[5][2], array[7][2], temparray, array_out, array[6][2]);
        fsm(clk, restart, array[6][4], array[6][6], array[5][5], array[7][5], temparray, array_out, array[6][5]);
        fsm(clk, restart, array[6][6], array[6][0], array[5][7], array[7][7], temparray, array_out, array[6][7]);
        
    end
    4: begin
        //fsm(clk, restart, west, east, north, south, temparray, array_out, centre);
        
        fsm(clk, restart, array[1][0], array[1][2], array[7][1], array[2][1], temparray, array_out, array[1][1]);
        fsm(clk, restart, array[1][2], array[1][4], array[7][3], array[2][3], temparray, array_out, array[1][3]);
        fsm(clk, restart, array[1][4], array[1][6], array[7][5], array[2][5], temparray, array_out, array[1][5]);
        fsm(clk, restart, array[1][6], array[1][0], array[7][7], array[2][7], temparray, array_out, array[1][7]);
        
        fsm(clk, restart, array[3][7], array[3][0], array[2][1], array[4][1], temparray, array_out, array[3][1]);
        fsm(clk, restart, array[3][1], array[3][2], array[2][3], array[4][3], temparray, array_out, array[3][3]);
        fsm(clk, restart, array[3][3], array[3][4], array[2][5], array[4][5], temparray, array_out, array[3][5]);
        fsm(clk, restart, array[3][6], array[3][0], array[2][7], array[4][7], temparray, array_out, array[3][7]);
        
        fsm(clk, restart, array[4][0], array[4][2], array[3][1], array[5][1], temparray, array_out, array[4][1]);
        fsm(clk, restart, array[4][2], array[4][4], array[3][3], array[5][3], temparray, array_out, array[4][3]);
        fsm(clk, restart, array[4][3], array[4][5], array[3][4], array[5][4], temparray, array_out, array[4][4]);
        fsm(clk, restart, array[4][5], array[4][7], array[3][6], array[5][6], temparray, array_out, array[4][6]);
                                                                                                                 
        fsm(clk, restart, array[6][0], array[6][2], array[5][1], array[7][1], temparray, array_out, array[6][1]);
        fsm(clk, restart, array[6][2], array[6][4], array[5][3], array[7][3], temparray, array_out, array[6][3]);
        fsm(clk, restart, array[6][3], array[6][5], array[5][4], array[7][4], temparray, array_out, array[6][4]);
        fsm(clk, restart, array[6][5], array[6][7], array[5][6], array[7][6], temparray, array_out, array[6][6]);
    end
    endcase
    end
    assign arrayOut = array_out;
endmodule
