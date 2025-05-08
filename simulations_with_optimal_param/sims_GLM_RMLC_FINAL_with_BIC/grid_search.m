%main script gridsearch horan gottlieb individual differences
function res=grid_search(res,RW,nrep,bfm,Nsess)



%simulate session with optimal parameters

param_set=[res(1),res(2),res(3),res(4)];
arg = param_build(param_set,RW,nrep);

dat = RML_main_opt_sim(arg,bfm,Nsess);

res=[res(:,1:5) dat.res(:,1:20) dat.beta dat.res(:,21:end) dat.betastd dat.betadis];









