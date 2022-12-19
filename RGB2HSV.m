function HSV=RGB2HSV(RGB)
[M,N,L]=size(RGB);
HSV(1:M,1:N,1:L)=0;
for m=1:M
    for n=1:N
        r=RGB(m,n,1); g=RGB(m,n,2); b=RGB(m,n,3);
        Max = max(r,max(g,b));
        Min = min(r,min(g,b));
        C = Max-Min;
        V = Max;
        if (Max == Min) S = 0;
        else S = Max-Min;
        end;
        if (Max == Min) H = 0;
        elseif (r == Max) H = ((g-b))/C;
            elseif (g == Max) H = 2 + (b-r)/C;
                elseif (b == Max) H = 4 + (r-g)/C;
        end;  
        H=H*pi/3;
        HSV(m,n,1)=H;
        HSV(m,n,2)=S;
        HSV(m,n,3)=V;
    end;
end;
return;
