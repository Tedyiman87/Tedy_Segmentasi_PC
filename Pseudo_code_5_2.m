clear all;
RGB_solid(1:425,1:425,1:3)=230;
sudut = -5*pi/6; Q=8;
Th=round(255/Q)
for b=1:255
    for g=1:255
        for r=1:255
            j = 150 + floor(g + (b*sin(sudut)));
            i = 280 - floor(b*sin(sudut));
            if mod(r,Th)==0 || mod((g),Th)==0 || mod((b),Th)==0 || (r==255 && g==255) ||(r==255 && b==255) || (b==255 && g==255)
                
                RGB_solid(i,j,1)=0;
                RGB_solid(i,j,2)=0;
                RGB_solid(i,j,3)=0;
            else
                RGB_solid(i,j,1)=ceil(r/Th)*Th;
                RGB_solid(i,j,2)=ceil(r/Th)*Th;
                RGB_solid(i,j,3)=ceil(r/Th)*Th;
            end
        end
    end
end
figure, imshow(uint8(RGB_solid));
