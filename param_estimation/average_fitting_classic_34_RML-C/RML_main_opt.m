%run n subjects and launch data analysis scripts

function perf=RML_main_opt(arg,bfm)

S=cell(arg.nsubj,1);

for s=1:arg.nsubj
    S{s}=kenntask_gottl(arg,bfm);
end


perf=second_level_an_opt(S,arg);