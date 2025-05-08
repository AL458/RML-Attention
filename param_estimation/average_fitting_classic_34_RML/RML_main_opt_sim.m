%run n subjects and launch data analysis scripts

function perf_res=RML_main_opt_sim(arg,bfm)

S=cell(arg.nsubj,1);

for s=1:arg.nsubj
    S{s}=kenntask_gottl(arg,bfm);
end


perf_res=second_level_an_opt_sim(S,arg);