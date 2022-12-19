clear all;
I=[1  1  5  6  8
    0  0  5  7  1
    4  5  7  1  2
    8  5  1  2  0];
[N,M]=size(I);
G=max(max(I))-min(min(I))+1;
CM(1:G,1:G)=0;
sudut=0;
switch sudut
    case 0
        dx=1; dy=0;
        N0=1; N1=N;
        M0=1; M1=M-1;
    case 45
        dx=1; dy=-1;
        N0=2; N1=N;
        M0=1; M1=M-1;
    case 90
        dx=0; dy=-1;
        N0=2; N1=N;
        M0=1; M1=M;
    case 135
        dx=-1; dy=-1;
        N0=2; N1=N;
        M0=2; M1=M; 
end

for n=N0:N1
    for m=M0:M1
        CM(I(n,m)+1, I(n+dy,m+dx)+1) = CM(I(n,m)+1, I(n+dy,m+dx)+1) +1;
        CM(I(n+dy,m+dx)+1, I(n,m)+1) = CM(I(n+dy,m+dx)+1, I(n,m)+1) +1;
    end
end
CM
[mean,var,cont,diss,hom,Corr,ent,enr] = fitur_GLCM_sudut_ganda(CM)