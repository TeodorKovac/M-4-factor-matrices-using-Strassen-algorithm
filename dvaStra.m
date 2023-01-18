
L=nasob(4);
T=reshape(L,16,16*16);
A=zeros(16,49);
B=zeros(16,49);
C=zeros(16,49);
A1=zeros(16,4);
A0=[1,0,1,0,1,-1,0;0,1,0,0,0,1,0;0,0,0,0,1,0,1;1,1,0,1,0,0,-1];
B0=[1,1,0,-1,0,1,0;0,0,0,1,0,0,1;0,0,1,0,0,1,0;1,0,-1,0,1,0,1];
C0=[1,0,0,1,-1,0,1;0,0,1,0,1,0,0;0,1,0,1,0,0,0;1,-1,1,0,0,1,0];
XX=[1,3,9,11;2,4,10,12;5,7,13,15;6,8,14,16];
X=XX';
Y=reshape(X,16,1);


for kk=1:7
A1=zeros(16,4);
for j=1:4
    for k=1:4
            a=zeros(16,1);
            a(Y(4*(j-1)+k),1)=A0(k,kk);
            A1(:,j)=A1(:,j)+a;
    end
end
for i=1:7
    for h=1:4
     A(:,i+7*(kk-1))=A(:,i+7*(kk-1))+A0(h,i)*A1(:,h);
    end
end
end

for kk=1:7
B1=zeros(16,4);
for j=1:4
    for k=1:4
            b=zeros(16,1);
            b(Y(4*(j-1)+k),1)=B0(k,kk);
            B1(:,j)=B1(:,j)+b;
    end
end
for i=1:7
    for h=1:4
     B(:,i+7*(kk-1))=B(:,i+7*(kk-1))+B0(h,i)*B1(:,h);
    end
end
end

for kk=1:7
C1=zeros(16,4);
for j=1:4
    for k=1:4
            c=zeros(16,1);
            c(Y(4*(j-1)+k),1)=C0(k,kk);
            C1(:,j)=C1(:,j)+c;
    end
end
for i=1:7
    for h=1:4
     C(:,i+7*(kk-1))=C(:,i+7*(kk-1))+C0(h,i)*C1(:,h);
    end
end
end
preznaceni=C;
C=B;
B=preznaceni;
clearvars preznaceni X XX h i j k kk a b c;


err = T - A*krb(C,B)';
errrr=norm(err)