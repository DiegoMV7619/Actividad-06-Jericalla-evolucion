//Equipo: Los Muñonez 

`timescale 1ns / 1ns

module buffer1
(
	input i_uc_e_read_ram, 			 
	input i_uc_e_write_ram,
	input i_uc_demux,
	input [3:0] i_uc_alu_opcode, 
	input i_uc_e_write_br,
	input [31:0] i_DR1,
	input [31:0] i_DR2,        
	input clk,
	
	output reg o_uc_e_read_ram, 
	output reg o_uc_e_write_ram,
	output reg o_uc_demux,
	output reg [3:0] o_uc_alu_opcode, 
	output reg o_uc_e_write_br,
	output reg [31:0] o_DR1,
	output reg [31:0] o_DR2
);


always @ (posedge clk) begin
	
	//Envio de señales de habilitacion hacía la memoria RAM
	o_uc_e_read_ram <= i_uc_e_read_ram;
	o_uc_e_write_ram <= i_uc_e_write_ram;
	
	//Seleccion de operacion para el demultiplexor
	o_uc_demux <= i_uc_demux;
	
	//Envio de señales de habilitacion hacia la escritura del BR
	o_uc_e_write_br <= i_uc_e_write_br;
	
	
	//Salida del dato del registro 1 y 2
	o_DR1 <=i_DR1;
	o_DR2 <= i_DR2;
	
	end
endmodule
