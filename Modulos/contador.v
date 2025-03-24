//Equipo: Los Muñonez 

`timescale 1ns / 1ns

module contador(
	
	input clk,
	input wire reset,
	output reg o_e_write_br,
	output reg selector_demux
);

reg [1:0] contador_pulsos;

always @(posedge clk) 
	begin
	
	if(reset == 1'b1)
		begin
			contador_pulsos = 1'b0;
			o_e_write_br = 1'b0;
			selector_demux = 1'b0;
		end
	else if(contador_pulsos < 2)
		begin
			contador_pulsos = contador_pulsos + 1;
			selector_demux = 1'b0;
		end
	else
		begin
			selector_demux = 1'b1;
			o_e_write_br = 1'b0;
			contador_pulsos = 1'b0;
		end
	end
endmodule
