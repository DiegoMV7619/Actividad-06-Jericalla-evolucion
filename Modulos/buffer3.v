//Equipo: Los Muñonez 

`timescale 1ns / 1ns

module buffer3(
	
	input clk,
	input i_uc_e_write_br,
	output reg dout_buffer3

);

always @(posedge clk) begin

	dout_buffer3 = i_uc_e_write_br;

end
endmodule
