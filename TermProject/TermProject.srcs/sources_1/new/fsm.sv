`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2019 12:19:28 AM
// Design Name: 
// Module Name: fsm
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


module fsm( input logic clk, restart, west, east, north, south, [3:0]value1, [3:0]value2, [3:0]value3, 
            //input[7:0][7:0] array_in,
            input logic[63:0] register,
            output logic[7:0][7:0] array_out,
            output logic centre);
            
  logic cState;
  //logic tempwest, tempeast, tempnorth, tempsouth
  
  
  /*logic[63:0] temparray;*/
  logic[7:0][7:0] temparray;
  
//  assign temparray = array_in;
//      enum logic [3:0] {state1 = 2'b00,
//                     state2 = 2'b01,
//                     state3 = 2'b10,
//                     state4 = 2'b11} state;
    logic state = {west, east, north, south};
   
   
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
         case (state)
            4'b1111 : begin
               //if (west && east && north && south)
                  cState <= 0;
               /*else if (<condition>)
                  //<state> <= <next_state>;*/
              /* else
                  //<state> <= <next_state>;*/
            end
 /*           1'b1 : begin
               if (<condition)
                  <state> <= <next_state>;
               else if (<condition>)
                  <state> <= <next_state>;
               else
                  <state> <= <next_state>;
               <outputs> <= <values>;
            end*/
            4'b1110: begin
                //if(west && east && north && ~south)
                    cState <= 1;
            end
            4'b1011: begin
                //if(west && ~east && north && south)
                    cState <= 0;
            end
            4'b1010: begin
                //if(west && ~east && north && ~south)
                    cState <= 1;
            end
            4'b0111: begin
                //if(~west && east && north && south)
                    cState <= 0;
            end
            4'b0110: begin
                //if(~west && east && north && ~south)
                    cState <= 0;
            end
            4'b0011: begin
                //if(~west && ~east && north && south)
                    cState <= 0;
            end
            4'b0010: begin
                //if(~west && ~east && north && ~south)
                    cState <= 1;
            end
            4'b1101: begin
                //if(~west && ~east && ~north && ~south)
                    cState <= 1;
            end
            4'b1100: begin
                //if(~west && ~east && ~north && ~south)
                    cState <= 0;
            end 
            4'b1001: begin
                //if(~west && ~east && ~north && ~south)
                    cState <= 1;
            end 
            4'b1000: begin
                //if(~west && ~east && ~north && ~south)
                    cState <= 0;
            end
            4'b0101: begin
                //if(~west && east && ~north && south)
                    cState <= 1;
            end
            4'b0100: begin
                //if(~west && east && ~north && ~south)
                    cState <= 1;
            end
            4'b0001: begin
                //if(~west && ~east && ~north && south)
                    cState <= 0;
            end
            4'b0000: begin
                //if(~west && ~east && ~north && ~south)
                    cState <= 0;
            end
/*            default: begin
//                 temparray[0][0:7] = 8'h13;
//                 temparray[1][0:7] = 8'h45;
//                 temparray[2][0:7] = 8'h10;
//                 temparray[3][0:7] = 8'hAB;
//                 temparray[4][0:7] = 8'hBC;
//                 temparray[5][0:7] = 8'hDF;
//                 temparray[6][0:7] = 8'hEF;
//                 temparray[7][0:7] = 8'hAB;
    temparray[7][7:0] = register[63:56];
    temparray[6][7:0] = register[55:48];
    temparray[5][7:0] = register[47:40];
    temparray[4][7:0] = register[39:32];
    temparray[3][7:0] = register[31:24];
    temparray[2][7:0] = register[23:16];
    temparray[1][7:0] = register[15:8];
    temparray[0][7:0] = register[7:0];*/
                //end
         endcase
							
        assign array_out = temparray;
        assign centre = cState;

endmodule