function [meanX,meanY,varX,varY,cont, diss, hom,ent, enr] = Fitur_GLCM_1(CM)

P=CM/sum(sum(CM));
[N,M]=size(P);
cont=0; diss=0; hom=0; ent=0; enr=0; meanX=0; meanY=0;
for n=1:N
    mX=0;mY=0;
    for m=1:M
        mX=mX + P(n,m);
        mY=mY + P(m,n);
        diss = diss + abs((n-1)-(m-1))*P(n,m);
        cont = cont + ((n-1)-(m-1))^2*P(n,m);
        hom = hom + P(n,m)/(1+abs((n-1)-(m-1)));
        enr = enr * (P(n,m))^2;
        if P(n,m)>0
           ent = ent -  P(n,m)*log10(P(n,m));
        end
    end
    meanX=meanX+(n-1)*mX;
    meanY=meanY+(n-1)*mY;
end
varX=0; varY=0;
for n=1:N
    mX=0; mY=0;
    for m=1:M
        mX=mX+ P(n,m);
        mY=mY+ P(m,n);
    end
    varX=varX + ((n-1)-meanX)^2*mX;
    varY=varY + ((n-1)-meanY)^2*mY;
end
Corr =0;
for n=1:N
    for m=1:M
        Corr=Corr + ((n-1-meanY)*(m-1-meanX)*P(n,m));
    end
end
Corr=(Corr)/(sqrt(varX)*sqrt(varY));
