//Equipo: Los Muñonez

`timescale 1ns/1ns

module banco_de_registros(
    input wire [4:0] read_address_1,
    input wire [4:0] read_address_2,
    input wire [4:0] write_address,
    input wire [31:0] data_write,
    input wire write_enable,

	output reg [31:0] data_register_1,
    output reg [31:0] data_register_2
);

reg [31:0] mem [0:31];

always @* begin
    if (write_enable == 1'b1) begin
        mem[write_address] = data_write;
    end
    else begin
        data_register_1 = mem[read_address_1];
        data_register_2 = mem[read_address_2];
    end
	
end

endmodule