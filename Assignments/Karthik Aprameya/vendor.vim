module vendor(Clk,x,y,rst);
  input Clk,x,rst;
  output reg y;
  localparam S0=3'b000;
  localparam S1=3'b001;
  localparam S2=3'b010;
  localparam S3=3'b011;
  localparam S4=3'b100;
  reg[2:0] state,next_state;
always @(posedge Clk)
    if(rst)
      state<=0;
  else
    state<=next_state;
always @(*)
  begin
    case(state)
      S0 :begin
        if(x==1)
      next_state=S1;
      else if(x==2) 
    next_state=S2;
   end
      S1 :begin
        if(x==2) 
      next_state=S3;
        else if(x==1) 
    next_state=S2;
   end
      S2 :begin
        if(x==2)  
      next_state=S4;
        else if(x==1) 
    next_state=S3;
   end
      S3 :begin
        if(x==2) 
      next_state=S0;
        else if(x==1) 
    next_state=S3;
   end
      S4 :begin
        if(x==2) 
      next_state=S4;
        else if(x==1) 
    next_state=S0;
   end
    endcase
  end
always @(*)
  begin
  case(state)
      S0 :begin
        if(x==1)
       y=1'b0;
      else if(x==2) 
       y=1'b0;
   end
      S1 :begin
        if(x==2) 
       y=1'b0;
        else if(x==1) 
       y=1'b0;
   end
      S2 :begin
        if(x==2)  
       y=1'b0;
        else if(x==1) 
       y=1'b0;
   end
      S3 :begin
        if(x==2) 
       y=1'b1;
        else if(x==1) 
       y=1'b0;
      end
        S4 :begin
        if(x==2) 
       y=1'b0;
        else if(x==1) 
       y=1'b1;
        end
          endcase
   end
 endmodule

