% plot contrasting mutations

% time for mutation to reach 50% of population size

% laod data from calculation 

figname="altruistic";
%figname="selfish";


colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;

% determine colorbar limits from data
minColorLimit = -.0005; % -100, -150    
maxColorLimit = 1e-2;


% binary fission
cmap=[255,255,255
    240,243,255
198,219,239
158,202,225
107,174,214
49,130,189
8,81,156]./265;

fig=figure;


dif=M.k_2>=1e-3; % mutations that fullfil mutprop>=.5

ct=0;
for i=1:length(scs)
    for j=1:length(sgs)
        if dif(j,i)==1
            ct=ct+1;
            mrk(ct,:)=[i,j];
            break
        end
    end
end
hold on
%plot3(scs(mrk(:,1)),sgs(mrk(:,2)),ones(length(mrk),1)*5000,'color',[0 0 0],'LineWidth',3,'LineStyle',':') % plot boundary of fixation
plot3(scs(mrk(:,1)),sgs(mrk(:,2)),ones(length(mrk),1)*5000,'color',[0 0 0],'LineWidth',3) % plot boundary of fixation

frac_k2=sum(sum(dif))/(size(dif,1)*size(dif,2)); % fraction of paramter space where mutation reach 50% of population size


M.k_2(M.k_2==0)=minColorLimit;

[X,Y]=meshgrid(scs,sgs);
pc=pcolor(scs,sgs,M.k_2);
set(pc, 'EdgeColor', 'none');
% color: picks value in top right corner 
a=gca;
caxis(a,[minColorLimit,maxColorLimit]);
view(2)
colormap(cmap)

title('$k$=2','fontsize',20,'interpreter','latex')
ax=gca;
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
set(gca,'TickLabelInterpreter','latex')
%set(gca,'YTick',[0 .1 .2]-.025,'YTickLabel',[0 .1 .2]);
%set(gca,'XTick',[-.4 -.3 -.2 -.1 0]-.025,'XTickLabel',[-.4 -.3 -.2 -.1 0]);
set(gca,'XTick',[scs(1) scs(26) scs(76) scs(100)],'XTickLabel',[scs(1) round(scs(26),2) round(scs(76),2) scs(100)])
set(gca,'YTick',[sgs(1) sgs(26) sgs(76) sgs(100)],'YTickLabel',[sgs(1) round(sgs(26),2) round(sgs(76),2) sgs(100)])

h = axes(fig,'visible','off'); 
h.Title.Visible = 'on';
h.XLabel.Visible = 'on';
h.YLabel.Visible = 'on';
ylabel(h,'$s_g$','fontsize',24,'interpreter','latex');
xlabel(h,'$s_c$','fontsize',24,'interpreter','latex');
c = colorbar(h,'Position',[0.93 0.168 0.022 0.7]);  % attach colorbar to h
colormap(c,cmap)
caxis(h,[minColorLimit,maxColorLimit]);             % set colorbar limits
c.TickLabelInterpreter = 'latex';
c.FontSize = 16;



% k=4
cmap=[255,255,255
    237,248,233
199,233,192
161,217,155
116,196,118
49,163,84
0,109,44]./265;

fig=figure;


dif=M.k_4>1e-3; % mutations that fullfil mutprop>=.5

ct=0;
for i=1:length(scs)
    for j=1:length(sgs)
        if dif(j,i)==1
            ct=ct+1;
            mrk(ct,:)=[i,j];
            break
        end
    end
end
hold on
if surv=="E_k16" && mut=="altruistic"
    id=67;
    plot3(scs(mrk(1:id,1)),sgs(mrk(1:id,2)),ones(id,1)*150000,'color',[0 0 0],'LineWidth',3)
elseif surv=="E_k4" && mut=="altruistic"
    id=73;
    plot3(scs(mrk(1:id,1)),sgs(mrk(1:id,2)),ones(id,1)*150000,'color',[0 0 0],'LineWidth',3)
elseif surv=="E_k8" && mut=="altruistic"
    id=68;
    plot3(scs(mrk(1:id,1)),sgs(mrk(1:id,2)),ones(id,1)*150000,'color',[0 0 0],'LineWidth',3)
elseif surv=="E_k16" && mut=="selfish"
    id=98;
    plot3(scs(mrk(1:id,1)),sgs(mrk(1:id,2)),ones(id,1)*150000,'color',[0 0 0],'LineWidth',3)
elseif surv=="E_k2" && mut=="selfish"
    id=98;
    plot3(scs(mrk(1:id,1)),sgs(mrk(1:id,2)),ones(id,1)*150000,'color',[0 0 0],'LineWidth',3)
else
    plot3(scs(mrk(:,1)),sgs(mrk(:,2)),ones(length(mrk(:,1)),1)*150000,'color',[0 0 0],'LineWidth',3)
end
%plot3(scs(mrk(:,1)),sgs(mrk(:,2)),ones(length(mrk),1)*5000,'color',[0 0 0],'LineWidth',3,'LineStyle',':') % plot boundary of fixation

frac_k4=sum(sum(dif))/(size(dif,1)*size(dif,2)); % fraction of paramter space where mutation reach 50% of population size


M.k_4(M.k_2==0)=minColorLimit;


[X,Y]=meshgrid(scs,sgs);
pc=pcolor(scs,sgs,M.k_4);
set(pc, 'EdgeColor', 'none');
% color: picks value in top right corner 
a=gca;
caxis(a,[minColorLimit,maxColorLimit]);
view(2)
colormap(cmap)

title('$k$=4','fontsize',20,'interpreter','latex')
ax=gca;
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
set(gca,'TickLabelInterpreter','latex')
%set(gca,'YTick',[0 .1 .2]-.025,'YTickLabel',[0 .1 .2]);
%set(gca,'XTick',[-.4 -.3 -.2 -.1 0]-.025,'XTickLabel',[-.4 -.3 -.2 -.1 0]);
set(gca,'XTick',[scs(1) scs(26) scs(76) scs(100)],'XTickLabel',[scs(1) round(scs(26),2) round(scs(76),2) scs(100)])
set(gca,'YTick',[sgs(1) sgs(26) sgs(76) sgs(100)],'YTickLabel',[sgs(1) round(sgs(26),2) round(sgs(76),2) sgs(100)])

h = axes(fig,'visible','off'); 
h.Title.Visible = 'on';
h.XLabel.Visible = 'on';
h.YLabel.Visible = 'on';
ylabel(h,'$s_g$','fontsize',24,'interpreter','latex');
xlabel(h,'$s_c$','fontsize',24,'interpreter','latex');
c = colorbar(h,'Position',[0.93 0.168 0.022 0.7]);  % attach colorbar to h
colormap(c,cmap)
caxis(h,[minColorLimit,maxColorLimit]);             % set colorbar limits
c.TickLabelInterpreter = 'latex';
c.FontSize = 16;




% k=8
cmap=[255,255,255
    242,240,247
218,218,235
188,189,220
158,154,200
117,107,177
84,39,143]./265;

fig=figure;


dif=M.k_8>1e-3; % mutations that fullfil mutprop>=.5

ct=0;
for i=1:length(scs)
    for j=1:length(sgs)
        if dif(j,i)==1
            ct=ct+1;
            mrk(ct,:)=[i,j];
            break
        end
    end
end
hold on
if surv=="E_k16" && mut=="altruistic"
    id=44;
    plot3(scs(mrk(1:id,1)),sgs(mrk(1:id,2)),ones(id,1)*150000,'color',[0 0 0],'LineWidth',3)
elseif surv=="E_k4" && mut=="altruistic"
    id=53;
    plot3(scs(mrk(1:id,1)),sgs(mrk(1:id,2)),ones(id,1)*150000,'color',[0 0 0],'LineWidth',3)
elseif surv=="E_k8" && mut=="altruistic"
    id=45;
    plot3(scs(mrk(1:id,1)),sgs(mrk(1:id,2)),ones(id,1)*150000,'color',[0 0 0],'LineWidth',3)
elseif surv=="E_k16" && mut=="selfish"
    id=98;
    plot3(scs(mrk(1:id,1)),sgs(mrk(1:id,2)),ones(id,1)*150000,'color',[0 0 0],'LineWidth',3)
elseif surv=="E_k2" && mut=="selfish"
    id=98;
    plot3(scs(mrk(1:id,1)),sgs(mrk(1:id,2)),ones(id,1)*150000,'color',[0 0 0],'LineWidth',3)
else
    plot3(scs(mrk(:,1)),sgs(mrk(:,2)),ones(length(mrk(:,1)),1)*150000,'color',[0 0 0],'LineWidth',3)
end
%plot3(scs(mrk(:,1)),sgs(mrk(:,2)),ones(length(mrk),1)*5000,'color',[0 0 0],'LineWidth',3,'LineStyle',':') % plot boundary of fixation

frac_k8=sum(sum(dif))/(size(dif,1)*size(dif,2)); % fraction of paramter space where mutation reach 50% of population size


M.k_8(M.k_2==0)=minColorLimit;


[X,Y]=meshgrid(scs,sgs);
pc=pcolor(scs,sgs,M.k_8);
set(pc, 'EdgeColor', 'none');
% color: picks value in top right corner 
a=gca;
caxis(a,[minColorLimit,maxColorLimit]);
view(2)
colormap(cmap)

title('$k$=8','fontsize',20,'interpreter','latex')
ax=gca;
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
set(gca,'TickLabelInterpreter','latex')
%set(gca,'YTick',[0 .1 .2]-.025,'YTickLabel',[0 .1 .2]);
%set(gca,'XTick',[-.4 -.3 -.2 -.1 0]-.025,'XTickLabel',[-.4 -.3 -.2 -.1 0]);
set(gca,'XTick',[scs(1) scs(26) scs(76) scs(100)],'XTickLabel',[scs(1) round(scs(26),2) round(scs(76),2) scs(100)])
set(gca,'YTick',[sgs(1) sgs(26) sgs(76) sgs(100)],'YTickLabel',[sgs(1) round(sgs(26),2) round(sgs(76),2) sgs(100)])

h = axes(fig,'visible','off'); 
h.Title.Visible = 'on';
h.XLabel.Visible = 'on';
h.YLabel.Visible = 'on';
ylabel(h,'$s_g$','fontsize',24,'interpreter','latex');
xlabel(h,'$s_c$','fontsize',24,'interpreter','latex');
c = colorbar(h,'Position',[0.93 0.168 0.022 0.7]);  % attach colorbar to h
colormap(c,cmap)
caxis(h,[minColorLimit,maxColorLimit]);             % set colorbar limits
c.TickLabelInterpreter = 'latex';
c.FontSize = 16;





% complete dissociaiton
cmap=[255,255,255
    254,229,217
252,187,161
252,146,114
251,106,74
222,45,38
165,15,21]./265;

fig=figure;

dif=M.k_16>1e-3; % mutations that fullfil mutprop>=.5

ct=0;
for i=1:length(scs)
    for j=1:length(sgs)
        if dif(j,i)==1
            ct=ct+1;
            mrk(ct,:)=[i,j];
            break
        end
    end
end
hold on
if surv=="E_k16" && mut=="altruistic"
    id=33;
    plot3(scs(mrk(1:id,1)),sgs(mrk(1:id,2)),ones(id,1)*150000,'color',[0 0 0],'LineWidth',3)
elseif surv=="E_k4" && mut=="altruistic"
    id=42;
    plot3(scs(mrk(1:id,1)),sgs(mrk(1:id,2)),ones(id,1)*150000,'color',[0 0 0],'LineWidth',3)
elseif surv=="E_k8" && mut=="altruistic"
    id=35;
    plot3(scs(mrk(1:id,1)),sgs(mrk(1:id,2)),ones(id,1)*150000,'color',[0 0 0],'LineWidth',3)
elseif surv=="E_k16" && mut=="selfish"
    id=98;
    plot3(scs(mrk(1:id,1)),sgs(mrk(1:id,2)),ones(id,1)*150000,'color',[0 0 0],'LineWidth',3)
elseif surv=="E_k2" && mut=="selfish"
    id=98;
    plot3(scs(mrk(1:id,1)),sgs(mrk(1:id,2)),ones(id,1)*150000,'color',[0 0 0],'LineWidth',3)
else
    plot3(scs(mrk(:,1)),sgs(mrk(:,2)),ones(length(mrk(:,1)),1)*150000,'color',[0 0 0],'LineWidth',3)
end

frac_k16=sum(sum(dif))/(size(dif,1)*size(dif,2)); % fraction of paramter space where mutation reach 50% of population size


M.k_16(M.k_2==0)=minColorLimit;


[X,Y]=meshgrid(scs,sgs);
pc=surf(X,Y,M.k_16);
set(pc, 'EdgeColor', 'none');
d=gca;
caxis(d,[minColorLimit,maxColorLimit]); 
view(2)
colormap(cmap)

title('$k$=16','fontsize',20,'interpreter','latex')
ax=gca;
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
set(gca,'TickLabelInterpreter','latex')
%set(gca,'YTick',[0 .1 .2]-.025,'YTickLabel',[0 .1 .2]);
%set(gca,'XTick',[-.4 -.3 -.2 -.1 0]-.025,'XTickLabel',[-.4 -.3 -.2 -.1 0]);
set(gca,'XTick',[scs(1) scs(26) scs(76) scs(100)],'XTickLabel',[scs(1) round(scs(26),2) round(scs(76),2) scs(100)])
set(gca,'YTick',[sgs(1) sgs(26) sgs(76) sgs(100)],'YTickLabel',[sgs(1) round(sgs(26),2) round(sgs(76),2) sgs(100)])



h = axes(fig,'visible','off'); 
h.Title.Visible = 'on';
h.XLabel.Visible = 'on';
h.YLabel.Visible = 'on';
ylabel(h,'$s_g$','fontsize',24,'interpreter','latex');
xlabel(h,'$s_c$','fontsize',24,'interpreter','latex');
c = colorbar(h,'Position',[0.93 0.168 0.022 0.7]);  % attach colorbar to h
colormap(c,cmap)
caxis(h,[minColorLimit,maxColorLimit]);             % set colorbar limits
c.TickLabelInterpreter = 'latex';
c.FontSize = 16;



