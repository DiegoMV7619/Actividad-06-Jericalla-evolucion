//Equipo: Los Muñonez

`timescale 1ns/1ns

module ram(
	input wire [31:0] address,
	input wire [31:0] din,
	input wire write_enable,
    input wire read_enable,
	output reg [31:0] dout
);

reg [31:0] mem [0:127];

always @* begin
	if (write_enable == 1'b1) begin
		mem[address] = din;
	end
	else if (read_enable == 1'b1) begin
		dout = mem[address];
	end
    else begin
        dout = 32'dz;
    end
end


endmodule
