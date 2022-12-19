clear all;
HSV_solid(1:375,1:575,1:3)=230;
q=6;
Th=round(255/q);
Thpi0=pi/20;
Thpi=(pi-Thpi0)/10;
for b=0:255
    for g=0:255
        for r=0:255
             Max = max(r,max(g,b)); 
             Min = min(r,min(g,b)); 
             C = Max-Min;
             V = Max;
            if(Max == Min) S = 0;
                else S = C;
            end;
            if (Max==Min) H=0;
                elseif (r == Max) H = ((g - b))/C;
                elseif (g == Max) H = 2 + (b - r)/C;
                elseif (b == Max) H = 4 + (r - g)/C;
            end;
            H=H*pi/3;
        j=285 + floor(S*cos(H));
        i=350 - floor(S*sin(H)/4.0 + V);
        HSV_solid(i,j,1)=r;
        HSV_solid(i,j,2)=g;
        HSV_solid(i,j,3)=b;
        end;
    end;
end;

MinH=-360;
for b=0:255
    for g=0:255
        for r=0:255
             Max = max(r,max(g,b)); 
             Min = min(r,min(g,b)); 
             C = Max-Min;
             V = Max;
                if(Max == Min) S = 0;
                    else S = C;
                end;
                if (Max==Min) H=0;
                    elseif (r == Max) H = ((g - b))/C;
                    elseif (g == Max) H = 2 + (b - r)/C;
                    elseif (b == Max) H = 4 + (r - g)/C;
                end;
                H=H*pi/3;
                MinH=max(MinH,H);
              j=285 + floor(S*cos(H));
              i=350 - floor(S*sin(H)/4.0 + V);
          
          if((mod(C,Th)==0 || (mod(H,Thpi)<=0.012)) && C==V && ((H>=-pi/3&&H<-0.15)...
              || H>=pi+0.1)) ||...
              (V==255 && (mod(C,Th)==0) || C==255) || ((mod(H,Thpi)<=0.012)&&V==255&&(H>=0.2 ||H<=-0.2))
            HSV_solid(i,j,1)=0;
            HSV_solid(i,j,2)=0;
            HSV_solid(i,j,3)=0;
          end
        end;
    end;
end;
figure(1), imshow(uint8(HSV_solid));

            