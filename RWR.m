
function prerwr=RWR(SIM,as,r)
       %输入：pp=RWR(llfs,LD,r)  或者 
%求所有mirna 与第i个疾病之间的值，r为重启因子，MM没有归一化
bb=sum(SIM);        %所有mirna各行之和
[cc,dd]=size(SIM);  % cc为行
for i=1:dd
    if(bb(1,i)~=0)
    w(:,i)=SIM(:,i)/bb(1,i);
    else w(:,i)=zeros(cc,1);  %cc乘以1的0矩阵
    end
end                   %列归一

 
    sumas=sum(as);
    nd=size(as,2); 
    nm=size(as,1); 
for i=1:nd
if(sumas(1,i)~=0)
    seed(:,i)=as(:,i)/sumas(1,i);
    else seed(:,i)=zeros(nm,1);  %nm乘以1的0矩阵
    end
end
  
  
  

prerwr=[];
for di=1:nd
  
  p0=seed(:,di);
  p1=p0;
  p=(1-r)*w*p1+r*p0;
while max(p-p1)>10^(-6)
    p1=p;
    p=(1-r)*w*p1+r*p0;
end
    
  prerwr=[prerwr p];
end
