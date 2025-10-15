module principal (
    input e1,
    input e0, 
    input p3, 
    input p2,
    input p1,
    input p0,

//saidas normais
    output y1, 
    output y0 


//display
    output seg_a,
    output seg_b,
    output seg_c,
    output seg_d,
    output seg_e,
    output seg_f,
    output seg_g


//variaveis q vai armazenar o resultado do always
    reg y1_fio;
    reg y0_fio;

    reg[6:0] segmentos;
);



    assign y1 = e1 | (~e0 & p3) | (p2 & p1 & ~p0) | (p2 & p0 & ~p3); 
    assign y0 = (e1 & ~p3) | (e1 & ~p2) | (e1 & p1 & p0) | (~e1 & e0) | (~e1 & p3); 
endmodule