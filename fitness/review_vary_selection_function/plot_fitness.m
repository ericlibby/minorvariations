% plot fitness analysis

clear

sel=1;
if sel==1
    % load data from fitness calculation
else
    % load data from fitness calculation
end

colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;

% fitness landscape

fig=figure;
hold on
ct=0;
for ia=1:length(as)
    for ib=1:length(bs)
        ct=ct+1;

        a=as(ia);
        b=bs(ib);
        
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
if sel==1
    plot(bs(300),as(25),'o','LineWidth',3,'color','k')
    plot(bs(230),as(50),'o','LineWidth',3,'color','k')
else
    plot(bs(250),as(25),'o','LineWidth',3,'color','k')
    plot(bs(180),as(50),'o','LineWidth',3,'color','k')
end
plot(bs(51),as(60),'o','LineWidth',3,'color','k') % complete dissociation

[as(11),bs(451);as(51),bs(60)]

a=as(11);b=bs(451);
survival=@(x) (c ./ (1+exp(-a*(x-b))))-d;
[survival(1)*16,survival(16)*2,survival(1),survival(8),survival(100)]
a=as(51);b=bs(16);
survival=@(x) (c ./ (1+exp(-a*(x-b))))-d;
[survival(1)*16,survival(16)*2,survival(1),survival(8),survival(100)]


if sel==1
   print(fig,['C:\Users\hais0030\Documents\MATLAB\MinorVariationsAdaptation\CodeSubmission_reviews_1\fitness\review_vary_selection_function\sigmoid_landscape'],'-depsc','-r300') 
else
    print(fig,['C:\Users\hais0030\Documents\MATLAB\MinorVariationsAdaptation\CodeSubmission_reviews_1\fitness\review_vary_selection_function\sigmoid_mod_landscape'],'-depsc','-r300') 
end

% plot selection curves for each environment

colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;

fig=figure;
hold on

xs=linspace(1,8);

survival=@(x) (c ./ (1+exp(-as(11)*(x-bs(451)))))-d;
plot(xs,survival(xs),'LineWidth',2,'color',colors(1,:)) % binary fission
if sel==1
    survival=@(x) (c ./ (1+exp(-as(25)*(x-bs(300)))))-d;
    plot(xs,survival(xs),'LineWidth',2,'color',colors(2,:))
    survival=@(x) (c ./ (1+exp(-as(50)*(x-bs(230)))))-d;
    plot(xs,survival(xs),'LineWidth',2,'color',colors(3,:))
else
    survival=@(x) (c ./ (1+exp(-as(25)*(x-bs(250)))))-d;
    plot(xs,survival(xs),'LineWidth',2,'color',colors(2,:))
    survival=@(x) (c ./ (1+exp(-as(50)*(x-bs(180)))))-d;
    plot(xs,survival(xs),'LineWidth',2,'color',colors(3,:))
end
survival=@(x) (c ./ (1+exp(-as(60)*(x-bs(51)))))-d;
plot(xs,survival(xs),'LineWidth',2,'color',colors(4,:)) % complete dissociation

ylim([0 1])

ax=gca;
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
set(gca,'TickLabelInterpreter','latex')
ylabel('$p_s$','fontsize',24,'interpreter','latex');
xlabel('filament length','fontsize',24,'interpreter','latex');

lgd=legend('$E_{k2}$','$E_{k4}$','$E_{k8}$','$E_{k16}$','Interpreter',"latex",'Location','southeast');
lgd.FontSize = 18;
legend boxoff


if sel==1
   print(fig,['C:\Users\hais0030\Documents\MATLAB\MinorVariationsAdaptation\CodeSubmission_reviews_1\fitness\review_vary_selection_function\sigmoid_curves'],'-depsc','-r300') 
else
    print(fig,['C:\Users\hais0030\Documents\MATLAB\MinorVariationsAdaptation\CodeSubmission_reviews_1\fitness\review_vary_selection_function\sigmoid_mod_curves'],'-depsc','-r300') 
end


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


if sel==1
   print(fig,['C:\Users\hais0030\Documents\MATLAB\MinorVariationsAdaptation\CodeSubmission_reviews_1\fitness\review_vary_selection_function\sigmoid_growthrates'],'-depsc','-r300') 
else
    print(fig,['C:\Users\hais0030\Documents\MATLAB\MinorVariationsAdaptation\CodeSubmission_reviews_1\fitness\review_vary_selection_function\sigmoid_mod_growthrrates'],'-depsc','-r300') 
end


