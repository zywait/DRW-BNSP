
function prerwr=RWR(SIM,as,r)
       %���룺pp=RWR(llfs,LD,r)  ���� 
%������mirna ���i������֮���ֵ��rΪ�������ӣ�MMû�й�һ��
bb=sum(SIM);        %����mirna����֮��
[cc,dd]=size(SIM);  % ccΪ��
for i=1:dd
    if(bb(1,i)~=0)
    w(:,i)=SIM(:,i)/bb(1,i);
    else w(:,i)=zeros(cc,1);  %cc����1��0����
    end
end                   %�й�һ

 
    sumas=sum(as);
    nd=size(as,2); 
    nm=size(as,1); 
for i=1:nd
if(sumas(1,i)~=0)
    seed(:,i)=as(:,i)/sumas(1,i);
    else seed(:,i)=zeros(nm,1);  %nm����1��0����
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
