% plot fitness analysis


colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;



fig=figure;
hold on
ct=0;
for ia=1:length(as)
    for ib=1:length(bs)
        ct=ct+1;

        a=as(ia);
        b=bs(ib);
        survival=@(x) (1.7 ./ (1+exp(-a*(x-b))))-0.9;


        r_cur=[growth.k_2(ia,ib) growth.k_4(ia,ib) growth.k_8(ia,ib) growth.k_16(ia,ib)]; % growth_uni(ia,ib) 
        win(ia,ib)=find(r_cur==max(r_cur)); %save winning strategy


    end
end

h=pcolor(bs,as,win);
view(2)
colormap(colors)
set(h, 'EdgeColor', 'none')
title('fittest strategy','fontsize',20,'interpreter','latex')
ax=gca;
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
set(gca,'TickLabelInterpreter','latex')
ylabel('$a$','fontsize',24,'interpreter','latex');
xlabel('$b$','fontsize',24,'interpreter','latex');


% plot dots for each environment
plot(bs(451),as(11),'o','LineWidth',3,'color','k') % binary fission
plot(bs(300),as(25),'o','LineWidth',3,'color','k')
plot(bs(230),as(50),'o','LineWidth',3,'color','k')
plot(bs(51),as(60),'o','LineWidth',3,'color','k') % complete dissociation



% plot selection curves for each environment

colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;

fig=figure;
hold on

xs=linspace(1,20);

survival=@(x) (1.7 ./ (1+exp(-as(11)*(x-bs(451)))))-0.9;
plot(xs,survival(xs),'LineWidth',2,'color',colors(1,:)) % binary fission
survival=@(x) (1.7 ./ (1+exp(-as(25)*(x-bs(300)))))-0.9;
plot(xs,survival(xs),'LineWidth',2,'color',colors(2,:))
survival=@(x) (1.7 ./ (1+exp(-as(50)*(x-bs(230)))))-0.9;
plot(xs,survival(xs),'LineWidth',2,'color',colors(3,:))
survival=@(x) (1.7 ./ (1+exp(-as(60)*(x-bs(51)))))-0.9;
plot(xs,survival(xs),'LineWidth',2,'color',colors(4,:)) % complete dissociation

ylim([0 1])

ax=gca;
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
set(gca,'TickLabelInterpreter','latex')
ylabel('$p_s$','fontsize',24,'interpreter','latex');
xlabel('filament length','fontsize',24,'interpreter','latex');

lgd=legend('$k$=2','$k$=4','$k$=8','$k$=16','Interpreter',"latex",'Location','southeast');
lgd.FontSize = 18;
legend boxoff


% plot growth rate in each environment


colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;



fig=figure;
hold on

subplot(2,2,1)

x=1:1:4;
i=11;j=451;
rates=[growth.k_2(i,j) growth.k_4(i,j) growth.k_8(i,j) growth.k_16(i,j)];
b=bar(x,rates, 'facecolor', 'flat');
b.CData = colors;
box off
title('$E_{k2}$','fontsize',24,'interpreter','latex');
ax=gca;
ax.XAxis.FontSize = 20;
ax.YAxis.FontSize = 20;
xticks([])
set(gca,'TickLabelInterpreter','latex')
ylim([0 1])


subplot(2,2,2)

x=1:1:4;
i=25;j=300;
rates=[growth.k_2(i,j) growth.k_4(i,j) growth.k_8(i,j) growth.k_16(i,j)];
b=bar(x,rates, 'facecolor', 'flat');
b.CData = colors;
box off
title('$E_{k4}$','fontsize',24,'interpreter','latex');
ax=gca;
ax.XAxis.FontSize = 20;
ax.YAxis.FontSize = 20;
xticks([])
set(gca,'TickLabelInterpreter','latex')
ylim([0 1])


subplot(2,2,3)

x=1:1:4;
i=50;j=230;
rates=[growth.k_2(i,j) growth.k_4(i,j) growth.k_8(i,j) growth.k_16(i,j)];
b=bar(x,rates, 'facecolor', 'flat');
b.CData = colors;
box off
title('$E_{k8}$','fontsize',24,'interpreter','latex');
ax=gca;
ax.XAxis.FontSize = 20;
ax.YAxis.FontSize = 20;
xticks([])
set(gca,'TickLabelInterpreter','latex')
ylim([0 1])




subplot(2,2,4)

x=1:1:4;
%x=5;y=51;
i=60;j=51;
rates=[growth.k_2(i,j) growth.k_4(i,j) growth.k_8(i,j) growth.k_16(i,j)];
b=bar(x,rates, 'facecolor', 'flat');
b.CData = colors;
box off
title('$E_{k16}$','fontsize',24,'interpreter','latex');
ax=gca;
ax.XAxis.FontSize = 20;
ax.YAxis.FontSize = 20;
xticks([])
set(gca,'TickLabelInterpreter','latex')
ylim([0 1])


h = axes(fig,'visible','off'); 
h.Title.Visible = 'on';
h.XLabel.Visible = 'on';
h.YLabel.Visible = 'on';
ylabel(h,'growth rate','fontsize',24,'interpreter','latex');




