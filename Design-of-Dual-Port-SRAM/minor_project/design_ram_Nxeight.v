module design_ram_Nxeight(clk, rst, addr_a, addr_b, we_a, we_b, data_a, data_b, dataout_a, dataout_b);
 
parameter WIDTH=7;
parameter HEIGHT=63;

input clk, rst;
input  we_a;
input  we_b;
input [7:0] addr_a;
input [7:0] addr_b;
input  [15:0] data_a;
input  [15:0] data_b;

output reg[15:0] dataout_a;
output reg[15:0] dataout_b;


 reg [WIDTH:0] memo [HEIGHT:0];
integer i;

    always @( posedge clk or posedge rst) begin
            dataout_a <= 16'b0;
            dataout_b <= 16'b0;
        for (i=0;i<=HEIGHT;i=i+1) 
		begin
		memo[i]<=0;
		end
	end
//OPERATION FOR A BUS
	always @(posedge clk) begin
            if (we_a) begin 
		memo[addr_a] <= data_a;
		end
		else begin 
		dataout_a <= memo[addr_a];
		end
	end
//OPERATION FOR A BUS
	always @(posedge clk) begin
            if (we_b) begin
 	        memo[addr_b] <= data_b;
		end
		else begin
		dataout_b <= memo[addr_b];
		end
               
        end

endmodule
