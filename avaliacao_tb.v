module principal_tb;
 
    reg e1_in ,e0_in;
    reg p3_in,p2_in,p1_in,p0_in;

    wire y1_out,y0_out;
    wire seg_a_out, seg_b_out, seg_c_out, seg_d_out;
    wire seg_e_out, seg_f_out, seg_g_out;

    integer i,j;
principal DUT (

    .e1(e1_in),
    .e0(e0_in),
    .p0(p0_in),  //conectando o princiapl com o teste para ver as ondas 
    .p1(p1_in),
    .p2(p2_in),
    .p3(p3_in),
    .y1(y1_out),
    .y0(y0_out),

    .seg_a(seg_a_out),
    .seg_b(seg_b_out),
    .seg_c(seg_c_out),
    .seg_d(seg_d_out),
    .seg_e(seg_e_out),
    .seg_f(seg_f_out),
    .seg_g(seg_g_out)


);

initial begin
    $dumpfile("simulacao.vcd"); // GARANTE que o nome do arquivo seja simulacao.vcd
    $dumpvars(0, principal_tb);  // CORRIGIDO: Monitora o módulo principal_tb
end

initial begin
    e1_in = 1'b0; e0_in = 1'b0; p3_in = 1'b0; p2_in = 1'b0; p1_in = 1'b0; p0_in = 1'b0; 
#10;



        for (i=0;i<4;i=i+1)begin			
            e1_in= i[1];//i=0 00,i=1 01,i=2 10 ,i=3 11=   entao esse daqui recebe o bit mais sinificativo
            e0_in= i[0];//tratando como um vetor de bits e acessando a possição especifica   e esse o nit menos significativo
        
        for (j=0;j<16;j=j+1)begin
            p0_in=j[0];
            p1_in=j[1];
            p2_in=j[2];
            p3_in=j[3];

            #10;
        end

    end


$finish; 	
end				
endmodule

