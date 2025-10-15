module principal (
    input e1,
    input e0, 
    input p3, 
    input p2,
    input p1,
    input p0,

//saidas normais
    output y1, 
    output y0 ;


//display
    output seg_a,
    output seg_b,
    output seg_c,
    output seg_d,
    output seg_e,
    output seg_f,
    output seg_g


//variaveis q vai armazenar o resultado do always
    
);
    reg y1_fio,
    reg y0_fio,

    reg[6:0] segmentos;


    assign y1 = y1_fio;
    assign y0 = y0_fio;
    assign {seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g}=segmentos;

    initial begin 
        y1_fio=1'b0;//inicializamos os valores com 0 para nao dar erro de xxxxxxx lixo de memoria 
        y0_fio=1'b0;
        segmentos=7'b0000000;
    end
 always @(*) begin//sensivel a qualquer mudanca de entrada 
        
        
       //bit mais significativo
        y1_reg <= e1 | (~e0 & p3) | (p2 & p1 & ~p0) | (p2 & p0 & ~p3); 
        
        // bit menos significativo
        y0_reg <= (e1 & ~p3) | (e1 & ~p2) | (e1 & p1 & p0) | (~e1 & e0) | (~e1 & p3);
    end


always @(*) begin
 case ({y1_reg, y0_reg}) 
2'b00: segmentos_reg <= 7'b0001100; 

2'b01: segmentos_reg <= 7'b1111010;

2'b10 segmentos_reg  <= 7'b1111100;

2'b11 segmentos_reg  <= 7'b1110011;
 endcase
    end

endmodule