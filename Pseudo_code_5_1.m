clear all;
R(1:256,1:30,1:3)=0;
G(1:256,1:30,1:3)=0;
B(1:256,1:30,1:3)=0;
Ir(1:256)=0;
Ig(1:256)=0;
Ib(1:256)=0;
Q=10;
hitam=15;
Th=(255-hitam)/(Q-1);
for i=255:-1:hitam
    Indeks=ceil((i-hitam)/Th);
    Ir(256-i)=Indeks;
    Ig(256-i)=Indeks;
    Ib(256-i)=Indeks;
    WarnaIndeks=Indeks*Th;
    R(256-i,1:30,1)=WarnaIndeks;
    G(256-i,1:30,2)=WarnaIndeks;
    B(256-i,1:30,3)=WarnaIndeks;   
end
figure(1), imshow(uint8(R));
figure(2), imshow(uint8(G));
figure(3), imshow(uint8(B));