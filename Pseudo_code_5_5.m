function regiongrowingseg()
clear all;
Im=double(imread('brain_tumor_fluorescent.jpg'));
figure(1), imshow(uint8(Im));title('Citra Asli');
p = impoint(gca,[]);
p = wait (p);
x=round(p(1,1));
y=round(p(1,2));
RGB=Im(y,x,:);
Th=47;
[M,N,L]=size(RGB);
if L==1
    [SP,RG] = regiongrowingGray(Im,RGB,Th);
else
    [SP,RG] = regiongrowingHCL(Im,RGB,Th);
end
figure(2), imshow(uint8(SP));title('Seed Points');
figure(3), imshow(uint8(RG));title('Region Growing');

function [SP,RG] = regiongrowingGray(Im,S,Th)
[m,n,l]=size(Im);
SP(l:m,l:n)=0;
for i=1:m
    for j=1:n
        if abs(Im(i,j)-S)<=5
            SP(i,j)=Im(i,j);
        end
    end
end
RG=SP;
for i=2:m-1
    for j=2:n-1
        Sd=RG(i,j);
        if(Sd>0)
            F=Im(i-1:i+1,j-1:j+1);
            D=abs(F-S);
            MinD=min(min(D));
            AD=(sum(sum(D)))/9.0;
            if (AD<=Th) || MinD<=Th
                RG(i-1:i+1,j-1:j+1)=F;
            end
        end
    end
end
            
 for i=m-1 :-1:2
    for j=n-1:-1:2
        Sd=RG(i,j);
        if(Sd>0)
            F=Im(i-1:i+1,j-1:j+1);
            D=abs(F-S);
            MinD=min(min(D));
            AD=(sum(sum(D)))/9.0;
            if (AD<=Th) || MinD<=Th
                RG(i-1:i+1,j-1:j+1)=F;    
            end
        end
    end
 end
return
function [SP,RG] = regiongrowingHCL(Im,S,Th)
Ref=RGB2HCL(S);
Href=Ref(1,1,1);
Cref=Ref(1,1,2);
Lref=Ref(1,1,3);
HCL=RGB2HCL(Im);
[m,n,l]=size(Im);
SP(1:m,1:n,1:l)=0;
AL = 1.4456;
AC = (0.16*pi/180);
for i=1:m
    for j=1:n
        dH=HCL(i,j,1)-HRef;
        C=HCL(i,j,2);
        dC=C^2+CRef^2;
        dL=(HCL(i,j,3)-LRef)^2;
        ACH = abs(dH) + AC;
        dCh=2*CRef*C*cos(dH);
        Dhcl=sqrt(AL*dL+ACH*(dC-dCH));
        if Dhc1 <=5.0
            SP(i,j,:)=Im(i,j,:);
        end;
    end
end
RG=SP;
for i=2:m-1
    for j=2:n-1
        S=sum(RG(i,j,1:3));
        if (S>0)
            dH=HCL(i-1,i+1,j-1,j+1,1)-HRef;
        C=HCL(i-1,i+1,j-1,j+1,2);
        dL=(HCL(i-1,i+1,j-1,j+1,3)-LRef).^2;
        ACH = abs(dH) + AC;
        dC=(C.^2+CRef^2)-2*CRef*(C.*cos(dH));
        Dmin=min(min(Dm));
        Dhc1=sum(sum(Dm))/9.0;
        if Dhcl <=Th || Dmin<=Th
            RG(i-1,i+1,j-1,j+1,:)=Im(i-1,i+1,j-1,j+1,:);
        end;
        end
    end
end
for i=m-1:-1:2
    for j=n-1:-1:2
        S=sum(RG(i,j,1:3));
        if (S>0)
            dH=HCL(i-1,i+1,j-1,j+1,1)-HRef;
        C=HCL(i-1,i+1,j-1,j+1,2);
        dL=(HCL(i-1,i+1,j-1,j+1,3)-LRef).^2;
        ACH = abs(dH) + AC;
        dC=C.^2+CRef^2-2*CRef*(C.*cos(dH));
        Dm=((AL*dL)+(ACH.*dC)).^0.5;
        DMin=min(min(Dm));
        Dhc1=sum(sum(Dm))/9.0;
        if Dhcl <=Th || DMin<=Th
            RG(i-1,i+1,j-1,j+1,:)=Im(i-1,i+1,j-1,j+1,:);
        end
        end
    end
end
return