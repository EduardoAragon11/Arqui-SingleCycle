module MainDecoder(input[1:0] Op, 
					input Funct5, 
					input Funct0, 
					output Branch,
					output MemtoReg,
					output MemW,
					output ALUSrc, 
					output[1:0] ImmSrc, 
					output RegW,
					output[1:0] RegSrc,
					output ALUOp);


assign Branch = Op[1];
assign MemtoReg = ~Op[1] & Op[0] & Funct0;
assign MemW = ~Op[1] & Op[0] & ~Funct0;
assign ALUSrc = Op[1] | Op[0] | Funct5;
assign ImmSrc = Op;
assign RegW = (~(Op[1] ^ Op[0])) | (Op[0] & Funct0);
assign RegSrc = {Op[1] | Op[0], Op[1] & ~Op[0]};
assign ALUOp = ~ (Op[1] ^ Op[0]);

endmodule
