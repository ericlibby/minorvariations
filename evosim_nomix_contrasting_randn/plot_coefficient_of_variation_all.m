% plot coefficient of variation from evosim no mixing
% std/mean over transfers


colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;


% sc

% loop over transfer, take std and mean at each transfer
for i0=1:its
    curA=[];
    curB=[];
    curC=[];
    curD=[];
    % asses transfer #i0 for all 50 simulations
    for i1=1:sims
        name=['run',num2str(i1)];
        curA(i1,1)=1/DataA.(name)(i0,1)-1; % sc,sg,#muts in a population for each transfer
        curB(i1,1)=1/DataB.(name)(i0,1)-1;
        curC(i1,1)=1/DataC.(name)(i0,1)-1;
        curD(i1,1)=1/DataD.(name)(i0,1)-1;
    end
    % calculate std and mean for each transfer
    std_scA(i0,1)=std(curA);
    mean_scA(i0,1)=mean(curA);
    std_scB(i0,1)=std(curB);
    mean_scB(i0,1)=mean(curB);
    std_scC(i0,1)=std(curC);
    mean_scC(i0,1)=mean(curC);
    std_scD(i0,1)=std(curD);
    mean_scD(i0,1)=mean(curD);
end
% plot std and mean for sc
fig=figure;
hold on
plot(1:1:50,abs(std_scA./mean_scA),'*','color',colors(1,:),'LineWidth',2)
plot(1:1:50,abs(std_scB./mean_scB),'*','color',colors(2,:),'LineWidth',2)
plot(1:1:50,abs(std_scC./mean_scC),'*','color',colors(3,:),'LineWidth',2)
plot(1:1:50,abs(std_scD./mean_scD),'*','color',colors(4,:),'LineWidth',2)

ax=gca;
ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
set(gca,'TickLabelInterpreter','latex')
set(gca,'XTick',[0 10 20 30 40 50],'XTickLabel',[0 10 20 30 40 50]);
%set(gca,'YTick',[0 .1 .2],'YTickLabel',[0 .1 .2]);
xlabel('transfer','fontsize',30,'interpreter','latex')
ylabel('$s_c$: $|\sigma /\mu|$','fontsize',30,'interpreter','latex')


lgd=legend('k=2','k=4','k=8','k=16','Interpreter',"latex",'Location','northeast');
lgd.FontSize = 18;
legend boxoff

ylim([0 15])


% sg

% loop over transfer, take std and mean at each transfer
for i0=1:its
    curA=[];
    curB=[];
    curC=[];
    curD=[];
    % asses transfer #i0 for all 50 simulations
    for i1=1:sims
        name=['run',num2str(i1)];
        curA(i1,1)=DataA.(name)(i0,2); % sc,sg,#muts in a population for each transfer
        curB(i1,1)=DataB.(name)(i0,2);
        curC(i1,1)=DataC.(name)(i0,2);
        curD(i1,1)=DataD.(name)(i0,2);
    end
    % calculate std and mean for each transfer
    std_sgA(i0,1)=std(curA);
    mean_sgA(i0,1)=mean(curA);
    std_sgB(i0,1)=std(curB);
    mean_sgB(i0,1)=mean(curB);
    std_sgC(i0,1)=std(curC);
    mean_sgC(i0,1)=mean(curC);
    std_sgD(i0,1)=std(curD);
    mean_sgD(i0,1)=mean(curD);
end
% plot std and mean for sc
fig=figure;
hold on
plot(1:1:50,abs(std_sgA./mean_sgA),'*','color',colors(1,:),'LineWidth',2)
plot(1:1:50,abs(std_sgB./mean_sgB),'*','color',colors(2,:),'LineWidth',2)
plot(1:1:50,abs(std_sgC./mean_sgC),'*','color',colors(3,:),'LineWidth',2)
plot(1:1:50,abs(std_sgD./mean_sgD),'*','color',colors(4,:),'LineWidth',2)

ax=gca;
ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
set(gca,'TickLabelInterpreter','latex')
set(gca,'XTick',[0 10 20 30 40 50],'XTickLabel',[0 10 20 30 40 50]);
%set(gca,'YTick',[0 .1 .2],'YTickLabel',[0 .1 .2]);
xlabel('transfer','fontsize',30,'interpreter','latex')
ylabel('$s_g$: $|\sigma /\mu|$','fontsize',30,'interpreter','latex')


lgd=legend('k=2','k=4','k=8','k=16','Interpreter',"latex",'Location','northeast');
lgd.FontSize = 18;
legend boxoff

ylim([0 15])









