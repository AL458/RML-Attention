%group analysis for 2-armed bandid results

function [perf_res]=second_level_an_opt_sim(S,arg)

nstate=size(arg.trans,1);

group=zeros(arg.nsubj,nstate,7);
options=3;
boptions=10;
% boost=zeros(arg.nsubj,2);
% stay=zeros(arg.nsubj,2);

groupnpr=zeros(arg.nsubj,nstate);
groupnpr3=zeros(arg.nsubj,nstate,options);
groupnpr2=zeros(arg.nsubj,nstate,boptions);
groupnpr4=zeros(arg.nsubj,nstate);

dat=S{1};


grouptr=zeros(arg.nsubj,nstate,length(dat.respside(1,:))-arg.nexcltri);


se=1;

for s=1:arg.nsubj
    
    
    dat=S{s};
    
    
    buff_npr=cell(8,1);
    
    buff_npr3=cell(8,1);
    buff=cell(8,1);
    buff_LA=cell(8,1);
    
    dat.rw(:,1:arg.nexcltri)=[];
    dat.optim(:,1:arg.nexcltri)=[];
    dat.k(:,1:arg.nexcltri)=[];
    dat.D(:,1:arg.nexcltri)=[];
    dat.respside(:,1:arg.nexcltri)=[];
    dat.b(:,1:arg.nexcltri)=[];
    dat.VTA(:,1:arg.nexcltri)=[];
    dat.VTA2(:,1:arg.nexcltri)=[];
    dat.V(:,1:arg.nexcltri,:)=[];
    dat.V2(:,1:arg.nexcltri,:)=[];
%     dat.ttype(1:arg.nexcltri)=[];
    
    
    
    for state=1:nstate%1st to 3rd order
        
        buff{state}(:,1)=dat.rw(state,dat.k(state,:)>0)';
        buff{state}(:,2)=dat.optim(state,dat.k(state,:)>0)';
        buff{state}(:,3)=dat.k(state,dat.k(state,:)>0)';
%         buff_LA{state}(:,4)=dat.D(state,dat.k(state,:)>0 & dat.optim(state,:)==1)';
        buff_LA{state}(:,4)=dat.D(state,dat.k(state,:)>0)';
        buff{state}(:,5)=dat.respside(state,dat.k(state,:)>0)';
        
        buffV=dat.V(state,dat.k(state,:)>0,:);
        buff{state}(:,6)=squeeze(buffV(:,buff{state}(:,5)))';
        buff{state}(:,7)=dat.b(state,dat.b(state,:)>0)';
        
        ntri=length(buff{state});%number of trials
        
        buff_npr{state}=(dat.VTA(state,dat.VTA(state,:)>0));
        buff_npr3{state}=(dat.VTA2(state,dat.VTA2(state,:)>0));
        
        
        group(s,state,1)=mean(buff{state}(:,1));
        group(s,state,2)=mean(buff{state}(buff{state}(:,5)~=3,2));%exclude "stay" trials
        group(s,state,3)=mean(buff{state}(:,3));
        
        bufft=nan(ntri,1);
        
        for tri=1:ntri
            if buff{state}(tri,5)==3
                bufft(tri)=1;
            else
                bufft(tri)=0;
            end
        end
        
        group(s,state,5)=mean(bufft,'omitnan');%record all resp
        group(s,state,4)=mean(buff_LA{state}(:,4));
        group(s,state,7)=mean(buff{state}(:,7));
        group(s,state,6)=mean(buff{state}(buff{state}(:,5)~=3,6));
        
        if sum(arg.trans(1,:))>4 || sum(arg.trans(1,:))>6%if Gersch et al. 2015 task
           grouptr(s,state,:)=dat.optim(state,:);
        end
        
        groupnpr(s,state)=mean(buff_npr{state});
        groupnpr4(s,state)=mean(buff_npr3{state});
        
    end
    
    groupnpr3(s,:,:)=squeeze(mean(dat.V(:,:,:),2));
    groupnpr2(s,:,:)=squeeze(mean(dat.V2(:,:,:),2));
    
end



    boost_inf=squeeze(mean(group(:,5:6,7),1));
    boost_uninf=squeeze(mean(group(:,7:8,7),1));
    LA_inf=squeeze(mean(group(:,5:6,4),1));
    LA_uninf=squeeze(mean(group(:,7:8,4),1));
    V=squeeze(mean(group(:,5:8,6),1));%expected value for selected saccade

compl_inf=1-mean(squeeze(group(:,[1 2],5)),1);
compl_uninf=1-mean(squeeze(group(:,3:4,5)),1);

opt_inf=mean(squeeze(group(:,5:6,2)),1);
opt_uninf=mean(squeeze(group(:,7:8,2)),1);

perf_res=[opt_inf opt_uninf compl_inf compl_uninf boost_inf boost_uninf LA_inf LA_uninf V];

% We=squeeze(mean(groupnpr2,1));
% W=squeeze(mean(groupnpr3,1));%record value 
% 
% save('NE_inf','boost_inf');
% save('NE_uninf','boost_uninf');
% save('stay_inf','stay_inf');
% save('stay_uninf','stay_uninf');
% save('opt_inf','opt_inf');
% save('opt_uninf','opt_uninf');
% save('LA_inf','LA_inf');
% save('LA_uninf','LA_uninf');
% save('V_box_sel','V');
% % save('VTA','V');
% 
% save('W','W');
% save('We','We');


