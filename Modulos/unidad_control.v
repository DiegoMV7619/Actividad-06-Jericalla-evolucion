//Equipo: Los Muñonez 

`timescale 1ns / 1ns

module unidad_control
(
	input [3:0] instruction,
	
	output reg write_enable_RB,
	output reg read_ram,
	output reg write_ram,
	output reg [3:0]alu_opcode,
	output reg demultiplexor
);

always @* begin
	case(instruction)
	
	4'b0000: 
		begin
			write_enable_RB = 1'b1;
			read_ram = 1'b0;
			write_ram = 1'b0;
			alu_opcode = 4'b0000; //AND
			demultiplexor = 1'b0;
			write_enable_RB = 1'b0;
		end
	4'b0001:
		begin
			write_enable_RB = 1'b1;
			read_ram = 1'b0;
			write_ram = 1'b0;
			alu_opcode = 4'b0001; //OR
			demultiplexor = 1'b0;
		end
	4'b0010:
		begin
			write_enable_RB = 1'b1;
			read_ram = 1'b0;
			write_ram = 1'b0;
			alu_opcode = 4'b0010; //ADD
			demultiplexor = 1'b0;
		end
	4'b0011:
		begin
			write_enable_RB = 1'b1;
			read_ram = 1'b0;
			write_ram = 1'b0;
			alu_opcode = 4'b0110; //SUB
			demultiplexor = 1'b0;
		end
	4'b0100:
		begin
			write_enable_RB = 1'b1;		
			read_ram = 1'b0;
			write_ram = 1'b0;
			alu_opcode = 4'b0111; //SLT
			demultiplexor = 1'b0;
		end
	4'b0101:
		begin
			write_enable_RB = 1'b1;		
			read_ram = 1'b0;
			write_ram = 1'b0;
			alu_opcode = 4'b1100; //NOR
			demultiplexor = 1'b0;
		end
	4'b0110:
		begin
			write_enable_RB = 1'b0;		
			read_ram = 1'b0;
			write_ram = 1'b1;
			alu_opcode = 4'bxxxx; //SW
			demultiplexor = 1'b1;
		end
	default:
			begin
			write_enable_RB = 1'bz;
			read_ram = 1'bz;
			write_ram = 1'bz;
			alu_opcode = 4'bzzzz;
			demultiplexor = 1'bz;
			end
endcase

end

endmodule
