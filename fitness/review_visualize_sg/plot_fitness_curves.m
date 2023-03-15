
% plot selection curves for each environment

a=.4;b=0;
survival=@(x) (1.7 ./ (1+exp(-a*(x-b))))-0.9;

colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;

fig=figure;
hold on

xs=linspace(1,16);

plot(xs,survival(xs),'LineWidth',2,'color',colors(1,:)) % original EB
plot(xs,survival(xs)*.9,':','LineWidth',2,'color',colors(1,:)) % sg=-.1
plot(xs,survival(xs)*1.1,'-.','LineWidth',2,'color',colors(1,:)) % sg=.1

ylim([0 1])

ax=gca;
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
set(gca,'TickLabelInterpreter','latex')
ylabel('$p_s(x)(1+s_g)$','fontsize',24,'interpreter','latex');
xlabel('filament length','fontsize',24,'interpreter','latex');

lgd=legend('$s_g$=0','$s_g$=-0.1','$s_g$=0.1','Interpreter',"latex",'Location','southeast');
lgd.FontSize = 18;
legend boxoff






