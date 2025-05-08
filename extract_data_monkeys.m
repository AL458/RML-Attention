%extract behavioural data frommonkeys datasets and make a dataset ready as an input for comput.
%phenot. day-by-day
clear all

[dset]=spm_select(1,'.mat','Select monkeys dataset');


VTS=importdata(dset);


N_monkey=[2 3];



for m=N_monkey

    data=[];
    data(:,1)=VTS.Beh.Accuracy.Inf.Hi(VTS.MonkID==m);
    data(:,2)=VTS.Beh.Accuracy.Inf.Lo(VTS.MonkID==m);
    data(:,3)=VTS.Beh.Accuracy.Uninf.Hi(VTS.MonkID==m);
    data(:,4)=VTS.Beh.Accuracy.Uninf.Lo(VTS.MonkID==m);
    data(:,5)=VTS.Beh.Complete.Inf.Hi(VTS.MonkID==m);
    data(:,6)=VTS.Beh.Complete.Inf.Lo(VTS.MonkID==m);
    data(:,7)=VTS.Beh.Complete.Uninf.Hi(VTS.MonkID==m);
    data(:,8)=VTS.Beh.Complete.Uninf.Lo(VTS.MonkID==m);

    data=data*.01;
    
    save(num2str(m),'data');

    mean(data(:,1:4))

end