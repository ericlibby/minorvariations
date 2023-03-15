% stacked area graph
% select cases from evolutionary simulations

clear

% load data from evolutionary simulations
i0_k2=1; % pick siulation number
i0_k4=1; 
i0_k8=99; 
i0_k16=53; 
i1_k2=sims; 
i1_k4=sims; 
i1_k8=sims;
i1_k16=sims;

% pick cases where each of cd (in EB) and bf (in EC) show clonal interference

% calculate proportion of selfish/altrustic over transfers in one
% simulation

colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;



prop=zeros(its,2);
ct=i0_k2*i1_k2-its;
for i=1:its
    ct=ct+1;
    name=['run',num2str(ct)];
    
    sgs=nonzeros(CellmatA.(name)(:,2));
    prop(i,:)=[sum(sgs>0),sum(sgs<0)]./length(sgs); % [altruistic,selfish]
end

x=1:1:length(prop(:,1));

fig=figure;
hold on
s1=patch([x,flip(x)],[zeros(1,length(x)),flip(prop(:,1)')],colors(1,:));
patch([x,flip(x)],[(prop(:,1))',ones(1,length(x))],colors(1,:))
s1.FaceAlpha = .5;

lgd=legend('altruistic','selfish','Interpreter',"latex",'Location','southwest');
lgd.FontSize = 18;
legend boxoff
title('','fontsize',24,'interpreter','latex')
xlabel('transfer','fontsize',24,'interpreter','latex')
ylabel('proportion of mutant type','fontsize',24,'interpreter','latex')
title('$k$=2','fontsize',24,'interpreter','latex')
ax=gca;
ax.XAxis.FontSize = 20;
ax.YAxis.FontSize = 20;
xlim([1 its])
ylim([0 1])
set(gca,'TickLabelInterpreter','latex')

print(fig,['C:\Users\hais0030\Documents\MATLAB\FilamentLifeCycles_det_ks\evosim_nomix_contrasting_randn\plots_waterman\plot_waterman_'+surv+'_k2'],'-depsc','-r300')




prop=zeros(its,2);
ct=i0_k4*i1_k4-its;
for i=1:its
    ct=ct+1;
    name=['run',num2str(ct)];
    
    sgs=nonzeros(CellmatB.(name)(:,2));
    prop(i,:)=[sum(sgs>0),sum(sgs<0)]./length(sgs); % [altruistic,selfish]
    
end

fig=figure;
hold on
s1=patch([x,flip(x)],[zeros(1,length(x)),flip(prop(:,1)')],colors(2,:));
patch([x,flip(x)],[(prop(:,1))',ones(1,length(x))],colors(2,:))
s1.FaceAlpha = .5;

%lgd=legend('altruistic','selfish','Interpreter',"latex",'Location','southwest');
% lgd.FontSize = 18;
% legend boxoff
title('','fontsize',24,'interpreter','latex')
xlabel('transfer','fontsize',24,'interpreter','latex')
ylabel('proportion of mutant type','fontsize',24,'interpreter','latex')
title('$k$=4','fontsize',24,'interpreter','latex')
ax=gca;
ax.XAxis.FontSize = 20;
ax.YAxis.FontSize = 20;
xlim([1 its])
ylim([0 1])
set(gca,'TickLabelInterpreter','latex')

print(fig,['C:\Users\hais0030\Documents\MATLAB\FilamentLifeCycles_det_ks\evosim_nomix_contrasting_randn\plots_waterman\plot_waterman_'+surv+'_k4'],'-depsc','-r300')




prop=zeros(its,2);
ct=i0_k8*i1_k8-its;
for i=1:its
    ct=ct+1;
    name=['run',num2str(ct)];
    
    sgs=nonzeros(CellmatC.(name)(:,2));
    prop(i,:)=[sum(sgs>0),sum(sgs<0)]./length(sgs);
end

fig=figure;
hold on
s1=patch([x,flip(x)],[zeros(1,length(x)),flip(prop(:,1)')],colors(3,:));
patch([x,flip(x)],[(prop(:,1))',ones(1,length(x))],colors(3,:))
s1.FaceAlpha = .5;

lgd=legend('altruistic','selfish','Interpreter',"latex",'Location','southwest');
lgd.FontSize = 18;
legend boxoff
title('','fontsize',24,'interpreter','latex')
xlabel('transfer','fontsize',24,'interpreter','latex')
ylabel('proportion of mutant type','fontsize',24,'interpreter','latex')
title('$k$=8','fontsize',24,'interpreter','latex')
ax=gca;
ax.XAxis.FontSize = 20;
ax.YAxis.FontSize = 20;
xlim([1 its])
ylim([0 1])
set(gca,'TickLabelInterpreter','latex')

print(fig,['C:\Users\hais0030\Documents\MATLAB\FilamentLifeCycles_det_ks\evosim_nomix_contrasting_randn\plots_waterman\plot_waterman_'+surv+'_k8'],'-depsc','-r300')



prop=zeros(its,2);
ct=i0_k16*i1_k16-its;
for i=1:its
    ct=ct+1;
    name=['run',num2str(ct)];
    
    sgs=nonzeros(CellmatD.(name)(:,2));
    prop(i,:)=[sum(sgs>0),sum(sgs<0)]./length(sgs); % [altruistic,selfish]
    
end

fig=figure;
hold on
s1=patch([x,flip(x)],[zeros(1,length(x)),flip(prop(:,1)')],colors(4,:));
patch([x,flip(x)],[(prop(:,1))',ones(1,length(x))],colors(4,:))
s1.FaceAlpha = .5;

lgd=legend('altruistic','selfish','Interpreter',"latex",'Location','southwest');
lgd.FontSize = 18;
legend boxoff
title('','fontsize',24,'interpreter','latex')
xlabel('transfer','fontsize',24,'interpreter','latex')
ylabel('proportion of mutant type','fontsize',24,'interpreter','latex')
title('$k$=16','fontsize',24,'interpreter','latex')
ax=gca;
ax.XAxis.FontSize = 20;
ax.YAxis.FontSize = 20;
xlim([1 its])
ylim([0 1])
set(gca,'TickLabelInterpreter','latex')

print(fig,['C:\Users\hais0030\Documents\MATLAB\FilamentLifeCycles_det_ks\evosim_nomix_contrasting_randn\plots_waterman\plot_waterman_'+surv+'_k16'],'-depsc','-r300')



