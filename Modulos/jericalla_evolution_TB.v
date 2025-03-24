//Equipo: Los Muñonez

`timescale 1ns/1ns

module jericalla_evolution_TB();

reg clk_TB;
reg [18:0] instruction_TB;
reg reset_TB;

wire [31:0] data_out_TB;
wire zf_TB;

jericalla_evolucion jericalla_inst
(
    .clk(clk_TB),
	.reset(reset_TB),
    .instruction(instruction_TB),
	.data_out(data_out_TB),
    .zf(zf_TB)
);

initial begin
    clk_TB = 0; 
    forever #5 clk_TB = ~clk_TB;  
end

initial begin
     $readmemb("datos.txt",jericalla_inst.banco_de_registros_inst.mem);
 end

 initial begin
	 reset_TB = 1'b1;
	 #30;
	 reset_TB = 1'b0;
     instruction_TB = 19'b0010001000000000001; //SUMA DE 222 y 111 guardado en la direccion 4 del BR
     #30;
     instruction_TB = 19'b0011001010000100010; //RESTA DE 111 y 100 guardado en la dirección 5 del BR 
     #30;
	 instruction_TB = 19'b0100001100001000011; //STL de 100 y 200 guardado en la dirección 6
	 #30;
	 instruction_TB = 19'b0110xxxxx0011100100; //SW del valor 333 en la direccion  20 de la RAM
	 #30;
	 $stop;
 end
 
 endmodule