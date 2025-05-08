%run n subjects and launch data analysis scripts

function dat=RML_main_opt_sim(arg,bfm,Nsess)

S=cell(arg.nsubj,1);


for s=1:arg.nsubj
    S{s}=kenntask_gottl(arg,bfm);
end


res_beta=second_level_an_opt_sim_GLM(S,arg,Nsess);

[res]=second_level_an_opt_sim(S,arg);

dat.res=res;
dat.beta=res_beta.beta_mean;
dat.betastd=res_beta.beta_std;
dat.betadis=res_beta.notNormal;%0 means normally distributed