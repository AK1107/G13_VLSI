module fifo_tb;
parameter WIDTH = 8;
parameter DEPTH = 16;
parameter CLK_PERIOD = 10; // Clock period in ns
reg CLK;
reg RST;
reg WEN;
reg REN;
  reg [WIDTH-1:0] D;
  wire [WIDTH-1:0] Q;
wire FULL;
wire EMPTY;
integer i;
fifo dut (
  .CLK(CLK),
  .RST(RST),
  .WEN(WEN),
  .REN(REN),
  .D(D),
  .Q(Q),
  .FULL(FULL),
  .EMPTY(EMPTY)
);

initial begin
    RST <= 1;
    #10;
  for(i=0;i<=WIDTH-1;i=i+1)
    begin
    // Test write operation
    WEN <= 1;
    D <= $random; // Write data
    #10; // Wait for 10 ns
    WEN = 0;

    // Test read operation
    REN <= 1;
    #10;
    REN <= 0;
    end
    // Add more test scenarios here as needed

    $finish;
end

  always #((CLK_PERIOD)/2) CLK = ~CLK; 

endmodule

  
