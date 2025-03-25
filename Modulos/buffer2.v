//Equipo: Los Muñonez 

`timescale 1ns / 1ns

module buffer2
(
	input i_uc_e_read_ram, 			 
	input i_uc_e_write_ram,
	input i_uc_e_write_br,
	input [31:0] i_result_demux,
	input [31:0] i_DR2,        
	input clk,
	
	output reg o_uc_e_read_ram, 
	output reg o_uc_e_write_ram,
	output reg o_uc_e_write_br,
	output reg [31:0] o_address_ram,
	output reg [31:0] o_din_ram
);


always @ (posedge clk) begin
	
	//Envio de señales de habilitacion hacía la memoria RAM
	o_uc_e_read_ram <= i_uc_e_read_ram;
	o_uc_e_write_ram <= i_uc_e_write_ram;
	
	//Envio de señales de habilitacion hacia la escritura del BR
	o_uc_e_write_br <= i_uc_e_write_br;	
	
	//La salida del demultiplexor al ser 1 se registra como la direccion en la RAM
	o_address_ram <= i_result_demux;
	
	//La salida del resultado del dato DR2 proveniente del buffer 1 se almacena como el dato de entrada hacia la RAM
	o_din_ram <= i_DR2;

	
	end
	
endmodule

