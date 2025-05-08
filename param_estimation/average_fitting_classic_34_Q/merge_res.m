%this script merge the results from parall estimation

function merge_res(monkey,N_process)

monkey=num2str(monkey);

res=cell(N_process,1);

for i=1:N_process

    res{i}=importdata([monkey '_res_' num2str(i) '.mat']);

end

res=cell2mat(res);

if monkey=='2'
   monkey2='M_S';
else
   monkey2='M_M';
end

%save merged results
save([monkey2 '_res'],'res');

%delete partial results
system(['rm ' monkey '_res_*']);