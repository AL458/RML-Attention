%group analysis for 2-armed bandid results

function [beta]=second_level_an_opt_sim_GLM(S,arg)

beta=zeros(arg.nsubj,3);

for s=1:arg.nsubj
    
    
    dat=S{s};
    
    
    buff_npr=cell(8,1);
    
    buff_npr3=cell(8,1);
    buff=cell(8,1);
    buff_LA=cell(8,1);
    
    dat.b(1:arg.nexcltri)=[];
    dat.LIP(1:arg.nexcltri)=[];
    dat.ttype(1:arg.nexcltri)=[];
    dat.rewtype(1:arg.nexcltri)=[];

    %exclude skipped trials
    dat.ttype(dat.LIP==0)=[];
    dat.rewtype(dat.LIP==0)=[];
    dat.LIP(dat.LIP==0)=[];
%     dat.b(dat.b==0)=[];

    %qui stima GLM per ogni soggetto
    [beta(s,:),dev,stats] = glmfit([dat.ttype dat.rewtype],dat.LIP);

end

%qui fai averaging betas e t values
    
beta=mean(beta,1);
   


