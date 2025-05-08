%function for parallization of param estimation per session

function grid_search_parall(n_process,monkey,sessions)

RW=[2,1];

nrep=500;

load bfm;

monkey=num2str(monkey);

if monkey=='2'
   monkey2='M_S';
else
   monkey2='M_M';
end

M_perf=importdata([monkey2 '_res.mat']);

M_perf=M_perf(sessions,:);

res=zeros(length(sessions),30);

for i=1:length(sessions)

    res(i,:)=grid_search(M_perf(i,:),RW,nrep,bfm,length(sessions));

end

save([monkey '_res_' num2str(n_process)],'res');