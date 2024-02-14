module dbm_tb;
  reg [7:0] DA,DB;
  reg ClkA,ClkB;
  reg WenA,WenB;
  reg [4:0] AA,AB;
  reg [8:0] memory[32:0];
  wire [7:0] QA,QB;
  integer i;
  dbm dwt(.WenA(WenA),.WenB(WenB),.ClkA(ClkA),.ClkB(ClkB),.DA(DA),.DB(DB),.QA(QA),.QB(QB),.AA(AA),.AB(AB));
  task write_operation_A();
      //always @(posedge ClkA)
    for(i=0;i<15;i++)
        begin
          AA<=i;
          DA<=$urandom%256;
          #10;
        end
         endtask
         task write_operation_B();
          // always @(posedge ClkB)
    
           for(i=0;i<15;i++)
        begin
          AB<=i;
          DB<=$urandom%256;
          #10;
        end
         endtask
         task read_operation_A();
     // always @(posedge ClkA)
    
           for(i=0;i<15;i++)
        begin
          AA<=i;
          #10;
        end
         endtask
         task read_operation_B();
          // always @(posedge ClkB)
     
           for(i=0;i<15;i++)
        begin
          AB<=i;
        end
         endtask
       
         initial begin
           WenA<=0;
           write_operation_A();
           WenA<=1;
           read_operation_A();
           WenB<=0;
           write_operation_B();
            WenB<=1;
            read_operation_B();
      $dumpfile("dump.vcd");
    $dumpvars();
    $finish;

     end
    always begin #5;ClkA=1'b0;#5;ClkA=1'b1;
      #5;ClkB=1'b0;#5;ClkB=1'b1;
    end
endmodule
