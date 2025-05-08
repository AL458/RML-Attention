%function for parallization of param estimation per session

function grid_search_parall(n_process,monkey,sessions)

RW=[2,1];

nrep=30;

load bfm;

monkey=num2str(monkey);

M_perf=importdata([monkey '.mat']);

M_perf=M_perf(sessions,:);

res=zeros(length(sessions),22);

for i=1:length(sessions)

    res(i,:)=grid_search(M_perf(i,:),RW,nrep,bfm);

end

save([monkey '_res_' num2str(n_process)],'res');