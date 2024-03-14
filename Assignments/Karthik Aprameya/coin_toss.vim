module coin_toss_fsm(Clk,x,y,rst);
  input Clk,x,rst;
  output reg y;
  localparam S0=3'b000;
  localparam S1=3'b001;
  localparam S2=3'b010;
  localparam S3=3'b011;
  reg[2:0] state,next_state;
  always @(posedge Clk)
    if(rst)
      state<=0;
  else
    state<=next_state;
  always @(*)
    case(state)
      S0 :begin
        if(x)  begin
      next_state=S1;//number of heads=1
  y=1'b0;
        end
  else begin
    next_state=S0;
   y=1'b0;
  end
      end
      S1 :begin
        if(x)  begin
      next_state=S2;//number of heads=2
  y=1'b0;
        end
  else begin
    next_state=S1;
   y=1'b0;
  end
      end
      S2 :begin
        if(x)  begin
      next_state=S3;//number of heads=3
  y=1'b1;
        end
  else begin
    next_state=S2;
   y=1'b0;
    end
      end
    endcase
      endmodule
