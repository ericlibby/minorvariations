% plot data
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
    set(gca,'XTick',[0 10 20 30 40 50],'XTickLabel',[0 10 20 30 40 50]);
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
    cur=DataB.(name);
    
    plot(1:1:length(cur(:,1)),(1./cur(:,1))-1,'color',[colors(2,:) .2]);
    ylim([-.05 .2])
    ax=gca;
    ax.XAxis.FontSize = 24;
    ax.YAxis.FontSize = 24;
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'XTick',[0 10 20 30 40 50],'XTickLabel',[0 10 20 30 40 50]);
    set(gca,'YTick',[0 .1 .2],'YTickLabel',[0 .1 .2]);
    xlabel('transfer','fontsize',30,'interpreter','latex')
    ylabel('avg[$s_c$]','fontsize',30,'interpreter','latex')
    title('$k$=4','fontsize',30,'interpreter','latex')
    
    curmean(:,n)=cur(:,1); % to calculate average
    t5sc_bf(n)=(1./cur(5,1))-1; % fixation at timestep 5
end
curavg=(1./mean(curmean,2))-1;
plot(1:1:length(cur(:,1)),curavg,'LineWidth',2,'color',colors(2,:))
meansc_bf=curavg(end);




fig=figure;
hold on
for n=1:sims
    name=['run',num2str(n)];
    cur=DataC.(name);
    
    plot(1:1:length(cur(:,1)),(1./cur(:,1))-1,'color',[colors(3,:) .2]);
    ylim([-.05 .2])
    ax=gca;
    ax.XAxis.FontSize = 24;
    ax.YAxis.FontSize = 24;
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'XTick',[0 10 20 30 40 50],'XTickLabel',[0 10 20 30 40 50]);
    set(gca,'YTick',[0 .1 .2],'YTickLabel',[0 .1 .2]);
    xlabel('transfer','fontsize',30,'interpreter','latex')
    ylabel('avg[$s_c$]','fontsize',30,'interpreter','latex')
    title('$k$=8','fontsize',30,'interpreter','latex')
    
    curmean(:,n)=cur(:,1); % to calculate average
    t5sc_space(n)=(1./cur(5,1))-1; % fixation at timestep 5
end
curavg=(1./mean(curmean,2))-1;
plot(1:1:length(cur(:,1)),curavg,'LineWidth',2,'color',colors(3,:))
meansc_space=curavg(end);



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
    set(gca,'XTick',[0 10 20 30 40 50],'XTickLabel',[0 10 20 30 40 50]);
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
    set(gca,'XTick',[0 10 20 30 40 50],'XTickLabel',[0 10 20 30 40 50]);
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
    cur=DataB.(name);
    
    plot(1:1:length(cur(:,1)),cur(:,2),'color',[colors(2,:) .2]);
    ylim([-.05 .2])
    ax=gca;
    ax.XAxis.FontSize = 24;
    ax.YAxis.FontSize = 24;
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'XTick',[0 10 20 30 40 50],'XTickLabel',[0 10 20 30 40 50]);
    set(gca,'YTick',[0 .1 .2],'YTickLabel',[0 .1 .2]);
    xlabel('transfer','fontsize',30,'interpreter','latex')
    ylabel('avg[$s_g$]','fontsize',30,'interpreter','latex')
    title('$k$=4','fontsize',30,'interpreter','latex')
    
    curmean(:,n)=cur(:,2); % to calculate average
    t5sg_bf(n)=cur(5,2); % fixation at timestep 5
end
curavg=mean(curmean,2);
plot(1:1:length(cur(:,1)),curavg,'LineWidth',2,'color',colors(2,:))
meansg_bf=curavg(end);



fig=figure;
hold on
for n=1:sims
    name=['run',num2str(n)];
    cur=DataC.(name);
    
    plot(1:1:length(cur(:,1)),cur(:,2),'color',[colors(3,:) .2]);
    ylim([-.05 .2])
    ax=gca;
    ax.XAxis.FontSize = 24;
    ax.YAxis.FontSize = 24;
    set(gca,'TickLabelInterpreter','latex')
    set(gca,'XTick',[0 10 20 30 40 50],'XTickLabel',[0 10 20 30 40 50]);
    set(gca,'YTick',[0 .1 .2],'YTickLabel',[0 .1 .2]);
    xlabel('transfer','fontsize',30,'interpreter','latex')
    ylabel('avg[$s_g$]','fontsize',30,'interpreter','latex')
    title('$k$=8','fontsize',30,'interpreter','latex')
    
    curmean(:,n)=cur(:,2); % to calculate average
    t5sg_space(n)=cur(5,2); % fixation at timestep 5
end
curavg=mean(curmean,2);
plot(1:1:length(cur(:,1)),curavg,'LineWidth',2,'color',colors(3,:))
meansg_space=curavg(end);



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
    set(gca,'XTick',[0 10 20 30 40 50],'XTickLabel',[0 10 20 30 40 50]);
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


[meansc_cd,meansc_bf,meansc_space,meansc_time;
    meansg_cd,meansg_bf,meansg_space,meansg_time]

