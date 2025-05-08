%anova analysis pred x rew Daddaoua et al., 2016
function second_level_anova_8_states(monkey)

dir1='./';
% dir2=spm_select(inf,'dir','select no pred condition');

dat=importdata([dir1 '/NE_inf.mat']);
dat(:,3:4)=importdata([dir1 '/NE_uninf.mat']);

nsubj=length(dat);

disp('Analysis on NE output ------------------')

DM={dat(:,1) dat(:,2);dat(:,3), dat(:,4)};

disp('Descriptive stats (average and SEM)------------------')

disp(' ')
disp(['Inf_R = ' num2str([mean(dat(:,1)) std(dat(:,1))./sqrt(nsubj)])]);
disp(' ')
disp(['Inf_r = ' num2str([mean(dat(:,2)) std(dat(:,2))./sqrt(nsubj)])]);
disp(' ')
disp(['unInf_R = ' num2str([mean(dat(:,3)) std(dat(:,3))./sqrt(nsubj)])]);
disp(' ')
disp(['unInf_r = ' num2str([mean(dat(:,4)) std(dat(:,4))./sqrt(nsubj)])]);
disp(' ')

    
% figure
% hold on
% errorbar([1,2],[mean(dat(:,2)),mean(dat(:,1))],[std(dat(:,2))./sqrt(nsubj),std(dat(:,1))./sqrt(nsubj)],'color','r');
% errorbar([1,2],[mean(dat(:,4)),mean(dat(:,3))],[std(dat(:,4))./sqrt(nsubj),std(dat(:,3))./sqrt(nsubj)]);

plot_res([1 1;2 2],[mean(dat(:,2)) mean(dat(:,4));mean(dat(:,1)) mean(dat(:,3))],[std(dat(:,2))./sqrt(nsubj) std(dat(:,4))./sqrt(nsubj);std(dat(:,1))./sqrt(nsubj) std(dat(:,3))./sqrt(nsubj)])
xlabel('Reward')
ylabel('LC activity (a.u.)')
title(monkey)


disp('Results Cue informativity x reward magnitude------------------')

[F_inf F_rew FI df_inf df_rw dfi] = anova2rm_cell(DM)
    p_Inf = 1-fcdf(F_inf, df_inf(1), df_inf(2))
    p_rew = 1-fcdf(F_rew, df_rw(1), df_rw(2))
    p_I = 1-fcdf(FI, dfi(1), dfi(2))
    
    



disp('Analysis on LA output ------------------')

dat=importdata([dir1 '/LA_inf.mat']);
dat(:,3:4)=importdata([dir1 '/LA_uninf.mat']);

DM={dat(:,1) dat(:,2);dat(:,3), dat(:,4)};

disp('Descriptive stats (average and SEM)------------------')

disp(' ')
disp(['Inf_R = ' num2str([mean(dat(:,1)) std(dat(:,1))./sqrt(nsubj)])]);
disp(' ')
disp(['Inf_r = ' num2str([mean(dat(:,2)) std(dat(:,2))./sqrt(nsubj)])]);
disp(' ')
disp(['unInf_R = ' num2str([mean(dat(:,3)) std(dat(:,3))./sqrt(nsubj)])]);
disp(' ')
disp(['unInf_r = ' num2str([mean(dat(:,4)) std(dat(:,4))./sqrt(nsubj)])]);
disp(' ')

mu=mean(dat(:));
sigma=std((dat(:)));

datz=dat;

% for i=1:size(dat,2)
%     datz(:,i)=(dat(:,i)-mu)/sigma;
% end

% 

% figure
% hold on
% errorbar([1,2],[mean(dat(:,2)),mean(dat(:,1))],[std(dat(:,2))./sqrt(nsubj),std(dat(:,1))./sqrt(nsubj)],'color','r');
% errorbar([1,2],[mean(dat(:,4)),mean(dat(:,3))],[std(dat(:,4))./sqrt(nsubj),std(dat(:,3))./sqrt(nsubj)]);

plot_res([1 1;2 2],[mean(datz(:,2)) mean(datz(:,4));mean(datz(:,1)) mean(datz(:,3))],[std(datz(:,2))./sqrt(nsubj) std(datz(:,4))./sqrt(nsubj);std(datz(:,1))./sqrt(nsubj) std(datz(:,3))./sqrt(nsubj)])
xlabel('Reward')
ylabel('LIP activity (a.u.)')
title(monkey)

disp('Results Cue informativity x reward magnitude------------------')

[F_inf F_rew FI df_inf df_rw dfi] = anova2rm_cell(DM)
    p_Inf = 1-fcdf(F_inf, df_inf(1), df_inf(2))
    p_rew = 1-fcdf(F_rew, df_rw(1), df_rw(2))
    p_I = 1-fcdf(FI, dfi(1), dfi(2))

[~,p,~,stat]=ttest(dat(:,2),dat(:,1));

disp(['t(' num2str(stat.df) ')(Inf_r>Inf_R) = ' num2str(stat.tstat)])
disp(['p(Inf_r>Inf_R) = ' num2str(p)])
disp(' ')
 
disp('Analysis on Stay responses------------------')
%---analysis on stay response----    
dat=importdata([dir1 '/stay_inf.mat']);
dat(:,3:4)=importdata([dir1 '/stay_uninf.mat']);

nsubj=length(dat);

DM={dat(:,1) dat(:,2);dat(:,3), dat(:,4)};

disp('Descriptive stats (average and SEM)------------------')

disp(' ')
disp(['Inf_R = ' num2str([mean(dat(:,1)) std(dat(:,1))./sqrt(nsubj)])]);
disp(' ')
disp(['Inf_r = ' num2str([mean(dat(:,2)) std(dat(:,2))./sqrt(nsubj)])]);
disp(' ')
disp(['unInf_R = ' num2str([mean(dat(:,3)) std(dat(:,3))./sqrt(nsubj)])]);
disp(' ')
disp(['unInf_r = ' num2str([mean(dat(:,4)) std(dat(:,4))./sqrt(nsubj)])]);
disp(' ')

disp('Results Cue informativity x reward magnitude------------------')

[F_inf F_rew FI df_inf df_rw dfi] = anova2rm_cell(DM)
    p_Inf = 1-fcdf(F_inf, df_inf(1), df_inf(2))
    p_rew = 1-fcdf(F_rew, df_rw(1), df_rw(2))
    p_I = 1-fcdf(FI, dfi(1), dfi(2))
    
    
plot_res([1 1;2 2],100-100*[mean(dat(:,2)) mean(dat(:,4));mean(dat(:,1)) mean(dat(:,3))],100*[std(dat(:,2))./sqrt(nsubj) std(dat(:,4))./sqrt(nsubj);std(dat(:,1))./sqrt(nsubj) std(dat(:,3))./sqrt(nsubj)])
xlabel('Reward')
ylabel('Completion rate (%)')
title(monkey)


disp('Analysis on Correct choices------------------')
%---analysis on stay response----    
dat=importdata([dir1 '/opt_inf.mat']);
dat(:,3:4)=importdata([dir1 '/opt_uninf.mat']);

nsubj=length(dat);

DM={dat(:,1) dat(:,2);dat(:,3), dat(:,4)};

disp('Descriptive stats (average and SEM)------------------')

disp(' ')
disp(['Inf_R = ' num2str([mean(dat(:,1)) std(dat(:,1))./sqrt(nsubj)])]);
disp(' ')
disp(['Inf_r = ' num2str([mean(dat(:,2)) std(dat(:,2))./sqrt(nsubj)])]);
disp(' ')
disp(['unInf_R = ' num2str([mean(dat(:,3)) std(dat(:,3))./sqrt(nsubj)])]);
disp(' ')
disp(['unInf_r = ' num2str([mean(dat(:,4)) std(dat(:,4))./sqrt(nsubj)])]);
disp(' ')

disp('Results Cue informativity x reward magnitude------------------')

[F_inf F_rew FI df_inf df_rw dfi] = anova2rm_cell(DM)
    p_Inf = 1-fcdf(F_inf, df_inf(1), df_inf(2))
    p_rew = 1-fcdf(F_rew, df_rw(1), df_rw(2))
    p_I = 1-fcdf(FI, dfi(1), dfi(2))
    
    
plot_res([1 1;2 2],100*[mean(dat(:,2)) mean(dat(:,4));mean(dat(:,1)) mean(dat(:,3))],100*[std(dat(:,2))./sqrt(nsubj) std(dat(:,4))./sqrt(nsubj);std(dat(:,1))./sqrt(nsubj) std(dat(:,3))./sqrt(nsubj)])
xlabel('Reward')
ylabel('Correct choices (%)')
title(monkey)


% disp('Analysis on RW expectation ------------------')
% 
% dat=importdata([dir1 '/V_box_sel.mat']);
% dat(:,3:4)=importdata([dir1 '/V_box_sel.mat']);
% 
% DM={dat(:,1) dat(:,2);dat(:,3), dat(:,4)};
% 
% disp('Descriptive stats (average and SEM)------------------')
% 
% disp(' ')
% disp(['Inf_R = ' num2str([mean(dat(:,1)) std(dat(:,1))./sqrt(nsubj)])]);
% disp(' ')
% disp(['Inf_r = ' num2str([mean(dat(:,2)) std(dat(:,2))./sqrt(nsubj)])]);
% disp(' ')
% disp(['unInf_R = ' num2str([mean(dat(:,3)) std(dat(:,3))./sqrt(nsubj)])]);
% disp(' ')
% disp(['unInf_r = ' num2str([mean(dat(:,4)) std(dat(:,4))./sqrt(nsubj)])]);
% disp(' ')
% 
% % mu=mean(dat(:));
% % sigma=std((dat(:)));
% % 
% % for i=1:size(dat,2)
% %     datz(:,i)=(dat(:,i)-mu)/sigma;
% % end
% 
% datz=dat;
% 
% % figure
% % hold on
% % errorbar([1,2],[mean(dat(:,2)),mean(dat(:,1))],[std(dat(:,2))./sqrt(nsubj),std(dat(:,1))./sqrt(nsubj)],'color','r');
% % errorbar([1,2],[mean(dat(:,4)),mean(dat(:,3))],[std(dat(:,4))./sqrt(nsubj),std(dat(:,3))./sqrt(nsubj)]);
% 
% plot_res([1 1;2 2],[mean(datz(:,2)) mean(datz(:,4));mean(datz(:,1)) mean(datz(:,3))],[std(datz(:,2))./sqrt(nsubj) std(datz(:,4))./sqrt(nsubj);std(datz(:,1))./sqrt(nsubj) std(datz(:,3))./sqrt(nsubj)])
% xlabel('Reward')
% ylabel('Expected value (a.u.)')
% 
% disp('Results Cue informativity x reward magnitude------------------')
% 
% [F_inf F_rew FI df_inf df_rw dfi] = anova2rm_cell(DM)
%     p_Inf = 1-fcdf(F_inf, df_inf(1), df_inf(2))
%     p_rew = 1-fcdf(F_rew, df_rw(1), df_rw(2))
%     p_I = 1-fcdf(FI, dfi(1), dfi(2))
% 
% [~,p,~,stat]=ttest(dat(:,2),dat(:,1));
% 
% disp(['t(' num2str(stat.df) ')(Inf_r>Inf_R) = ' num2str(stat.tstat)])
% disp(['p(Inf_r>Inf_R) = ' num2str(p)])
% disp(' ')
% 
% 
% 
% 
% disp('Analysis on VTA ------------------')
% 
% dat=importdata([dir1 '/VTA.mat']);
% dat(:,3:4)=importdata([dir1 '/VTA.mat']);
% 
% DM={dat(:,1) dat(:,2);dat(:,3), dat(:,4)};
% 
% disp('Descriptive stats (average and SEM)------------------')
% 
% disp(' ')
% disp(['Inf_R = ' num2str([mean(dat(:,1)) std(dat(:,1))./sqrt(nsubj)])]);
% disp(' ')
% disp(['Inf_r = ' num2str([mean(dat(:,2)) std(dat(:,2))./sqrt(nsubj)])]);
% disp(' ')
% disp(['unInf_R = ' num2str([mean(dat(:,3)) std(dat(:,3))./sqrt(nsubj)])]);
% disp(' ')
% disp(['unInf_r = ' num2str([mean(dat(:,4)) std(dat(:,4))./sqrt(nsubj)])]);
% disp(' ')
% 
% % mu=mean(dat(:));
% % sigma=std((dat(:)));
% % 
% % for i=1:size(dat,2)
% %     datz(:,i)=(dat(:,i)-mu)/sigma;
% % end
% 
% datz=dat;
% 
% % figure
% % hold on
% % errorbar([1,2],[mean(dat(:,2)),mean(dat(:,1))],[std(dat(:,2))./sqrt(nsubj),std(dat(:,1))./sqrt(nsubj)],'color','r');
% % errorbar([1,2],[mean(dat(:,4)),mean(dat(:,3))],[std(dat(:,4))./sqrt(nsubj),std(dat(:,3))./sqrt(nsubj)]);
% 
% plot_res([1 1;2 2],[mean(datz(:,2)) mean(datz(:,4));mean(datz(:,1)) mean(datz(:,3))],[std(datz(:,2))./sqrt(nsubj) std(datz(:,4))./sqrt(nsubj);std(datz(:,1))./sqrt(nsubj) std(datz(:,3))./sqrt(nsubj)])
% xlabel('Reward')
% ylabel('Expected value (a.u.)')
% 
% disp('Results Cue informativity x reward magnitude------------------')
% 
% [F_inf F_rew FI df_inf df_rw dfi] = anova2rm_cell(DM)
%     p_Inf = 1-fcdf(F_inf, df_inf(1), df_inf(2))
%     p_rew = 1-fcdf(F_rew, df_rw(1), df_rw(2))
%     p_I = 1-fcdf(FI, dfi(1), dfi(2))
% 
% [~,p,~,stat]=ttest(dat(:,2),dat(:,1));
% 
% disp(['t(' num2str(stat.df) ')(Inf_r>Inf_R) = ' num2str(stat.tstat)])
% disp(['p(Inf_r>Inf_R) = ' num2str(p)])
% disp(' ')
