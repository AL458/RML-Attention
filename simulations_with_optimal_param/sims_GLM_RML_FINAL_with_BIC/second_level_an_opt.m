%group analysis for 2-armed bandid results

function perf=second_level_an_opt(S,arg)

nstate=size(arg.trans,1);

group=zeros(arg.nsubj,nstate,7);


for s=1:arg.nsubj

    dat=S{s};
    buff=cell(8,1);

    dat.optim(:,1:arg.nexcltri)=[];
    dat.respside(:,1:arg.nexcltri)=[];
    dat.k(:,1:arg.nexcltri)=[];

    for state=1:nstate%1st to 3rd order

        buff{state}(:,2)=dat.optim(state,dat.k(state,:)>0)';
        buff{state}(:,5)=dat.respside(state,dat.k(state,:)>0)';

        ntri=length(buff{state});%number of trials

        group(s,state,2)=mean(buff{state}(buff{state}(:,5)~=3,2));%exclude "stay" trials

        bufft=nan(ntri,1);

        for tri=1:ntri
            if buff{state}(tri,5)==3
                bufft(tri)=1;
            else
                bufft(tri)=0;
            end
        end

        group(s,state,5)=mean(bufft,'omitnan');%record all resp

    end
end

compl_inf=1-mean(squeeze(group(:,[1 2],5)),1);
compl_uninf=1-mean(squeeze(group(:,3:4,5)),1);

opt_inf=mean(squeeze(group(:,5:6,2)),1);
opt_uninf=mean(squeeze(group(:,7:8,2)),1);

perf=[opt_inf opt_uninf compl_inf compl_uninf];


