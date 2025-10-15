module tb_design_ram();
reg clk;
reg rst;
reg we_a;
reg we_b;
reg [7:0] addr_a;
reg [7:0] addr_b;
reg [15:0] data_a;
reg [15:0] data_b;
wire [15:0] dataout_a;
wire [15:0] dataout_b;
design_ram_Nxeight DUT(.clk(clk), .rst(rst), .we_a(we_a), .we_b(we_b),
.addr_a(addr_a), .addr_b(addr_b), .data_a(data_a), .data_b(data_b), .dataout_a(dataout_a), .dataout_b(dataout_b));

initial begin
clk = 1;
forever #10 clk = ~clk;
end
initial begin
rst = 1;
we_a = 0;
we_b = 0;
addr_a = 0;
addr_b = 0;
data_a = 0;
data_b = 0;
$monitor("Time=%d : reset = %b, clk = %b, out_a = %h, out_b = %h", $time, rst, clk, dataout_a, dataout_b);
#10;
rst = 0;

$display("TESTCASE_1");
$display("write operation through A bus");

we_a=1; addr_a=0; data_a=0; #10;
we_a=1; addr_a=2; data_a=20; #10;
we_a=1; addr_a=4; data_a=40; #10;
we_a=1; addr_a=6; data_a=60; #10;


rst=1; #10;
rst=0; #10;

$display("TESTCASE_2");
$display("write operation through B bus");

we_b=1; addr_b=0; data_b=0; #10;
we_b=1; addr_b=2; data_b=20; #10;
we_b=1; addr_b=4; data_b=40; #10;
we_b=1; addr_b=6; data_b=60; #10;


$display("TESTCASE_3");
$display("Read operation from B bus to A data");

we_b=0; addr_a=0;#10 
we_b=0; addr_a=2; #10
we_b=0; addr_a=4; #10
we_b=0; addr_a=6; #10

$display("TESTCASE_4");
$display("Read operation from A bus to B data");

we_a=0; addr_b=0; #10 
we_a=0; addr_b=2; #10
we_a=0; addr_b=4; #10
we_a=0; addr_b=6; #10

$display("TESTCASE_5");
$display("Read amd Write at a time");


we_a=1; addr_a=9; data_a=90;
we_b=0; addr_b=6; #10
we_b=1; addr_b=8; data_b=80;
we_a=0; addr_b=9; #10

rst=1;#20 
rst =0;#50
$finish;
end
endmodule
