// avaliacao_tb.v (VERSÃO COM DEPURAÇÃO)
module principal_tb;
 
    // Entradas para o DUT
    reg e1_in ,e0_in;
    reg p3_in,p2_in,p1_in,p0_in;
    
    // Saídas do DUT
    wire y1_out,y0_out;
    wire seg_a_out, seg_b_out, seg_c_out, seg_d_out;
    wire seg_e_out, seg_f_out, seg_g_out;

    // Variáveis de controle para os loops
    reg [1:0] i;
    reg [3:0] j;

    // Instanciação do Módulo Principal (DUT)
    principal DUT (
        .e1(e1_in), .e0(e0_in), .p0(p0_in), .p1(p1_in),
        .p2(p2_in), .p3(p3_in), .y1(y1_out), .y0(y0_out),
        .seg_a(seg_a_out), .seg_b(seg_b_out), .seg_c(seg_c_out),
        .seg_d(seg_d_out), .seg_e(seg_e_out), .seg_f(seg_f_out),
        .seg_g(seg_g_out)
    );

    // Bloco para gerar o arquivo de forma de onda
    initial begin
        $dumpfile("simulacao.vcd");
        $dumpvars(0, principal_tb);
    end

    // Bloco para gerar os estímulos de entrada (COM MENSAGENS DE DEBUG)
    initial begin
        $display("--> INICIO: A simulação começou.");

        for (i = 0; i < 4; i = i + 1) begin
            $display("--> Loop externo: i = %d, Tempo = %0t", i, $time);
            for (j = 0; j < 16; j = j + 1) begin
                {e1_in, e0_in} = i;
                {p3_in, p2_in, p1_in, p0_in} = j;
                #10;
            end
        end

        $display("--> FIM: Os loops terminaram. Tempo = %0t", $time);
        #10; 
        $finish;
    end				
endmodule


// module principal_tb;
 
//     reg e1_in ,e0_in;
//     reg p3_in,p2_in,p1_in,p0_in;

//     wire y1_out,y0_out;
//     wire seg_a_out, seg_b_out, seg_c_out, seg_d_out;
//     wire seg_e_out, seg_f_out, seg_g_out;

//     reg [1:0] i;
//     reg [3:0] j;
//     principal DUT (

//         .e1(e1_in),
//         .e0(e0_in),
//         .p0(p0_in),  //conectando o princiapl com o teste para ver as ondas 
//         .p1(p1_in),
//         .p2(p2_in),
//         .p3(p3_in),
//         .y1(y1_out),
//         .y0(y0_out),

//         .seg_a(seg_a_out),
//         .seg_b(seg_b_out),
//         .seg_c(seg_c_out),
//         .seg_d(seg_d_out),
//         .seg_e(seg_e_out),
//         .seg_f(seg_f_out),
//         .seg_g(seg_g_out)


//     );

//     initial begin
//         $dumpfile("simulacao.vcd"); // GARANTE que o nome do arquivo seja simulacao.vcd
//         $dumpvars(0, principal_tb);  // CORRIGIDO: Monitora o módulo principal_tb
//     end

//     initial begin
//         e1_in = 1'b0; e0_in = 1'b0; p3_in = 1'b0; p2_in = 1'b0; p1_in = 1'b0; p0_in = 1'b0; 
//         for (i = 0; i < 4; i = i + 1) begin
//                 for (j = 0; j < 16; j = j + 1) begin
//                     // Aplica a combinação de entrada atual
//                     e1_in= i[1];
//                     e0_in= i[0];
//                     p0_in=j[0];
//                     p1_in=j[1];
//                     p2_in=j[2];
//                     p3_in=j[3];
                                        
//                     // Espera 10 unidades de tempo para que a saída se estabilize
//                     #10;
//                 end
//             end

//             // Adiciona um pequeno delay final antes de terminar
//             #10; 

//     $finish; 	
//     end				
// endmodule


