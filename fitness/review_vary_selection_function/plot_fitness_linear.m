% plot fitness analysis


clear
% load data from fitness calculation

colors=[255,255,255;55,126,184;77,175,74;152,78,163;228,26,28]/255;

% fitness landscape
fig=figure;
hold on
ct=0;
win=zeros(length(bs),length(as));

for ib=1:length(bs)
    b=bs(ib);
    for ia=1:length(as)
        a=as(ia);
        ct=ct+1;

        survival=@(x) a*x+b;
        
        r_cur=[growth.k_2(ib,ia) growth.k_4(ib,ia) growth.k_8(ib,ia) growth.k_16(ib,ia)]; 
        if survival(1)<1/8
            win(ib,ia)=0;
        else
            win(ib,ia)=find(r_cur==max(r_cur)); %save winning strategy
        end
        
    end
end

h=pcolor(as,bs,win);
view(2)
colormap(colors)
set(h, 'EdgeColor', 'none')
title('fittest strategy','fontsize',20,'interpreter','latex')
ax=gca;
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
set(gca,'TickLabelInterpreter','latex')
ylabel('$b$','fontsize',24,'interpreter','latex');
xlabel('$a$','fontsize',24,'interpreter','latex');


% plot dots for each environment
k2a=ceil(length(as)*.7);k2b=ceil(length(bs)*.05);
k16a=ceil(length(as)*.1);k16b=ceil(length(bs)*.8);
plot(as(k2a),bs(k2b),'o','LineWidth',3,'color','k') % binary fission
plot(as(k16a),bs(k16b),'o','LineWidth',3,'color','k') % complete dissociation

[as(k2a),bs(k2b);as(k16a),bs(k16b)]

a=as(k2a);b=bs(k2b);
survival=@(x)a*x+b;
[survival(1)*16,survival(8)*2]
a=as(k16a);b=bs(k16b);
survival=@(x)a*x+b;
[survival(1)*16,survival(8)*2]




% plot selection curves for each environment


colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;

fig=figure;
hold on

xs=linspace(1,8);

a=as(k2a);b=bs(k2b);
survival=@(x) a*x+b;
plot(xs,survival(xs),'LineWidth',2,'color',colors(1,:)) % binary fission


a=as(k16a);b=bs(k16b);
survival=@(x) a*x+b;
plot(xs,survival(xs),'LineWidth',2,'color',colors(4,:)) % complete dissociation

ylim([0 1])

ax=gca;
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
set(gca,'TickLabelInterpreter','latex')
ylabel('$p_s$','fontsize',24,'interpreter','latex');
xlabel('filament length','fontsize',24,'interpreter','latex');


lgd=legend('$E_{k2}$','$E_{k16}$','Interpreter',"latex",'Location','southeast');
lgd.FontSize = 18;
legend boxoff



% plot growth rate in each environment


fig=figure;
hold on

subplot(2,1,1)

x=1:1:4;
j=k2a;i=k2b;
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



subplot(2,1,2)

x=1:1:4;
j=k16a;i=k16b;
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




%%
N=16;
k=[2,4,8,16];
as=.005:.0005:.1; % slope
bs=.05:.005:.75; % intersection
for ia=1:length(as)
    a=as(ia);
    for ib=1:length(bs)
        b=bs(ib);
    
        l=[log(a*N+b*k)./log(ks), log(a*2+b*2)./log(2)]; % added uni
        s(ib,ia)=find(l==max(l)); % only gives bf or cd
        
    end 
end
