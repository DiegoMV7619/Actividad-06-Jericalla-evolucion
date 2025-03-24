//Equipo: Los Muñonez 

`timescale 1ns / 1ns

module demultiplexor2(
	
	input i_contador,
	input i_uc_e_write_br,
	input i_contador_e_write_br,
	output reg dout_demux2

);

always @* begin

	if(i_contador == 1'b1)
		begin
			dout_demux2 = i_contador_e_write_br;
		end
	else 
		begin
			dout_demux2 = i_uc_e_write_br;
		end
end
endmodule
