%extract day-by-day RML and Q simulation results for
%data analysis

%Monkey M

res=importdata('./simulations_with_optimal_param/sims_GLM_RML_FINAL_with_BIC/M_M_res_beta.mat');

dbd.RML.monkeyM.acc.Inf.HR=res(:,6);
dbd.RML.monkeyM.acc.Inf.LR=res(:,7);

dbd.RML.monkeyM.acc.UnInf.HR=res(:,8);
dbd.RML.monkeyM.acc.UnInf.LR=res(:,9);

dbd.RML.monkeyM.compl.Inf.HR=res(:,10);
dbd.RML.monkeyM.compl.Inf.LR=res(:,11);

dbd.RML.monkeyM.compl.UnInf.HR=res(:,12);
dbd.RML.monkeyM.compl.UnInf.LR=res(:,13);

zb=res(:,18:21);

z=(res(:,18:21)-mean(zb(:)))./std(zb(:));

dbd.RML.monkeyM.LIP.Inf.HR=z(:,1);
dbd.RML.monkeyM.LIP.Inf.LR=z(:,2);
dbd.RML.monkeyM.LIP.UnInf.HR=z(:,3);
dbd.RML.monkeyM.LIP.UnInf.LR=z(:,4);

dbd.RML.monkeyM.beta.Legend='betas from GLM estimates: LIP = b0+b1*Inf+b2*RW';
dbd.RML.monkeyM.beta.Inf=res(:,27);
dbd.RML.monkeyM.beta.RW=res(:,28);

res=importdata('./simulations_with_optimal_param/sims_GLM_RML_FINAL_with_BIC/M_S_res_beta.mat');

dbd.RML.monkeyS.acc.Inf.HR=res(:,6);
dbd.RML.monkeyS.acc.Inf.LR=res(:,7);

dbd.RML.monkeyS.acc.UnInf.HR=res(:,8);
dbd.RML.monkeyS.acc.UnInf.LR=res(:,9);

dbd.RML.monkeyS.compl.Inf.HR=res(:,10);
dbd.RML.monkeyS.compl.Inf.LR=res(:,11);

dbd.RML.monkeyS.compl.UnInf.HR=res(:,12);
dbd.RML.monkeyS.compl.UnInf.LR=res(:,13);

zb=res(:,18:21);

z=(res(:,18:21)-mean(zb(:)))./std(zb(:));

dbd.RML.monkeyS.LIP.Inf.HR=z(:,1);
dbd.RML.monkeyS.LIP.Inf.LR=z(:,2);
dbd.RML.monkeyS.LIP.UnInf.HR=z(:,3);
dbd.RML.monkeyS.LIP.UnInf.LR=z(:,4);

dbd.RML.monkeyS.beta.Legend='betas from GLM estimates: LIP = b0+b1*Inf+b2*RW';
dbd.RML.monkeyS.beta.Inf=res(:,27);
dbd.RML.monkeyS.beta.RW=res(:,28);



res=importdata('./simulations_with_optimal_param/sims_GLM_RMLC_FINAL_with_BIC/M_M_res_beta.mat');

dbd.RMLC.monkeyM.acc.Inf.HR=res(:,6);
dbd.RMLC.monkeyM.acc.Inf.LR=res(:,7);

dbd.RMLC.monkeyM.acc.UnInf.HR=res(:,8);
dbd.RMLC.monkeyM.acc.UnInf.LR=res(:,9);

dbd.RMLC.monkeyM.compl.Inf.HR=res(:,10);
dbd.RMLC.monkeyM.compl.Inf.LR=res(:,11);

dbd.RMLC.monkeyM.compl.UnInf.HR=res(:,12);
dbd.RMLC.monkeyM.compl.UnInf.LR=res(:,13);

zb=res(:,18:21);

z=(res(:,18:21)-mean(zb(:)))./std(zb(:));

dbd.RMLC.monkeyM.LIP.Inf.HR=z(:,1);
dbd.RMLC.monkeyM.LIP.Inf.LR=z(:,2);
dbd.RMLC.monkeyM.LIP.UnInf.HR=z(:,3);
dbd.RMLC.monkeyM.LIP.UnInf.LR=z(:,4);

dbd.RMLC.monkeyM.beta.Legend='betas from GLM estimates: LIP = b0+b1*Inf+b2*RW';
dbd.RMLC.monkeyM.beta.Inf=res(:,27);
dbd.RMLC.monkeyM.beta.RW=res(:,28);

res=importdata('./simulations_with_optimal_param/sims_GLM_RMLC_FINAL_with_BIC/M_S_res_beta.mat');

dbd.RMLC.monkeyS.acc.Inf.HR=res(:,6);
dbd.RMLC.monkeyS.acc.Inf.LR=res(:,7);

dbd.RMLC.monkeyS.acc.UnInf.HR=res(:,8);
dbd.RMLC.monkeyS.acc.UnInf.LR=res(:,9);

dbd.RMLC.monkeyS.compl.Inf.HR=res(:,10);
dbd.RMLC.monkeyS.compl.Inf.LR=res(:,11);

dbd.RMLC.monkeyS.compl.UnInf.HR=res(:,12);
dbd.RMLC.monkeyS.compl.UnInf.LR=res(:,13);

zb=res(:,18:21);

z=(res(:,18:21)-mean(zb(:)))./std(zb(:));

dbd.RMLC.monkeyS.LIP.Inf.HR=z(:,1);
dbd.RMLC.monkeyS.LIP.Inf.LR=z(:,2);
dbd.RMLC.monkeyS.LIP.UnInf.HR=z(:,3);
dbd.RMLC.monkeyS.LIP.UnInf.LR=z(:,4);

dbd.RMLC.monkeyS.beta.Legend='betas from GLM estimates: LIP = b0+b1*Inf+b2*RW';
dbd.RMLC.monkeyS.beta.Inf=res(:,27);
dbd.RMLC.monkeyS.beta.RW=res(:,28);




res=importdata('./simulations_with_optimal_param/sims_GLM_Q_FINAL/M_M_res_beta_Q.mat');

dbd.Q.monkeyM.acc.Inf.HR=res(:,6);
dbd.Q.monkeyM.acc.Inf.LR=res(:,7);

dbd.Q.monkeyM.acc.UnInf.HR=res(:,8);
dbd.Q.monkeyM.acc.UnInf.LR=res(:,9);

dbd.Q.monkeyM.compl.Inf.HR=res(:,10);
dbd.Q.monkeyM.compl.Inf.LR=res(:,11);

dbd.Q.monkeyM.compl.UnInf.HR=res(:,12);
dbd.Q.monkeyM.compl.UnInf.LR=res(:,13);

zb=res(:,18:21);

z=(res(:,18:21)-mean(zb(:)))./std(zb(:));

dbd.Q.monkeyM.LIP.Inf.HR=z(:,1);
dbd.Q.monkeyM.LIP.Inf.LR=z(:,2);
dbd.Q.monkeyM.LIP.UnInf.HR=z(:,3);
dbd.Q.monkeyM.LIP.UnInf.LR=z(:,4);

dbd.Q.monkeyM.beta.Legend='betas from GLM estimates: LIP = b0+b1*Inf+b2*RW';
dbd.Q.monkeyM.beta.Inf=res(:,27);
dbd.Q.monkeyM.beta.RW=res(:,28);

res=importdata('./simulations_with_optimal_param/sims_GLM_Q_FINAL/M_S_res_beta_Q.mat');

dbd.Q.monkeyS.acc.Inf.HR=res(:,6);
dbd.Q.monkeyS.acc.Inf.LR=res(:,7);

dbd.Q.monkeyS.acc.UnInf.HR=res(:,8);
dbd.Q.monkeyS.acc.UnInf.LR=res(:,9);

dbd.Q.monkeyS.compl.Inf.HR=res(:,10);
dbd.Q.monkeyS.compl.Inf.LR=res(:,11);

dbd.Q.monkeyS.compl.UnInf.HR=res(:,12);
dbd.Q.monkeyS.compl.UnInf.LR=res(:,13);

zb=res(:,18:21);

z=(res(:,18:21)-mean(zb(:)))./std(zb(:));

dbd.Q.monkeyS.LIP.Inf.HR=z(:,1);
dbd.Q.monkeyS.LIP.Inf.LR=z(:,2);
dbd.Q.monkeyS.LIP.UnInf.HR=z(:,3);
dbd.Q.monkeyS.LIP.UnInf.LR=z(:,4);

dbd.Q.monkeyS.beta.Legend='betas from GLM estimates: LIP = b0+b1*Inf+b2*RW';
dbd.Q.monkeyS.beta.Inf=res(:,27);
dbd.Q.monkeyS.beta.RW=res(:,28);


save day_by_day_results_2 dbd

