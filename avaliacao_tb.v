module principal_tb;
 
    reg e1_in ,e0_in;
    reg p3_in,p2_in,p1_in,p0_in;
    
    wire y1_out,y0_out;
    wire seg_a_out, seg_b_out, seg_c_out, seg_d_out;
    wire seg_e_out, seg_f_out, seg_g_out;

    integer i, j;

    principal DUT (
        .e1(e1_in), .e0(e0_in), .p0(p0_in), .p1(p1_in),
        .p2(p2_in), .p3(p3_in), .y1(y1_out), .y0(y0_out),
        .seg_a(seg_a_out), .seg_b(seg_b_out), .seg_c(seg_c_out),
        .seg_d(seg_d_out), .seg_e(seg_e_out), .seg_f(seg_f_out),
        .seg_g(seg_g_out)
    );

    initial begin
        $dumpfile("simulacao.vcd");
        $dumpvars(0, principal_tb);
    end

    initial begin
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                // O Verilog atribui os bits menos significativos do integer, que é o comportamento desejado.
                {e1_in, e0_in} = i;
                {p3_in, p2_in, p1_in, p0_in} = j;
                
                #10;
            end
        end
 
        #10; 
        $finish;
    end				
endmodule


