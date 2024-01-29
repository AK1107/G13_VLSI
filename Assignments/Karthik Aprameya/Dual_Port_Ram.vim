module dbm(WenA,WenB,ClkA,ClkB,DA,DB,QA,QB,AA,AB);
input ClkA,ClkB;
input [7:0] DA,DB;
input [4:0] AA,AB;
input WenA,WenB;
Output reg [7:0] QA,QB;
reg [8:0] memory[32:0];
always @(posedge ClkA)
begin
if(WenA)
	memory[AA]<=DA;
else
	QA<=memory[AA];
	end
always @(posedge ClkB)
begin
if(WenB)
	memory[AB]<=DB;
else
	QA<=memory[AB];
	end
	endmodule


