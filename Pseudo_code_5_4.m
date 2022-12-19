clear all;
I=imread('face2.jpg');
I1=I;
[N,M,L]=size(I);
Q=4;
Th=255/Q;
RGBidx=round(double (I)/Th);
RGBpeta=round(RGBidx*Th);
figure(1), imshow(I);
figure(2), imshow(uint8(RGBpeta));

for n=1:N
    for m=1:M-1
        a=(RGBidx(n,m,1)-RGBidx(n,m+1,1))^2;
        b=(RGBidx(n,m,2)-RGBidx(n,m+1,2))^2;
        c=(RGBidx(n,m,3)-RGBidx(n,m+1,3))^2;
        if sqrt(a+b+c)>0
            I(n,m,:)=255;
        end
    end
end

for n=1:N-1
    for m=1:M
        d=(RGBidx(n,m,1)-RGBidx(n+1,m,1))^2;
        e=(RGBidx(n,m,2)-RGBidx(n+1,m,2))^2;
        f=(RGBidx(n,m,3)-RGBidx(n+1,m,3))^2;
        if sqrt(d+e+f)>0
            I(n,m,:)=255;
        end
    end
end
figure(3), imshow(uint8(I));

HSV=rgb2hsv(I1);
QH=6.0;
HTh=1/QH;
QS=3.0;
STh = 1/QS;
QV=4.0;
VTh= 1/QV;

HSVidx = round(HSV(:,:,1)/HTh)*HTh*2*pi;
HSVidx(:,:,2) = round(HSV(:,:,2)/STh);
HSVidx(:,:,3) = round(HSV(:,:,3)/VTh);

HSVpeta = round(HSV(:,:,1)/HTh)*HTh;
HSVpeta(:,:,2) = HSVidx(:,:,2)*STh;
HSVpeta(:,:,3) = HSVidx(:,:,3)*VTh;

for n=1:N
    for m=1:M
        if HSVidx(n,m,3)==0 || HSVidx(n,m,2)==0
            HSVidx(n,m,1)=0; HSVidx(n,m,2)=0;
            HSVpeta(n,m,1)=0;  HSVidx(n,m,2)=0;
        end
    end
end
figure(4), imshow((HSVpeta),[]);
for n=1:N
    for m=1:M-1
        S1=HSVidx(n,m,2); S2=HSVidx(n,m+1,2);
        dH=HSVidx(n,m,1)-HSVidx(n,m+1,1);
        Cos=2*S1*S2*cos(dH);
        dV=(HSVidx(n,m,3)-HSVidx(n,m+1,3))^2;
        if sqrt(dV+S1^2+S2^2-Cos)>0
            I1(n,m,:)=255;
        end
    end
end
for n=1:N-1
    for m=1:M
        S1=HSVidx(n,m,2); S2=HSVidx(n+1,m,2);
        dH=HSVidx(n,m,1)-HSVidx(n+1,m,1);
        Cos=2*S1*S2*cos(dH);
        dV=(HSVidx(n,m,3)-HSVidx(n+1,m,3))^2;
        if sqrt(dV+S1^2+S2^2-Cos)>0
            I1(n,m,:)=255;
        end
    end
end
figure(5), imshow(uint8(T1));           
            

