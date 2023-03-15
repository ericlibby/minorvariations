% plot data over the course of evolutionary simulations
% no mixing


colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;


% sc
fig=figure;
hold on
for n=1:sims
    name=['run',num2str(n)];
    cur=DataA.(name);
    
    plot(1:1:length(cur(:,1)),(1./cur(:,1))-1,'color',[colors(1,:) .2]);
    ylim([-.05 .2])
    ax=gca;
    ax.XAxis.FontSize = 24;
    ax.YAxis.FontSize = 24;
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'XTick',[0 10 20 30 40 50 60 70 80 90 100],'XTickLabel',[0 10 20 30 40 50 60 70 80 90 100]);
    set(gca,'YTick',[0 .1 .2],'YTickLabel',[0 .1 .2]);
    xlabel('transfer','fontsize',30,'interpreter','latex')
    ylabel('avg[$s_c$]','fontsize',30,'interpreter','latex')
    title('$k$=2','fontsize',30,'interpreter','latex')
    
    curmean(:,n)=cur(:,1); % to calculate average
    t5sc_cd(n)=(1./cur(5,1))-1; % fixation at timestep 5
end
curavg=(1./mean(curmean,2))-1;
plot(1:1:length(cur(:,1)),curavg,'LineWidth',2,'color',colors(1,:))
meansc_cd=curavg(end);


fig=figure;
hold on
for n=1:sims
    name=['run',num2str(n)];
    cur=DataD.(name);
    
    plot(1:1:length(cur(:,1)),(1./cur(:,1))-1,'color',[colors(4,:) .2]);
    ylim([-.05 .2])
    ax=gca;
    ax.XAxis.FontSize = 24;
    ax.YAxis.FontSize = 24;
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'XTick',[0 10 20 30 40 50 60 70 80 90 100],'XTickLabel',[0 10 20 30 40 50 60 70 80 90 100]);
    set(gca,'YTick',[0 .1 .2],'YTickLabel',[0 .1 .2]);
    xlabel('transfer','fontsize',30,'interpreter','latex')
    ylabel('avg[$s_c$]','fontsize',30,'interpreter','latex')
    title('$k$=16','fontsize',30,'interpreter','latex')
    
    curmean(:,n)=cur(:,1); % to calculate average
    t5sc_time(n)=(1./cur(5,1))-1; % fixation at timestep 5
end
curavg=(1./mean(curmean,2))-1;
plot(1:1:length(cur(:,1)),curavg,'LineWidth',2,'color',colors(4,:))
meansc_time=curavg(end);
print(fig,['C:\Users\hais0030\Documents\MATLAB\FilamentLifeCycles_det_ks\evosim_nomix_contrasting_randn\plots_transfers\plot_evosim_nomix_sc_cont_'+surv+'_k16'],'-depsc','-r300')




% sg
fig=figure;
hold on
for n=1:sims
    name=['run',num2str(n)];
    cur=DataA.(name);
    
    plot(1:1:length(cur(:,1)),cur(:,2),'color',[colors(1,:) .2]);
    ylim([-.05 .2])
    ax=gca;
    ax.XAxis.FontSize = 24;
    ax.YAxis.FontSize = 24;
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'XTick',[0 10 20 30 40 50 60 70 80 90 100],'XTickLabel',[0 10 20 30 40 50 60 70 80 90 100]);
    set(gca,'YTick',[0 .1 .2],'YTickLabel',[0 .1 .2]);
    xlabel('transfer','fontsize',30,'interpreter','latex')
    ylabel('avg[$s_g$]','fontsize',30,'interpreter','latex')
    title('$k$=2','fontsize',30,'interpreter','latex')
    
    curmean(:,n)=cur(:,2); % to calculate average
    t5sg_cd(n)=cur(5,2); % fixation at timestep 5
end
curavg=mean(curmean,2);
plot(1:1:length(cur(:,1)),curavg,'LineWidth',2,'color',colors(1,:))
meansg_cd=curavg(end);



fig=figure;
hold on
for n=1:sims
    name=['run',num2str(n)];
    cur=DataD.(name);
    
    plot(1:1:length(cur(:,1)),cur(:,2),'color',[colors(4,:) .2]);
    ylim([-.05 .2])
    ax=gca;
    ax.XAxis.FontSize = 24;
    ax.YAxis.FontSize = 24;
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'XTick',[0 10 20 30 40 50 60 70 80 90 100],'XTickLabel',[0 10 20 30 40 50 60 70 80 90 100]);
    set(gca,'YTick',[0 .1 .2],'YTickLabel',[0 .1 .2]);
    xlabel('transfer','fontsize',30,'interpreter','latex')
    ylabel('avg[$s_g$]','fontsize',30,'interpreter','latex')
    title('$k$=16','fontsize',30,'interpreter','latex')
    
    curmean(:,n)=cur(:,2); % to calculate average
    t5sg_time(n)=cur(5,2); % fixation at timestep 5
end
curavg=mean(curmean,2);
plot(1:1:length(cur(:,1)),curavg,'LineWidth',2,'color',colors(4,:))
meansg_time=curavg(end);


%%  

% # muts

fig=figure;
hold on
for n=1:sims
    name=['run',num2str(n)];
    cur=DataA.(name);
    
    plot(1:1:length(cur(:,1)),cur(:,3),'color',[colors(1,:) .2]);
    ylim([0 7])
    ax=gca;
    ax.XAxis.FontSize = 24;
    ax.YAxis.FontSize = 24;
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'XTick',[0 10 20 30 40 50],'XTickLabel',[0 10 20 30 40 50]);
    set(gca,'YTick',[0 2 4 6],'YTickLabel',[0 2 4 6]);
    xlabel('transfer','fontsize',30,'interpreter','latex')
    ylabel('$\#$mutations','fontsize',30,'interpreter','latex')
    title('$k$=2','fontsize',30,'interpreter','latex')
    
    curmean(:,n)=cur(:,3); % to calculate average
end
curavg=mean(curmean,2);
plot(1:1:length(cur(:,1)),curavg,'LineWidth',2,'color',colors(1,:))
meanmuts_bf=curavg(end);
print(fig,['C:\Users\hais0030\Documents\MATLAB\FilamentLifeCycles_det_ks\evosim_nomix_contrasting_randn\plots_transfers\plot_evosim_nomix_muts_'+surv+'_k2'],'-depsc','-r300')




fig=figure;
hold on
for n=1:sims
    name=['run',num2str(n)];
    cur=DataB.(name);
    
    plot(1:1:length(cur(:,1)),cur(:,3),'color',[colors(2,:) .2]);
    ylim([0 7])
    ax=gca;
    ax.XAxis.FontSize = 24;
    ax.YAxis.FontSize = 24;
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'XTick',[0 10 20 30 40 50],'XTickLabel',[0 10 20 30 40 50]);
    set(gca,'YTick',[0 2 4 6],'YTickLabel',[0 2 4 6]);
    xlabel('transfer','fontsize',30,'interpreter','latex')
    ylabel('$\#$mutations','fontsize',30,'interpreter','latex')
    title('$k$=4','fontsize',30,'interpreter','latex')
    
    curmean(:,n)=cur(:,3); % to calculate average
end
curavg=mean(curmean,2);
plot(1:1:length(cur(:,1)),curavg,'LineWidth',2,'color',colors(2,:))
meanmuts_bf=curavg(end);
print(fig,['C:\Users\hais0030\Documents\MATLAB\FilamentLifeCycles_det_ks\evosim_nomix_contrasting_randn\plots_transfers\plot_evosim_nomix_muts_'+surv+'_k4'],'-depsc','-r300')



fig=figure;
hold on
for n=1:sims
    name=['run',num2str(n)];
    cur=DataC.(name);
    
    plot(1:1:length(cur(:,1)),cur(:,3),'color',[colors(3,:) .2]);
    ylim([0 7])
    ax=gca;
    ax.XAxis.FontSize = 24;
    ax.YAxis.FontSize = 24;
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'XTick',[0 10 20 30 40 50],'XTickLabel',[0 10 20 30 40 50]);
    set(gca,'YTick',[0 2 4 6],'YTickLabel',[0 2 4 6]);
    xlabel('transfer','fontsize',30,'interpreter','latex')
    ylabel('$\#$mutations','fontsize',30,'interpreter','latex')
    title('$k$=8','fontsize',30,'interpreter','latex')
    
    curmean(:,n)=cur(:,3); % to calculate average
end
curavg=mean(curmean,2);
plot(1:1:length(cur(:,1)),curavg,'LineWidth',2,'color',colors(3,:))
meanmuts_time=curavg(end);
print(fig,['C:\Users\hais0030\Documents\MATLAB\FilamentLifeCycles_det_ks\evosim_nomix_contrasting_randn\plots_transfers\plot_evosim_nomix_muts_'+surv+'_k8'],'-depsc','-r300')




fig=figure;
hold on
for n=1:sims
    name=['run',num2str(n)];
    cur=DataD.(name);
    
    plot(1:1:length(cur(:,1)),cur(:,3),'color',[colors(4,:) .2]);
    ylim([0 7])
    ax=gca;
    ax.XAxis.FontSize = 24;
    ax.YAxis.FontSize = 24;
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'XTick',[0 10 20 30 40 50],'XTickLabel',[0 10 20 30 40 50]);
    set(gca,'YTick',[0 2 4 6],'YTickLabel',[0 2 4 6]);
    xlabel('transfer','fontsize',30,'interpreter','latex')
    ylabel('$\#$mutations','fontsize',30,'interpreter','latex')
    title('$k$=16','fontsize',30,'interpreter','latex')
    
    curmean(:,n)=cur(:,3); % to calculate average
end
curavg=mean(curmean,2);
plot(1:1:length(cur(:,1)),curavg,'LineWidth',2,'color',colors(4,:))
meanmuts_time=curavg(end);
print(fig,['C:\Users\hais0030\Documents\MATLAB\FilamentLifeCycles_det_ks\evosim_nomix_contrasting_randn\plots_transfers\plot_evosim_nomix_muts_'+surv+'_k16'],'-depsc','-r300')




%% 

% bar graphs of fixation at 5th time step
% sc
fig=figure;
hold on
x=1:1:4;
vals=[mean(t5sc_cd) mean(t5sc_bf) mean(t5sc_space) mean(t5sc_time)];
b=bar(x,vals, 'facecolor', 'flat');
b.CData = colors;

% lgd=legend('CD','BF','stoc. space','stoc. time','Interpreter',"latex",'Location','northwest');
% lgd.FontSize = 16;
% legend boxoff

errlow=[std(t5sc_cd) std(t5sc_bf) std(t5sc_space) std(t5sc_time)];
errhigh=[std(t5sc_cd) std(t5sc_bf) std(t5sc_space) std(t5sc_time)];

er = errorbar(x,vals,errlow,errhigh);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
er.LineWidth = 2;

ax=gca;
ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
xticks([])
set(gca,'TickLabelInterpreter','latex')

ylabel('avg[$s_c$]','fontsize',30,'interpreter','latex')
title('$s_c$ evolution at $tr.=5$','fontsize',30,'interpreter','latex')

print(fig,['C:\Users\hais0030\Documents\MATLAB\FilamentLifeCycles_det_ks\evosim_nomix_contrasting_randn\plots_transfers\plot_evosim_nomix_bars_sc_'+surv],'-depsc','-r300')




% sg
fig=figure;
hold on
x=1:1:4;
vals=[mean(t5sg_cd) mean(t5sg_bf) mean(t5sg_space) mean(t5sg_time)];
b=bar(x,vals, 'facecolor', 'flat');
b.CData = colors;

% lgd=legend('CD','BF','stoc. space','stoc. time','Interpreter',"latex",'Location','northwest');
% lgd.FontSize = 16;
% legend boxoff

errlow=[std(t5sg_cd) std(t5sg_bf) std(t5sg_space) std(t5sg_time)];
errhigh=[std(t5sg_cd) std(t5sg_bf) std(t5sg_space) std(t5sg_time)];

er = errorbar(x,vals,errlow,errhigh);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
er.LineWidth = 2;

ax=gca;
ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
xticks([])
set(gca,'TickLabelInterpreter','latex')

ylabel('avg[$s_g$]','fontsize',30,'interpreter','latex')
title('$s_g$ evolution at $tr.=5$','fontsize',30,'interpreter','latex')

print(fig,['C:\Users\hais0030\Documents\MATLAB\FilamentLifeCycles_det_ks\evosim_nomix_contrasting_randn\plots_transfers\plot_evosim_nomix_bars_sg_'+surv],'-depsc','-r300')




