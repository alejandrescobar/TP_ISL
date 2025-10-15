module principal (
    input e1,
    input e0, 
    input p3, 
    input p2,
    input p1,
    input p0,
    output y1, 
    output y0 
);
    assign y1 = e1 | (~e0 & p3) | (p2 & p1 & ~p0) | (p2 & p0 & ~p3); 
    assign y0 = (e1 & ~p3) | (e1 & ~p2) | (e1 & p1 & p0) | (~e1 & e0) | (~e1 & p3); 
endmodule