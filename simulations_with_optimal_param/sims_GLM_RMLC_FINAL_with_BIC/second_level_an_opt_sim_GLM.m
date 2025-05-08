%group analysis for 2-armed bandid results

function [res_beta]=second_level_an_opt_sim_GLM(S,arg,Nsess)

beta=zeros(arg.nsubj,3);

for s=1:arg.nsubj
    
    
    dat=S{s};
    
    
    buff_npr=cell(8,1);
    
    buff_npr3=cell(8,1);
    buff=cell(8,1);
    buff_LA=cell(8,1);
    
    dat.b(1:arg.nexcltri)=[];
    dat.D(1:arg.nexcltri)=[];
    dat.ttype(1:arg.nexcltri)=[];
    dat.rewtype(1:arg.nexcltri)=[];

    %exclude skipped trials
    dat.ttype(dat.b==0)=[];
    dat.rewtype(dat.b==0)=[];
    dat.D(dat.b==0)=[];
    dat.b(dat.b==0)=[];

    %qui stima GLM per ogni soggetto
    [beta(s,:),~,~] = glmfit([dat.ttype dat.rewtype],dat.b);

end
    
res_beta.beta_mean=mean(beta,1);
res_beta.beta_std=std(beta(:,2));%std of betas for IG (ttype)

[~,p]=kstest((beta(:,2)-mean(beta(:,2)))/std(beta(:,2)));%test normality of beta values distribution for IG (ttype)

res_beta.notNormal=p;


   


