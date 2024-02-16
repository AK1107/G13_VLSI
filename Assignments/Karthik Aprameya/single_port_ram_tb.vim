module memory_16X8_tb;
  parameter CLK_PERIOD=10;
  reg wen,Clk;
  reg[7:0] Addr,In;
  wire[7:0] Out;
  reg [7:0] mem [0:15];
  integer i;
  memory_16X8 dut(.Clk(Clk),.wen(wen),.In(In),.Out(Out),.Addr(Addr));
  initial begin
    wen<=1;
    for(i=0;i<256;i=i+1)
      begin
        Addr<=i;
        #10;
        In<=$random;
        #10;
      end
    #10;
    wen<=0;
    for(i=0;i<256;i=i+1)
      begin
        #10;
        Addr<=i;
        #10;
      end
    end
    always #((CLK_PERIOD)/2) Clk = ~Clk; 
endmodule

