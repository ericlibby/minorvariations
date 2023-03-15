% plot fitness analysis

clear
% load data from fitness calculation

colors=[255,255,255;55,126,184;77,175,74;152,78,163]/255; 

fig=figure;
hold on
ct=0;
for ia=1:length(as)
    for ib=1:length(bs)
        ct=ct+1;

        a=as(ia);
        b=bs(ib);
        survival=@(x) (1.7 ./ (1+exp(-a*(x-b))))-0.9;

        r_cur=[growth.k_2(ia,ib) growth.k_4(ia,ib) growth.k_8(ia,ib)]; 
       
        if survival(1)<1/8 %length(find(r_cur==max(r_cur)))>1
            win(ia,ib)=0;
        else
           win(ia,ib)=find(r_cur==max(r_cur)); %save winning strategy
         end

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
k2a=ceil(.7*length(as));k2b=ceil(.8*length(bs));
k4a=ceil(.7*length(as));k4b=ceil(.5*length(bs));
k8a=ceil(.7*length(as));k8b=ceil(.2*length(bs));
plot(bs(k2b),as(k2a),'o','LineWidth',3,'color','k') % binary fission
plot(bs(k4b),as(k4a),'o','LineWidth',3,'color','k') 
plot(bs(k8b),as(k8a),'o','LineWidth',3,'color','k') % complete dissociation

[as(k2a),bs(k2b);as(k8a),bs(k8b)]




% plot selection curves for each environment

colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;

fig=figure;
hold on

xs=linspace(1,4);

survival=@(x) (1.7 ./ (1+exp(-as(k2a)*(x-bs(k2b)))))-0.9;
plot(xs,survival(xs),'LineWidth',2,'color',colors(1,:)) % binary fission
survival=@(x) (1.7 ./ (1+exp(-as(k4a)*(x-bs(k4b)))))-0.9;
plot(xs,survival(xs),'LineWidth',2,'color',colors(2,:))
survival=@(x) (1.7 ./ (1+exp(-as(k8a)*(x-bs(k8b)))))-0.9;
plot(xs,survival(xs),'LineWidth',2,'color',colors(3,:)) % complete dissociation

ylim([0 1])

ax=gca;
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
set(gca,'TickLabelInterpreter','latex')
ylabel('$p_s$','fontsize',24,'interpreter','latex');
xlabel('filament length','fontsize',24,'interpreter','latex');

lgd=legend('$E_{k2}$','$E_{k4}$','$E_{k8}$','Interpreter',"latex",'Location','southeast');
lgd.FontSize = 18;
legend boxoff



% plot growth rate in each environment

colors=[55,126,184;77,175,74;152,78,163]/255;


fig=figure;
hold on

subplot(3,1,1)

x=1:1:3;
i=k2a;j=k2b;
rates=[growth.k_2(i,j) growth.k_4(i,j) growth.k_8(i,j)];
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


subplot(3,1,2)

x=1:1:3;
i=k4a;j=k4b;
rates=[growth.k_2(i,j) growth.k_4(i,j) growth.k_8(i,j)];
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


subplot(3,1,3)

x=1:1:3;
i=k8a;j=k8b;
rates=[growth.k_2(i,j) growth.k_4(i,j) growth.k_8(i,j)];
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






