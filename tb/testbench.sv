// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module mmu_tb;

reg [15:0] virt_addr;
reg access_type;
reg enable;

wire [15:0] phys_addr;
wire page_fault;
wire protection_fault;
wire translation_valid;

mmu DUT(
    .virt_addr(virt_addr),
    .access_type(access_type),
    .enable(enable),
    .phys_addr(phys_addr),
    .page_fault(page_fault),
    .protection_fault(protection_fault),
    .translation_valid(translation_valid)
);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0,mmu_tb);

    enable = 1;

    // Valid Read
    virt_addr = 16'h0123;
    access_type = 0;
    #20;

    // Valid Write
    virt_addr = 16'h0134;
    access_type = 1;
    #20;

    // Read Allowed
    virt_addr = 16'h02AA;
    access_type = 0;
    #20;

    // Write Not Allowed
    virt_addr = 16'h02AA;
    access_type = 1;
    #20;

    // Invalid Page
    virt_addr = 16'h05AA;
    access_type = 0;
    #20;

    $finish;
end

initial begin
    $monitor(
    "T=%0t VA=%h PA=%h PF=%b PROT=%b VALID=%b",
    $time,
    virt_addr,
    phys_addr,
    page_fault,
    protection_fault,
    translation_valid
    );
end

endmodule