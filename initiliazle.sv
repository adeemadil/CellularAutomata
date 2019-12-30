`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2019 06:36:10 PM
// Design Name: 
// Module Name: initialize
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


module initialize(input clk, butL, butR, butU, butD, restart, west, east, north, south,
                input[63:0] register,
                output[7:0][7:0] arrayOut, output centre);
                
   // logic[63:0] temparray;
    logic[7:0][7:0] array_out;
//    logic[7:0][7:0] array_out;
    int a, count = 0;
    
//    assign temparray = array;
    
    logic[7:0][7:0] array1 = {{1'b1, 1'b0, 1'b1,1'b0, 1'b1, 1'b0, 1'b1, 1'b0},
                              {1'b0, 1'b0, 1'b0,1'b0, 1'b0, 1'b0, 1'b0, 1'b0},
                              {1'b1, 1'b0, 1'b1,1'b0, 1'b1, 1'b0, 1'b1, 1'b0},
                              {1'b0, 1'b0, 1'b0,1'b0, 1'b0, 1'b0, 1'b0, 1'b0},
                              {1'b0, 1'b0, 1'b0,1'b0, 1'b0, 1'b0, 1'b0, 1'b0},
                              {1'b0, 1'b1, 1'b0,1'b1, 1'b1, 1'b0, 1'b1, 1'b0},
                              {1'b0, 1'b0, 1'b0,1'b0, 1'b0, 1'b0, 1'b0, 1'b0},
                              {1'b0, 1'b1, 1'b0,1'b1, 1'b1, 1'b0, 1'b1, 1'b0}};
                              
    logic[7:0][7:0] array2 = {{1'b0, 1'b1, 1'b0,1'b1, 1'b0, 1'b1, 1'b0, 1'b1},
                              {1'b0, 1'b0, 1'b0,1'b0, 1'b0, 1'b0, 1'b0, 1'b0},
                              {1'b0, 1'b1, 1'b0,1'b1, 1'b0, 1'b1, 1'b0, 1'b1},
                              {1'b0, 1'b0, 1'b0,1'b0, 1'b0, 1'b0, 1'b0, 1'b0},
                              {1'b0, 1'b0, 1'b0,1'b0, 1'b0, 1'b0, 1'b0, 1'b0},
                              {1'b1, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1},
                              {1'b0, 1'b0, 1'b0,1'b0, 1'b0, 1'b0, 1'b0, 1'b0},
                              {1'b1, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1}};
    
    logic[7:0][7:0] array3 = {{1'b0, 1'b0, 1'b0,1'b0, 1'b0, 1'b0, 1'b0, 1'b0},
                              {1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0},
                              {1'b0, 1'b0, 1'b0,1'b0, 1'b0, 1'b0, 1'b0, 1'b0},
                              {1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0},
                              {1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1},
                              {1'b0, 1'b0, 1'b0,1'b0, 1'b0, 1'b0, 1'b0, 1'b0},
                              {1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1},
                              {1'b0, 1'b0, 1'b0,1'b0, 1'b0, 1'b0, 1'b0, 1'b0}};
    
    logic[7:0][7:0] array4 = {{1'b0, 1'b0, 1'b0,1'b0, 1'b0, 1'b0, 1'b0, 1'b0},
                              {1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1},
                              {1'b0, 1'b0, 1'b0,1'b0, 1'b0, 1'b0, 1'b0, 1'b0},
                              {1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1},
                              {1'b0, 1'b1, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, 1'b0},
                              {1'b0, 1'b0, 1'b0,1'b0, 1'b0, 1'b0, 1'b0, 1'b0},
                              {1'b0, 1'b1, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, 1'b0},
                              {1'b0, 1'b0, 1'b0,1'b0, 1'b0, 1'b0, 1'b0, 1'b0}};
    logic cState;   
    logic[7:0][7:0] temparray;            
    logic state = {west, east, north, south};
    logic tempWest, tempEast, tempNorth, tempSouth;
    logic tempState = {tempWest, tempEast, tempNorth, tempSouth};
//    logic centre;    
    //fsm fsm1(clk, restart, array[0][7], array[0][1], array[7][0], array[1][0], temparray, array_out, array[0][0]);   
    
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
    end
    
    always @(posedge clk)
   //always@*
      if (restart) begin
        
    temparray[7][7:0] = register[63:56];
    temparray[6][7:0] = register[55:48];
    temparray[5][7:0] = register[47:40];
    temparray[4][7:0] = register[39:32];
    temparray[3][7:0] = register[31:24];
    temparray[2][7:0] = register[23:16];
    temparray[1][7:0] = register[15:8];
    temparray[0][7:0] = register[7:0];
    
      end
      else
    case(a)
    1: begin    
        for(int k = 0; k<8; k++)
        for(int j = 0; j<0; j++)begin
            if( array1[k][j] == 1)begin
                if(k==0 && j==0)begin
                tempWest = temparray[0][7];
                tempEast = temparray[0][1];
                tempNorth = temparray[7][0];
                tempSouth = temparray[1][0];
                if (k==0 && j==2)begin
                tempWest = temparray[0][1];
                tempEast = temparray[0][3];
                tempNorth = temparray[7][2];
                tempSouth = temparray[1][2];    
                end
                if(k==0 && j==4)begin
                tempWest = temparray[0][3];
                tempEast = temparray[0][5];
                tempNorth = temparray[7][4];
                tempSouth = temparray[1][4];
                end
                if(k==0 && j==6)begin
                tempWest = temparray[0][5];
                tempEast = temparray[0][7];
                tempNorth = temparray[7][6];
                tempSouth = temparray[1][6];
                end
                if(k==2 && j==0)begin
                tempWest = temparray[2][7];
                tempEast = temparray[2][1];
                tempNorth = temparray[1][0];
                tempSouth = temparray[3][0];
                end
                if(k==2 && j==2)begin
                tempWest = temparray[2][5];
                tempEast = temparray[2][7];
                tempNorth = temparray[1][2];
                tempSouth = temparray[3][2];
                end
                if(k==2 && j==4)begin
                tempWest = temparray[2][3];
                tempEast = temparray[2][5];
                tempNorth = temparray[1][4];
                tempSouth = temparray[3][4];
                end
                if(k==2 && j==6)begin
                tempWest = temparray[2][5];
                tempEast = temparray[2][7];
                tempNorth = temparray[1][6];
                tempSouth = temparray[3][6];
                end
                if(k==5 && j==1)begin
                tempWest = temparray[5][0];
                tempEast = temparray[5][2];
                tempNorth = temparray[4][1];
                tempSouth = temparray[6][1];
                end
                if(k==5 && j==3)begin
                tempWest = temparray[5][2];
                tempEast = temparray[5][4];
                tempNorth = temparray[4][3];
                tempSouth = temparray[6][3];
                end
                if(k==5 && j==4)begin
                tempWest = temparray[5][7];
                tempEast = temparray[5][1];
                tempNorth = temparray[4][4];
                tempSouth = temparray[6][4];
                end
                if(k==5 && j==6)begin
                tempWest = temparray[5][5];
                tempEast = temparray[5][7];
                tempNorth = temparray[4][6];
                tempSouth = temparray[6][6];
                end
                if(k==7 && j==1)begin
                tempWest = temparray[7][0];
                tempEast = temparray[7][2];
                tempNorth = temparray[6][1];
                tempSouth = temparray[0][1];
                end
                if(k==7 && j==3)begin
                tempWest = temparray[7][2];
                tempEast = temparray[7][4];
                tempNorth = temparray[6][3];
                tempSouth = temparray[0][3];
                end
                if(k==7 && j==4)begin
                tempWest = temparray[7][3];
                tempEast = temparray[7][5];
                tempNorth = temparray[6][4];
                tempSouth = temparray[0][4];
                end
                if(k==7 && j==6)begin
                tempWest = temparray[7][5];
                tempEast = temparray[7][7];
                tempNorth = temparray[6][6];
                tempSouth = temparray[0][6];
                end
                    case (tempState)
                    4'b1111 : begin
                          cState <= 0;
                          count<= count +1;
                    end
                    4'b1110: begin
                            cState <= 1;
                          count<= count +1;
                    end
                    4'b1011: begin
                            cState <= 0;
                            count<= count +1;
                    end
                    4'b1010: begin
                            cState <= 1;
                            count<= count +1;
                    end
                    4'b0111: begin
                            cState <= 0;
                            count<= count +1;
                    end
                    4'b0110: begin
                            cState <= 0;
                            count<= count +1;
                    end
                    4'b0011: begin 
                            cState <= 0;
                            count<= count +1;
                    end
                    4'b0010: begin
                            cState <= 1;
                            count<= count +1;
                    end
                    4'b1101: begin
                            cState <= 1;
                            count<= count +1;
                    end
                    4'b1100: begin
                            cState <= 0;
                            count<= count +1;
                    end 
                    4'b1001: begin
                            cState <= 1;
                            count<= count +1;
                    end 
                    4'b1000: begin
                            cState <= 0;
                            count<= count +1;
                    end
                    4'b0101: begin
                            cState <= 1;
                            count<= count +1;
                    end
                    4'b0100: begin
                            cState <= 1;
                            count<= count +1;
                    end
                    4'b0001: begin
                            cState <= 0;
                            count<= count +1;
                    end
                    4'b0000: begin
                            cState <= 0;
                            count<= count +1;
                    end
                 endcase      
                end
            end
        end                                                                                                           
    end
    2: begin
        for(int k = 0; k<8; k++)
        for(int j = 0; j<0; j++)begin
            if( array1[k][j] == 1)begin
                if(k==0 && j==0)begin
                tempWest = temparray[0][7];
                tempEast = temparray[0][1];
                tempNorth = temparray[7][0];
                tempSouth = temparray[1][0];
                if (k==0 && j==2)begin
                tempWest = temparray[0][1];
                tempEast = temparray[0][3];
                tempNorth = temparray[7][2];
                tempSouth = temparray[1][2];    
                end
                if(k==0 && j==4)begin
                tempWest = temparray[0][3];
                tempEast = temparray[0][5];
                tempNorth = temparray[7][4];
                tempSouth = temparray[1][4];
                end
                if(k==0 && j==6)begin
                tempWest = temparray[0][5];
                tempEast = temparray[0][7];
                tempNorth = temparray[7][6];
                tempSouth = temparray[1][6];
                end
                if(k==2 && j==0)begin
                tempWest = temparray[2][7];
                tempEast = temparray[2][1];
                tempNorth = temparray[1][0];
                tempSouth = temparray[3][0];
                end
                if(k==2 && j==2)begin
                tempWest = temparray[2][5];
                tempEast = temparray[2][7];
                tempNorth = temparray[1][2];
                tempSouth = temparray[3][2];
                end
                if(k==2 && j==4)begin
                tempWest = temparray[2][3];
                tempEast = temparray[2][5];
                tempNorth = temparray[1][4];
                tempSouth = temparray[3][4];
                end
                if(k==2 && j==6)begin
                tempWest = temparray[2][5];
                tempEast = temparray[2][7];
                tempNorth = temparray[1][6];
                tempSouth = temparray[3][6];
                end
                if(k==5 && j==1)begin
                tempWest = temparray[5][0];
                tempEast = temparray[5][2];
                tempNorth = temparray[4][1];
                tempSouth = temparray[6][1];
                end
                if(k==5 && j==3)begin
                tempWest = temparray[5][2];
                tempEast = temparray[5][4];
                tempNorth = temparray[4][3];
                tempSouth = temparray[6][3];
                end
                if(k==5 && j==4)begin
                tempWest = temparray[5][7];
                tempEast = temparray[5][1];
                tempNorth = temparray[4][4];
                tempSouth = temparray[6][4];
                end
                if(k==5 && j==6)begin
                tempWest = temparray[5][5];
                tempEast = temparray[5][7];
                tempNorth = temparray[4][6];
                tempSouth = temparray[6][6];
                end
                if(k==7 && j==1)begin
                tempWest = temparray[7][0];
                tempEast = temparray[7][2];
                tempNorth = temparray[6][1];
                tempSouth = temparray[0][1];
                end
                if(k==7 && j==3)begin
                tempWest = temparray[7][2];
                tempEast = temparray[7][4];
                tempNorth = temparray[6][3];
                tempSouth = temparray[0][3];
                end
                if(k==7 && j==4)begin
                tempWest = temparray[7][3];
                tempEast = temparray[7][5];
                tempNorth = temparray[6][4];
                tempSouth = temparray[0][4];
                end
                if(k==7 && j==6)begin
                tempWest = temparray[7][5];
                tempEast = temparray[7][7];
                tempNorth = temparray[6][6];
                tempSouth = temparray[0][6];
                end
    end
    3: begin

        
    end
    4: begin
     
    end
    endcase
    
    assign array_out = temparray;
    assign centre = cState; 
endmodule
