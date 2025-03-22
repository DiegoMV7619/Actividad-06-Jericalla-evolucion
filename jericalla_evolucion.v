//Equipo: Los Muñonez

`timescale 1ns/1ns

module jericalla_evolucion(
    input wire clk,
    input wire [18:0] instruction,

    output reg [31:0] data_out,
    output reg zf
);


// Cables Unidad de Control
wire        wire_cu_write_enable_rb;
wire        wire_cu_read_ram;
wire        wire_cu_write_ram;
wire [3:0]  wire_cu_alu_opcode;
wire        wire_cu_demultiplexor;

// Cables Banco de Registros
wire [31:0] wire_rb_data_register_1;
wire [31:0] wire_rb_data_register_2;

// Cables Buffer 1
wire        wire_buffer_1_uc_e_read_ram;
wire        wire_buffer_1_uc_e_write_ram;
wire        wire_buffer_1_uc_demux;
wire [3:0]  wire_buffer_1_uc_alu_opcode; 
wire        wire_buffer_1_uc_e_write_br;
wire [4:0]  wire_buffer_1_wA;
wire [31:0] wire_buffer_1_data_register_1;
wire [31:0] wire_buffer_1_data_register_2;

// Cables Demultiplexor
wire [31:0] wire_demux_data_ram;
wire [31:0] wire_demux_data_alu;

// Cables ALU
wire [31:0] wire_alu_result;

// Cables Buffer 2
wire        wire_buffer_2_uc_e_read_ram;
wire        wire_buffer_2_uc_e_write_ram;
wire        wire_buffer_2_uc_e_write_br;
wire        wire_buffer_2_address_ram;
wire        wire_buffer_2_wA;
wire [31:0] wire_buffer_2_dW;
wire [31:0] wire_buffer_2_din_ram;

unidad_control unidad_control_inst
(
	.instruction(instruction[18:15]),
	.write_enable_RB(wire_cu_write_enable_rb),
	.read_ram(wire_cu_read_ram),
	.write_ram(wire_cu_write_ram),
	.alu_opcode(wire_cu_alu_opcode),
	.demultiplexor(wire_cu_demultiplexor)
);

banco_de_registros banco_de_registros_inst(
    .read_address_1(instruction[9:5]),
    .read_address_2(instruction[4:0]),
    .write_address(wire_buffer_2_wA),
    .data_write(wire_buffer_2_dW),
    .write_enable(wire_buffer_2_uc_e_write_br),
    .data_register_1(wire_rb_data_register_1),
    .data_register_2(wire_rb_data_register_2)
);

buffer1 buffer1_inst(
	.i_uc_e_read_ram(wire_cu_read_ram),
	.i_uc_e_write_ram(wire_cu_write_ram),
	.i_uc_demux(wire_cu_demultiplexor),
	.i_uc_alu_opcode(wire_cu_alu_opcode), 
	.i_uc_e_write_br(wire_cu_write_enable_rb),
	.i_wA(instruction[14:10]),
	.i_DR1(wire_rb_data_register_1),
	.i_DR2(wire_rb_data_register_2),
	.clk(clk),
	.o_uc_e_read_ram(wire_buffer_1_uc_e_read_ram),
	.o_uc_e_write_ram(wire_buffer_1_uc_e_write_ram),
	.o_uc_demux(wire_buffer_1_uc_demux),
	.o_uc_alu_opcode(wire_buffer_1_alu_opcode), 
	.o_uc_e_write_br(wire_buffer_1_uc_e_write_br),
	.o_wA(wire_buffer_1_wA),
	.o_DR1(wire_buffer_1_data_register_1),
	.o_DR2(wire_buffer_1_data_register_2)
);

demultiplexor demultiplexor_inst(
    .selector(wire_buffer_1_uc_demux),
    .i_data(wire_buffer_1_data_register_1),
    .o_data_ram(wire_demux_data_ram),
    .o_data_alu(wire_demux_data_alu)
);

alu alu_inst(
	.op(wire_cu_alu_opcode),
 	.din1_alu(wire_demux_data_alu),
 	.din2_alu(wire_buffer_1_data_register_2),
 	.result_alu(wire_alu_result),
 	.ZF(zf)
);

buffer2 buffer2_inst
(
	.i_uc_e_read_ram(wire_buffer_1_uc_e_read_ram),
	.i_uc_e_write_ram(wire_buffer_1_uc_e_write_ram),
	.i_uc_e_write_br(wire_buffer_1_uc_e_write_br),
	.i_result_demux(wire_demux_data_ram),
	.i_wA(wire_buffer_1_wA),
	.i_alu_result(wire_alu_result),
	.i_DR2(wire_buffer_1_data_register_2),
	.clk(clk),
	.o_uc_e_read_ram(wire_buffer_2_uc_e_read_ram),
	.o_uc_e_write_ram(wire_buffer_2_uc_e_write_ram),
	.o_uc_e_write_br(wire_buffer_2_uc_e_write_br),
	.o_address_ram(wire_buffer_2_address_ram),
	.o_wA(wire_buffer_2_wA),
	.o_dW(wire_buffer_2_dW),
	.o_din_ram(wire_buffer_2_din_ram)
);

ram ram_inst(
	.address(wire_buffer_2_address_ram),
	.din(wire_buffer_2_din_ram),
	.write_enable(wire_buffer_2_uc_e_write_ram),
    .read_enable(wire_buffer_2_uc_e_read_ram),
	.dout(data_out)
);

endmodule