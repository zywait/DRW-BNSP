
clear
clc 
load('data352');
  r=0.9;
ncRNA_disease_Y=LD;

[nnc,nd]=size(LD);
 ddfs=getSimilarityDisease_1(LD',DD);
LL1=miRNASS( LD, DD );
llfs=getSimilarityRNA_1(LD',LL1);


   rwrDD=RWR(ddfs,LD',r);
   rwrDD=rwrDD';
   rwrLL=RWR(llfs,LD,r);
  rwrLLDD=rwrLL*0.5+rwrDD*0.5;

  ldpl= PROJECTT(llfs,rwrLLDD);
  ldpd= PROJECTT(ddfs,rwrLLDD');
  ldpd=ldpd';
  prevalue=ldpl*0.5+ldpd*0.5;

