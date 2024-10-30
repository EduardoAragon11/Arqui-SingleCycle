module ALUDecoder(input ALUOp, 
					input[4:0] Funct,
					output [1:0] ALUControl,
					output [1:0] FlagW);

	reg [3:0] cmd;
	reg S;

	parameter Add = 4'b0100;
	parameter Sub = 4'b0010;
	parameter And = 4'b0000;
	parameter Orr = 4'b1100;

	reg [1:0] ALUControlreg;
	reg [1:0] FlagWreg;

	always @ (*)
	begin
		cmd <= Funct[4:1];
		S <= Funct[0];
	end

	always @ (*)
		case(cmd)
			Add: ALUControlreg = 2'b00;
			Sub: ALUControlreg = 2'b01;
			And: ALUControlreg = 2'b10;
			Orr: ALUControlreg = 2'b11;
		endcase

	always @ (*)
		case(cmd)
			Add: FlagWreg = S ? 2'b11 : 2'b00;
			Sub: FlagWreg = S ? 2'b11 : 2'b00;
			And: FlagWreg = S ? 2'b10 : 2'b00;
			Orr: FlagWreg = S ? 2'b10 : 2'b00;
		endcase

	assign ALUControl = ALUOp ? ALUControlreg : 2'b00;
	assign FlagW = ALUOp ? FlagWreg : 2'b00;

endmodule
