% plot fitness analysis

% plot selection curves for each environment

colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;

fig=figure;
hold on

xs=linspace(1,8);

a=.4;b=0;
survival=@(x) (1.7 ./ (1+exp(-a*(x-b))))-0.9;
plot(xs,survival(xs),'LineWidth',2,'color',colors(1,:)) % binary fission
a1=.6;
survival=@(x) (1.7 ./ (1+exp(-a1*(x-b))))-0.9;
plot(xs,survival(xs),':','LineWidth',2,'color',colors(1,:)) % vary a
b1=-2;
survival=@(x) (1.7 ./ (1+exp(-a*(x-b1))))-0.9;
plot(xs,survival(xs),'-.','LineWidth',2,'color',colors(1,:)) % vary b


ylim([0 1])

ax=gca;
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
set(gca,'TickLabelInterpreter','latex')
ylabel('$p_s$','fontsize',24,'interpreter','latex');
xlabel('filament length','fontsize',24,'interpreter','latex');

lgd=legend(['$a$=',num2str(a),'$, b$=',num2str(b)],['$a$=',num2str(a1),'$, b$=',num2str(b)],['$a$=',num2str(a),'$, b$=',num2str(b1)],'Interpreter',"latex",'Location','southeast');
lgd.FontSize = 18;
legend boxoff


