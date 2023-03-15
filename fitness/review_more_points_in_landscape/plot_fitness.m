% plot fitness analysis

clear
% load data from fitness calculation

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
plot(bs(430),as(5),'pentagram','LineWidth',3,'color','k') % binary fission
plot(bs(465),as(20),'pentagram','LineWidth',3,'color','k') % binary fission
plot(bs(300),as(25),'o','LineWidth',3,'color','k')
plot(bs(230),as(50),'o','LineWidth',3,'color','k')
plot(bs(51),as(60),'o','LineWidth',3,'color','k') % complete dissociation
plot(bs(100),as(40),'pentagram','LineWidth',3,'color','k') % complete dissociation
plot(bs(20),as(10),'pentagram','LineWidth',3,'color','k') % complete dissociation




% Ek2
b=bs(430);a=as(5);
[a,b]
survival=@(x) (1.7 ./ (1+exp(-a*(x-b))))-0.9;
p1=[survival(1)*16,survival(8)*2]

b=bs(465);a=as(20);
[a,b]
survival=@(x) (1.7 ./ (1+exp(-a*(x-b))))-0.9;
p2=[survival(1)*16,survival(8)*2]

% Ek16
b=bs(100);a=as(40);
[a,b]
survival=@(x) (1.7 ./ (1+exp(-a*(x-b))))-0.9;
p3=[survival(1)*16,survival(8)*2]

b=bs(20);a=as(10);
[a,b]
survival=@(x) (1.7 ./ (1+exp(-a*(x-b))))-0.9;
p4=[survival(1)*16,survival(8)*2]




% plot selection curves for each environment

colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;

fig=figure;
hold on

xs=linspace(1,8);

survival=@(x) (1.7 ./ (1+exp(-as(11)*(x-bs(451)))))-0.9;
%plot(xs,survival(xs),'LineWidth',2,'color',colors(1,:)) % binary fission
survival=@(x) (1.7 ./ (1+exp(-as(5)*(x-bs(430)))))-0.9;
plot(xs,survival(xs),':','LineWidth',2,'color',colors(1,:)) % binary fission
survival=@(x) (1.7 ./ (1+exp(-as(20)*(x-bs(465)))))-0.9;
plot(xs,survival(xs),'LineWidth',2,'color',colors(1,:)) % binary fission
% survival=@(x) (1.7 ./ (1+exp(-as(25)*(x-bs(300)))))-0.9;
% plot(xs,survival(xs),'LineWidth',2,'color',colors(2,:))
% survival=@(x) (1.7 ./ (1+exp(-as(50)*(x-bs(230)))))-0.9;
% plot(xs,survival(xs),'LineWidth',2,'color',colors(3,:))
survival=@(x) (1.7 ./ (1+exp(-as(60)*(x-bs(51)))))-0.9;
%plot(xs,survival(xs),'LineWidth',2,'color',colors(4,:)) % complete dissociation
survival=@(x) (1.7 ./ (1+exp(-as(40)*(x-bs(100)))))-0.9;
plot(xs,survival(xs),':','LineWidth',2,'color',colors(4,:)) % complete dissociation
survival=@(x) (1.7 ./ (1+exp(-as(10)*(x-bs(20)))))-0.9;
plot(xs,survival(xs),'LineWidth',2,'color',colors(4,:)) % complete dissociation

ylim([0 1])

ax=gca;
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
set(gca,'TickLabelInterpreter','latex')
ylabel('$p_s$','fontsize',24,'interpreter','latex');
xlabel('filament length','fontsize',24,'interpreter','latex');

lgd=legend('$E_{k2}a$','$E_{k2}b$','$E_{k16}a$','$E_{k16}b$','Interpreter',"latex",'Location','southeast');
lgd.FontSize = 18;
legend boxoff




% plot growth rate in each environment


colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;



fig=figure;
hold on

subplot(2,2,1)

x=1:1:4;
i=5;j=430;
rates=[growth.k_2(i,j) growth.k_4(i,j) growth.k_8(i,j) growth.k_16(i,j)];
b=bar(x,rates, 'facecolor', 'flat');
b.CData = colors;
box off
title('$E_{k2} a$','fontsize',24,'interpreter','latex');
ax=gca;
ax.XAxis.FontSize = 20;
ax.YAxis.FontSize = 20;
xticks([])
set(gca,'TickLabelInterpreter','latex')
ylim([0 1])


subplot(2,2,2)

x=1:1:4;
i=20; j=465;
rates=[growth.k_2(i,j) growth.k_4(i,j) growth.k_8(i,j) growth.k_16(i,j)];
b=bar(x,rates, 'facecolor', 'flat');
b.CData = colors;
box off
title('$E_{k2} b$','fontsize',24,'interpreter','latex');
ax=gca;
ax.XAxis.FontSize = 20;
ax.YAxis.FontSize = 20;
xticks([])
set(gca,'TickLabelInterpreter','latex')
ylim([0 1])


subplot(2,2,3)

x=1:1:4;
i=40;j=100;
rates=[growth.k_2(i,j) growth.k_4(i,j) growth.k_8(i,j) growth.k_16(i,j)];
b=bar(x,rates, 'facecolor', 'flat');
b.CData = colors;
box off
title('$E_{k16} a$','fontsize',24,'interpreter','latex');
ax=gca;
ax.XAxis.FontSize = 20;
ax.YAxis.FontSize = 20;
xticks([])
set(gca,'TickLabelInterpreter','latex')
ylim([0 1])




subplot(2,2,4)

x=1:1:4;
i=10;j=20;
rates=[growth.k_2(i,j) growth.k_4(i,j) growth.k_8(i,j) growth.k_16(i,j)];
b=bar(x,rates, 'facecolor', 'flat');
b.CData = colors;
box off
title('$E_{k16} b$','fontsize',24,'interpreter','latex');
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




