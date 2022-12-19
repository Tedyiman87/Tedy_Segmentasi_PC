function SegmentasiCitra()
clear all;
Im=double(imread('brain_tumor_fluorescent.jpg'));
figure(1), imshow(uint8(Im));title('Citra asli');
p = impoint(gca,[]);
p = wait (p);
x=round(p(1,1));
y=round(p(1,2));
RGB=Im(y,x,:);
Th=47;

HSV=RGB2HSV(RGB);
HCL=RGB2HCL(RGB);
Hhcl=HCL(:,:,1);
Chc11=HCL(:,:,2);
Lhcl=HCL(:,:,3);
H1=HSV(:,:,1);
S1=HSV(:,:,2);
V1=HSV(:,:,3);

citra_hsv=RGB2HSV(Im);
citra_hcl=RGB2HCL(Im);
[m,n,l]=size(citra_hsv);

cit_hasilHSV(1:m,1:n,1:1)=uint8(0);
cit_hasilRGB(1:m,1:n,1:1)=uint8(0);
cit_hasilHCL(1:m,1:n,1:1)=uint8(0);

for i=1:m
    for j=1:n
        dR=(RGB(1,1,1)-Im(i,j,1))^2;
        dG=(RGB(1,1,2)-Im(i,j,2))^2;
        dB=(RGB(1,1,3)-Im(i,j,3))^2;
        if sqrt(dr+dG+dG)<=Th
            cit_hasilHSV(i,j,:)=Im(i,j,:);
        end;
        
        dH=citra_hsv(i,j,1)-H1;
        d2=citra_hsv(i,j,2);
        dV=(citra_hsv(i,j,3)-H1)^2;
        Dcyl=sqrt(dV+s1^2+S2^2-2*S1*S2*cos(dH));
        if Dcyl<=Th
            cit_hasilHSV(i,j,:)=Im(i,j,:);
        end;
        
        dHhcl=citra_hcl(i,j,1)-Hhcl;
        Chc12=citra_hcl(i,j,2);
        dLhcl=(citra_hcl(i,j,3)-Lhcl)^2;
        AL = 1.4456;
        ACH = abs(dHhcl) + (0.16*pi/180);
        dC = Chc11^2+Chc12^2;
        dCh = 2*Chc11*Chc12*cos(dHhcl);
        Dhcl=sqrt(AL*dLhcl+ACH*(dC-dCh));
        if Dhcl <= Th
            cit_hasilHCL(i,j,:)=Im(i,j,:);
        end;
    end;
end;
figure, imshow(cit_hasilHSV);
figure, imshow(cit_hasilRGB);
figure, imshow(cit_hasilHCL);
        