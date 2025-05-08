%main script gridsearch horan gottlieb individual differences



nrep=30;

RW=[2,1];

load bfm;

datapath=spm_select(1,'.mat','select behavioural data');

M_perf=importdata(datapath);

res_buff=spm_select(1,'.mat','select first passage optim results');

load(datapath);
load(res_buff);


%Second optimization passage

DA=[res_buff(1)-.2, res_buff(1)-.1,res_buff(1),res_buff(1)+.1,res_buff(1)+.2];
NE=[res_buff(2)-.2, res_buff(2)-.1,res_buff(2),res_buff(2)+.1,res_buff(2)+.2];
G=[res_buff(3)-.1, res_buff(3)-.05,res_buff(3),res_buff(3)+.05,res_buff(3)+.1];


ncycl=length(DA)*length(NE)*length(G);

MSE=zeros(length(DA),length(NE),length(G));


count=1;
clc
disp('Second passage: 0%');

for da=1:length(DA)
    for ne=1:length(NE)
        for g=1:length(G)

            param_set=[DA(da),NE(ne),G(g)];
            arg = param_build(param_set,RW,nrep);

            perf = RML_main_opt(arg,bfm);
            MSE(da,ne,g)=mean((M_perf-perf).^2);
            clc
            disp(['Second passage: ' num2str(100*count/ncycl) '%']);

            count=count+1;
        end
    end
end

 %select MMSE parameters
    [~,i]=min(MSE(:));
    [optda,optne,optg]=ind2sub(size(MSE),i);
res= [DA(optda),NE(optne),G(optg) min(MSE(:))]

save([datapath(end-11:end-4) '_res'],'res');






