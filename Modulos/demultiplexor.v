//Equipo: Los Muñonez

`timescale 1ns/1ns

module demultiplexor (
    input wire selector,
    input wire [31:0] i_data,
    output reg [31:0] o_data_ram,
    output reg [31:0] o_data_alu
);
    
always @* begin
    if (selector == 1'b1) begin
        o_data_ram = i_data;
    end
    else begin
        o_data_alu = i_data;
    end
end

endmodule