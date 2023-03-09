`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Michael Kowlessar
// R#: 11518785 
// Assignment: Project 3
//////////////////////////////////////////////////////////////////////////////////
//0x01, //LD
///x03, //ADD
//0x04, //SUB
//0x05, //AND
//0x06, //OR
//0x07, //XOR
//0x08, //NOT
//0x09, //SL
//0x0A, //SR

// Z is if result is zero
// V is if there is overflow
// N is if result is negative
// C is if operation produced a carry

module ALU(

    input [31:0] In_1, In_2,
    input [4:0] Select,
    output [31:0] Output,
    output reg Z, N, C, V
     
    );
    
    reg [31:0] Result;
    wire [32:0] Temp_Result;
    assign Output = Result;
    // assign Temp_Result 
    
    always @(*)
    begin
        case(Select)
        
        5'b00001: begin //LD, 1
            Result = In_1; // ?
            if (In_1 == 0)
                Z = 1;
        end
        
        5'b00011: begin //ADD, 3
            Result = In_1 + In_2; // ?
            if (Result < 0)
                Z = 0;
                N = 1;
                V = 1;
            if (Result > 0)
                Z = 0;
                N = 0;
                V = 0;
            if (Result == 0)
                Z = 1;
                N = 0;
                V = 0;               
        end
        
        5'b00100: begin //SUB, 4
            Result = In_1 - In_2; 
        end
            
        5'b00101: //AND, 5
            Result = In_1 & In_2;
            
        5'b00110: //OR, 6
            Result = In_1 | In_2;
            
        5'b00111: //XOR, 7
            Result = In_1 ^ In_2;
            
        5'b01000: //NOT, 8
            Result = ~In_1; // ?
            
        5'b01001: //SL, 9
            Result = In_1<<1;
            
        5'b01010: //SR, 10
            Result = In_1>>1;
            
        default: Result = In_1 + In_2;
        endcase
    end
                   
    
endmodule
