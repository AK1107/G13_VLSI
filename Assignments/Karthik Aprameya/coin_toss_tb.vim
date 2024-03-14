module coin_toss_tb;
  reg Clk,x,rst;
  wire  y;
  coin_toss_fsm dut(.Clk(Clk), .x(x), .y(y), .rst(rst));
   always @(posedge Clk)
   begin
  x=1'b0;//no heads
  #10;
  x=1'b1;
  #10;
  x=1'b0;//one head
  #10;
  x=1'b1;
  #10;
  x=1'b1;
  #10;
  x=1'b0;//two heads
  #10;
  x=1'b1;
  #10;
  x=1'b1;
  #10;
  x=1'b1;//three heads
 #10;
  end
always begin 
  #5;Clk=1'b0;#5;Clk=1'b1;
end
endmodule
