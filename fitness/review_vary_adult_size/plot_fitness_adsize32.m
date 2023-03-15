% plot fitness analysis

clear
% load data from fitness calculation

colors=[255,255,255;55,126,184;77,175,74;152,78,163;228,26,28;255,127,0]/255; % ks = 2 4 8 16 32


fig=figure;
hold on
ct=0;
for ia=1:length(as)
    for ib=1:length(bs)
        ct=ct+1;

        a=as(ia);
        b=bs(ib);
        survival=@(x) (1.7 ./ (1+exp(-a*(x-b))))-0.9;
        
        sur(ia,ib)=survival(1);


        r_cur=[growth.k_2(ia,ib) growth.k_4(ia,ib) growth.k_8(ia,ib) growth.k_16(ia,ib) growth.k_32(ia,ib)]; 
        
        if survival(1)<1/32 %length(find(r_cur==max(r_cur)))>1
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
k2a=ceil(.17*length(as));k2b=ceil(.65*length(bs));
k4a=ceil(.4*length(as));k4b=ceil(.6*length(bs));
k8a=ceil(.7*length(as));k8b=ceil(.6*length(bs));
k16a=ceil(.7*length(as));k16b=ceil(.4*length(bs));
k32a=ceil(.7*length(as));k32b=ceil(.1*length(bs));
plot(bs(k2b),as(k2a),'o','LineWidth',3,'color','k') % binary fission
plot(bs(k4b),as(k4a),'o','LineWidth',3,'color','k') 
plot(bs(k8b),as(k8a),'o','LineWidth',3,'color','k')
plot(bs(k16b),as(k16a),'o','LineWidth',3,'color','k')
plot(bs(k32b),as(k32a),'o','LineWidth',3,'color','k') % complete dissociation

[as(k2a),bs(k2b);as(k32a),bs(k32b)]




% plot selection curves for each environment

colors=[55,126,184;77,175,74;152,78,163;228,26,28;255,127,0]/255; % ks = 2 4 8 16 32


fig=figure;
hold on

xs=linspace(1,16);

survival=@(x) (1.7 ./ (1+exp(-as(k2a)*(x-bs(k2b)))))-0.9;
plot(xs,survival(xs),'LineWidth',2,'color',colors(1,:)) % binary fission
survival=@(x) (1.7 ./ (1+exp(-as(k4a)*(x-bs(k4b)))))-0.9;
plot(xs,survival(xs),'LineWidth',2,'color',colors(2,:)) 
survival=@(x) (1.7 ./ (1+exp(-as(k8a)*(x-bs(k8b)))))-0.9;
plot(xs,survival(xs),'LineWidth',2,'color',colors(3,:))
survival=@(x) (1.7 ./ (1+exp(-as(k16a)*(x-bs(k16b)))))-0.9;
plot(xs,survival(xs),'LineWidth',2,'color',colors(4,:))
survival=@(x) (1.7 ./ (1+exp(-as(k32a)*(x-bs(k32b)))))-0.9;
plot(xs,survival(xs),'LineWidth',2,'color',colors(5,:)) % complete dissociation

ylim([0 1])

ax=gca;
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
set(gca,'TickLabelInterpreter','latex')
ylabel('$p_s$','fontsize',24,'interpreter','latex');
xlabel('filament length','fontsize',24,'interpreter','latex');

lgd=legend('$E_{k2}$','$E_{k4}$','$E_{k8}$','$E_{k16}$','$E_{k32}$','Interpreter',"latex",'Location','southeast');
%lgd=legend('$k$=4','$k$=8','$k$=16','$k$=32','Interpreter',"latex",'Location','southeast');
lgd.FontSize = 18;
legend boxoff




% plot growth rate in each environment


colors=[55,126,184;77,175,74;152,78,163;228,26,28;255,127,0]/255; % ks = 2 4 8 16 32


fig=figure;
hold on

subplot(2,3,1)

x=1:1:5;
i=k2a;j=k2b;
rates=[growth.k_2(i,j) growth.k_4(i,j) growth.k_8(i,j) growth.k_16(i,j) growth.k_32(i,j)];
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


subplot(2,3,2)

x=1:1:5;
i=k4a;j=k4b;
rates=[growth.k_2(i,j) growth.k_4(i,j) growth.k_8(i,j) growth.k_16(i,j) growth.k_32(i,j)];
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


subplot(2,3,3)

x=1:1:5;
i=k8a;j=k8b;
rates=[growth.k_2(i,j) growth.k_4(i,j) growth.k_8(i,j) growth.k_16(i,j) growth.k_32(i,j)];
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




subplot(2,3,4)

x=1:1:5;
i=k16a;j=k16b;
rates=[growth.k_2(i,j) growth.k_4(i,j) growth.k_8(i,j) growth.k_16(i,j) growth.k_32(i,j)];
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


subplot(2,3,5)

x=1:1:5;
i=k32a;j=k32b;
rates=[growth.k_2(i,j) growth.k_4(i,j) growth.k_8(i,j) growth.k_16(i,j) growth.k_32(i,j)];
b=bar(x,rates, 'facecolor', 'flat');
b.CData = colors;
box off
title('$E_{k32}$','fontsize',24,'interpreter','latex');
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




