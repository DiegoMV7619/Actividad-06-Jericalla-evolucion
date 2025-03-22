//Equipo: Los Muñonez 

`timescale 1ns/1ns

module alu(
	input [3:0] op,
 	input [31:0] din1_alu,
 	input [31:0] din2_alu,
 	output reg [31:0] result_alu,
 	output reg ZF
);

always @* begin
 	case(op)
 		4'b0000: result_alu = din1_alu & din2_alu;
 		4'b0001: result_alu = din1_alu | din2_alu;
 		4'b0010: result_alu = din1_alu + din2_alu;
 		4'b0110: result_alu = din1_alu - din2_alu;
 		4'b0111: result_alu = (din1_alu < din2_alu)?32'd1:32'd0;
 		4'b1100: result_alu = ~(din1_alu | din2_alu);
 	endcase
	
	if (result_alu == 32'b00000000000000000000000000000000) begin
		ZF = 1'b1;
	end
	else begin
		ZF = 1'b0;
	end
end
 endmodule