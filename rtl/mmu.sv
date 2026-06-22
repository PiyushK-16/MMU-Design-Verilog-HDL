// Code your design here
module mmu (
    input  [15:0] virt_addr,
    input         access_type,
    input         enable,

    output reg [15:0] phys_addr,
    output reg page_fault,
    output reg protection_fault,
    output reg translation_valid
);

reg valid_bit [0:255];
reg [7:0] frame_num [0:255];
reg read_perm [0:255];
reg write_perm [0:255];

wire [7:0] page_num;
wire [7:0] offset;

assign page_num = virt_addr[15:8];
assign offset   = virt_addr[7:0];

integer i;

initial begin

    for(i=0;i<256;i=i+1) begin
        valid_bit[i] = 0;
        frame_num[i] = 0;
        read_perm[i] = 0;
        write_perm[i] = 0;
    end

    valid_bit[8'h01] = 1;
    frame_num[8'h01] = 8'h10;
    read_perm[8'h01] = 1;
    write_perm[8'h01] = 1;

    valid_bit[8'h02] = 1;
    frame_num[8'h02] = 8'h20;
    read_perm[8'h02] = 1;
    write_perm[8'h02] = 0;

end

always @(*) begin

    phys_addr = 16'h0000;
    page_fault = 0;
    protection_fault = 0;
    translation_valid = 0;

    if(enable) begin

        if(valid_bit[page_num] == 0) begin
            page_fault = 1;
        end
        else begin

            if(access_type && !write_perm[page_num]) begin
                protection_fault = 1;
            end
            else begin
                phys_addr =
                {frame_num[page_num],offset};

                translation_valid = 1;
            end

        end
    end
end

endmodule