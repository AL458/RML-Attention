%run n subjects and launch data analysis scripts

function dat=RML_main_opt_sim(arg,bfm)

S=cell(arg.nsubj,1);


for s=1:arg.nsubj
    S{s}=kenntask_gottl(arg,bfm);
end


beta=second_level_an_opt_sim_GLM(S,arg);

[res]=second_level_an_opt_sim(S,arg);

dat.res=res;
dat.beta=beta;