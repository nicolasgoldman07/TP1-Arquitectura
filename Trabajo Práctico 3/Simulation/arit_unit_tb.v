`timescale 1ns/1ps

module arit_unit_tb();
    reg     [15:0]	i_ACC, i_DATA;
    reg             i_OP;
    wire    [15:0]  o_RES;
    
    arit_unit arit_unit_tb(.i_ACC(i_ACC), .i_DATA(i_DATA), 
        .i_OP(i_OP), .o_RES(o_RES));
  
    initial
        begin
        //$dumpfile("out.vcd");
        //$dumpvars(1,arit_unit_tb);

        //SUMA
        #25 i_ACC = 16'b0000000000000001; 
            i_DATA = 16'b0000000000000000; 
            i_OP = 1'b0;

        #25	i_ACC = 16'b1000000000000000; 
            i_DATA = 16'b1111111111111111; 
            i_OP = 1'b0;

        #25	i_ACC = 16'b0000000000000110;
            i_DATA = 16'b0000000000000001; 
            i_OP = 1'b0;
        
        //RESTA
        #25	i_ACC = 16'b0000000000001111; 
            i_DATA = 16'b0000000000000101; 
            i_OP = 1'b1;

        #25	i_ACC = 16'b0000000000110000; 
            i_DATA = 16'b1000000000010110; 
            i_OP = 1'b1;
        
        //los resultados negativos los tira en complemento a 2
        end

    initial
        #300 $finish; //Duracion de la Simulacion
endmodule