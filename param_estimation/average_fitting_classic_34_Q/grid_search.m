%main script gridsearch horan gottlieb individual differences
function res=grid_search(M_perf,RW,nrep,bfm)


%First optimization passage
R=[1 1.4 1.8 2.2];
H=1;%[.4 .6 .8 1];
HT=[.2 .4 .6 .8];%Temp
G=[.1 .2 .3 .4];

MSE_buff=zeros(length(R),length(H),length(HT),length(G));

for da=1:length(R)
    for h=1:length(H)
        for ne=1:length(HT)
            for g=1:length(G)
                param_set=[R(da),H(h),HT(ne),G(g)];
                arg = param_build(param_set,RW,nrep);

                perf = RML_main_opt(arg,bfm);
                MSE_buff(da,h,ne,g)=mean((M_perf-perf).^2);
            end
        end
    end
end

 %select MMSE parameters
    [~,i]=min(MSE_buff(:));
    [optda,opth,optne,optg]=ind2sub(size(MSE_buff),i);


%Second optimization passage
R=[R(optda)-.2,R(optda),R(optda)+.2];
% H=[H(opth)-.1,H(opth),H(opth)+.1];
HT=[HT(optne)-.1,HT(optne),HT(optne)+.1];
G=[G(optg)-.05,G(optg),G(optg)+.05];


MSE=zeros(length(R),length(H),length(HT),length(G));


for da=1:length(R)
    for h=1:length(H)
        for ne=1:length(HT)
            for g=1:length(G)
                param_set=[R(da),H(h),HT(ne),G(g)];
                arg = param_build(param_set,RW,nrep);

                perf = RML_main_opt(arg,bfm);
                MSE(da,h,ne,g)=mean((M_perf-perf).^2);
                clc
            end
        end
    end
end

%select MMSE parameters
[~,i]=min(MSE(:));
[optda,opth,optne,optg]=ind2sub(size(MSE),i);
res= [R(optda),H(opth),HT(optne),G(optg) min(MSE(:))];

%simulate session with optimal parameters

param_set=[res(1),res(2),res(3),res(4)];
arg = param_build(param_set,RW,nrep);

perf = RML_main_opt_sim(arg,bfm);

res=[res perf];









