% extinction rates

% sg mutations
colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;

% create data for errorbars
[errk2,errk4,errk8,errk16]=...
    produce_errorbars(Mut_fix_k2,Mut_fix_k4,Mut_fix_k8,Mut_fix_k16,sims,sgs);

% k=2 and k=16
fig=figure;
hold on

errorbar(sgs,100*(sims-Mut_fix_k2)/sims,100*errk2,'o','LineWidth',2,'color',colors(1,:))
errorbar(sgs,100*(sims-Mut_fix_k16)/sims,100*errk16,'o','LineWidth',2,'color',colors(4,:))

plot(sgs,100*(sims-Mut_fix_k2)/sims,'LineWidth',3,'color',[colors(1,:) .3])
plot(sgs,100*(sims-Mut_fix_k16)/sims,'LineWidth',3,'color',[colors(4,:) .3])

plot(sgs,100*(sims-Mut_fix_k2)/sims,'o','LineWidth',4,'color',colors(1,:))
plot(sgs,100*(sims-Mut_fix_k16)/sims,'o','LineWidth',4,'color',colors(4,:))


ylim([0 100])

title('$s_c=0$','fontsize',24,'interpreter','latex')
xlabel('$s_g$','fontsize',24,'interpreter','latex')
ylabel('extinction $\%$','fontsize',24,'interpreter','latex')
ax=gca;
ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
set(gca,'TickLabelInterpreter','latex')


%

% k=4 and k=8
fig=figure;
hold on

errorbar(sgs,100*(sims-Mut_fix_k4)/sims,100*errk2,'o','LineWidth',2,'color',colors(2,:))
errorbar(sgs,100*(sims-Mut_fix_k8)/sims,100*errk16,'o','LineWidth',2,'color',colors(3,:))

plot(sgs,100*(sims-Mut_fix_k4)/sims,'LineWidth',3,'color',[colors(2,:) .3])
plot(sgs,100*(sims-Mut_fix_k8)/sims,'LineWidth',3,'color',[colors(3,:) .3])

plot(sgs,100*(sims-Mut_fix_k4)/sims,'o','LineWidth',4,'color',colors(2,:))
plot(sgs,100*(sims-Mut_fix_k8)/sims,'o','LineWidth',4,'color',colors(3,:))


ylim([0 100])

title('$s_c=0$','fontsize',24,'interpreter','latex')
xlabel('$s_g$','fontsize',24,'interpreter','latex')
ylabel('extinction $\%$','fontsize',24,'interpreter','latex')
ax=gca;
ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
set(gca,'TickLabelInterpreter','latex')

