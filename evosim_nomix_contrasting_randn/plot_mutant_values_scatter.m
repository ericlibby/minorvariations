% scatter plot

% use data from evolutionary simulations and plot population mean sc and sg at the end
% of each simulatiosn


colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;

for a0=1:4
    fig=figure;
    hold on
    ct=0;

    if a0==1
        Cellmat=CellmatA;
    elseif a0==2
        Cellmat=CellmatB;
    elseif a0==3
        Cellmat=CellmatC;
    else
        Cellmat=CellmatD;
    end
    for i0=1:sims

        for i1=1:its
            ct=ct+1;
            if i1==its
                name=['run',num2str(ct)];
                scatter(mean(1./Cellmat.(name)(:,1)-1),mean(Cellmat.(name)(:,2)),'MarkerFaceColor',colors(a0,:),'MarkerEdgeColor',[0 0 0])
                
                if a0==1
                    traits_k2(i0,:)=[mean(1./Cellmat.(name)(:,1)-1),mean(Cellmat.(name)(:,2))];
                elseif a0==2
                    traits_k4(i0,:)=[mean(1./Cellmat.(name)(:,1)-1),mean(Cellmat.(name)(:,2))];
                elseif a0==3
                    traits_k8(i0,:)=[mean(1./Cellmat.(name)(:,1)-1),mean(Cellmat.(name)(:,2))];
                else
                    traits_k16(i0,:)=[mean(1./Cellmat.(name)(:,1)-1),mean(Cellmat.(name)(:,2))];
                end
                
                if mean(1./Cellmat.(name)(:,1)-1)>0 && mean(Cellmat.(name)(:,2))>0
                    disp('k2')
                    [mean(1./Cellmat.(name)(:,1)-1),mean(Cellmat.(name)(:,2))]
                    i0 % simulation
                    i1 % iteration
                end
            end
        end
    end

    plot([-.1,.2],[0 0],'k','LineWidth',2)
    plot([0 0],[-.1,.2],'k','LineWidth',2)
    set(gca,'xtick',[])
    set(gca,'ytick',[])

    axis off

    % ticks x-axis
    xs=-.1:.05:.2;
    for i=1:length(xs)
        plot([xs(i),xs(i)],[-.005,.005],'k','LineWidth',2)
    end
    % ticks y-axis
    ys=-.1:.05:.2;
    for i=1:length(ys)
        plot([-.005,.005],[ys(i),ys(i)],'k','LineWidth',2)
    end
    %xlim([-.15 .18])
    %ylim([-.05 .18])
    xlabel('$s_c$','fontsize',24,'interpreter','latex')
    ylabel('$s_g$','fontsize',24,'interpreter','latex')
    
    ax=gca;
    ax.XAxis.FontSize = 20;
    ax.YAxis.FontSize = 20;
    set(gca,'TickLabelInterpreter','latex')

    t1 = annotation('textbox', [.87 .16 .9 .2], 'String', "0.2");
    sz = t1.FontSize;
    t1.FontSize = 16;
    t1.Interpreter='latex';
    t1.EdgeColor='none';

    t2 = annotation('textbox', [.4 .72 .9 .2], 'String', "0.2");
    sz = t2.FontSize;
    t2.FontSize = 16;
    t2.Interpreter='latex';
    t2.EdgeColor='none';

    t3 = annotation('textbox', [.44 .69 .9 .2], 'String', "$s_g$");
    sz = t3.FontSize;
    t3.FontSize = 24;
    t3.Interpreter='latex';
    t3.EdgeColor='none';

    t4 = annotation('textbox', [.83 .28 .9 .2], 'String', "$s_c$");
    sz = t4.FontSize;
    t4.FontSize = 24;
    t4.Interpreter='latex';
    t4.EdgeColor='none';

    if a0==1
        title('$k$=2','fontsize',24,'interpreter','latex')
        %print(fig,['C:\Users\hais0030\Documents\MATLAB\MinorVariationsAdaptation\CodeSubmission_reviews_1\evosim_nomix_contrasting_randn\scatterplots_all_combinations\scatterplot_'+surv+'_k2'],'-depsc','-r300')
    elseif a0==2
        title('$k$=4','fontsize',24,'interpreter','latex')
        %print(fig,['C:\Users\hais0030\Documents\MATLAB\MinorVariationsAdaptation\CodeSubmission_reviews_1\evosim_nomix_contrasting_randn\scatterplots_all_combinations\scatterplot_'+surv+'_k4'],'-depsc','-r300')
        %print(fig,['C:\Users\hais0030\Documents\MATLAB\FilamentLifeCycles_det_ks\evosim_nomix_contrasting_randn\plots_scatter\plot_evosim_nomix_scatter_'+surv+'_k4'],'-depsc','-r300')
    elseif a0==3
        title('$k$=8','fontsize',24,'interpreter','latex')
        %print(fig,['C:\Users\hais0030\Documents\MATLAB\MinorVariationsAdaptation\CodeSubmission_reviews_1\evosim_nomix_contrasting_randn\scatterplots_all_combinations\scatterplot_'+surv+'_k8'],'-depsc','-r300')
        %print(fig,['C:\Users\hais0030\Documents\MATLAB\FilamentLifeCycles_det_ks\evosim_nomix_contrasting_randn\plots_scatter\plot_evosim_nomix_scatter_'+surv+'_k8'],'-depsc','-r300')
    else
        title('$k$=16','fontsize',24,'interpreter','latex')
        %print(fig,['C:\Users\hais0030\Documents\MATLAB\MinorVariationsAdaptation\CodeSubmission_reviews_1\evosim_nomix_contrasting_randn\scatterplots_all_combinations\scatterplot_'+surv+'_k16'],'-depsc','-r300')
        %print(fig,['C:\Users\hais0030\Documents\MATLAB\FilamentLifeCycles_det_ks\evosim_nomix_contrasting_randn\plots_scatter\plot_evosim_nomix_scatter_'+surv+'_k16'],'-depsc','-r300')
    end
    
end

%%
colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;


fig=figure;
hold on
ct=0;
for i0=1:sims
    
    for i1=1:its
        ct=ct+1;
        if i1==its
            name=['run',num2str(ct)];
            scatter(mean(1./CellmatB.(name)(:,1)-1),mean(CellmatB.(name)(:,2)),'MarkerFaceColor',colors(2,:),'MarkerEdgeColor',[0 0 0])
            traits_k4(i0,:)=[mean(1./CellmatB.(name)(:,1)-1),mean(CellmatB.(name)(:,2))];
            if mean(1./CellmatB.(name)(:,1)-1)>0 && mean(CellmatB.(name)(:,2))>0
                disp('k4')
                [mean(1./CellmatB.(name)(:,1)-1),mean(CellmatB.(name)(:,2))]
                i0
                i1
            end
        end
    end
end

plot([-.2,.2],[0 0],'k','LineWidth',2)
plot([0 0],[-.15,.15],'k','LineWidth',2)
set(gca,'xtick',[])
set(gca,'ytick',[])

axis off

% ticks x-axis
xs=-.15:.05:.15;
for i=1:length(xs)
    plot([xs(i),xs(i)],[-.005,.005],'k','LineWidth',2)
end
% ticks y-axis
ys=-.05:.05:.15;
for i=1:length(ys)
    plot([-.005,.005],[ys(i),ys(i)],'k','LineWidth',2)
end

xlim([-.15 .18])
ylim([-.05 .18])
xlabel('$s_c$','fontsize',24,'interpreter','latex')
ylabel('$s_g$','fontsize',24,'interpreter','latex')
title('$k$=4','fontsize',24,'interpreter','latex')
ax=gca;
ax.XAxis.FontSize = 20;
ax.YAxis.FontSize = 20;
set(gca,'TickLabelInterpreter','latex')

t1 = annotation('textbox', [.78 .16 .9 .2], 'String', "0.15");
sz = t1.FontSize;
t1.FontSize = 16;
t1.Interpreter='latex';
t1.EdgeColor='none';

t2 = annotation('textbox', [.37 .62 .9 .2], 'String', "0.15");
sz = t2.FontSize;
t2.FontSize = 16;
t2.Interpreter='latex';
t2.EdgeColor='none';

t3 = annotation('textbox', [.46 .7 .9 .2], 'String', "$s_g$");
sz = t3.FontSize;
t3.FontSize = 24;
t3.Interpreter='latex';
t3.EdgeColor='none';

t4 = annotation('textbox', [.85 .14 .9 .2], 'String', "$s_c$");
sz = t4.FontSize;
t4.FontSize = 24;
t4.Interpreter='latex';
t4.EdgeColor='none';

%print(fig,['C:\Users\hais0030\Documents\MATLAB\FilamentLifeCycles_det_ks\evosim_nomix_contrasting_randn\plots_scatter\plot_evosim_nomix_scatter_'+surv+'_k4'],'-depsc','-r300')

fig=figure;
hold on
ct=0;
for i0=1:sims
    
    for i1=1:its
        ct=ct+1;
        if i1==its
            name=['run',num2str(ct)];
            scatter(mean(1./CellmatC.(name)(:,1)-1),mean(CellmatC.(name)(:,2)),'MarkerFaceColor',colors(3,:),'MarkerEdgeColor',[0 0 0])
            traits_k8(i0,:)=[mean(1./CellmatC.(name)(:,1)-1),mean(CellmatC.(name)(:,2))];
            if mean(1./CellmatC.(name)(:,1)-1)>0 && mean(CellmatC.(name)(:,2))>0
                disp('k8')
                [mean(1./CellmatC.(name)(:,1)-1),mean(CellmatC.(name)(:,2))]
                i0
                i1
            end
        end
    end
end

plot([-.2,.2],[0 0],'k','LineWidth',2)
plot([0 0],[-.15,.15],'k','LineWidth',2)
set(gca,'xtick',[])
set(gca,'ytick',[])

axis off

% ticks x-axis
xs=-.15:.05:.15;
for i=1:length(xs)
    plot([xs(i),xs(i)],[-.005,.005],'k','LineWidth',2)
end
% ticks y-axis
ys=-.05:.05:.15;
for i=1:length(ys)
    plot([-.005,.005],[ys(i),ys(i)],'k','LineWidth',2)
end

xlim([-.15 .18])
ylim([-.05 .18])
xlabel('$s_c$','fontsize',24,'interpreter','latex')
ylabel('$s_g$','fontsize',24,'interpreter','latex')
title('$k$=8','fontsize',24,'interpreter','latex')
ax=gca;
ax.XAxis.FontSize = 20;
ax.YAxis.FontSize = 20;
set(gca,'TickLabelInterpreter','latex')

t1 = annotation('textbox', [.78 .16 .9 .2], 'String', "0.15");
sz = t1.FontSize;
t1.FontSize = 16;
t1.Interpreter='latex';
t1.EdgeColor='none';

t2 = annotation('textbox', [.37 .62 .9 .2], 'String', "0.15");
sz = t2.FontSize;
t2.FontSize = 16;
t2.Interpreter='latex';
t2.EdgeColor='none';

t3 = annotation('textbox', [.46 .7 .9 .2], 'String', "$s_g$");
sz = t3.FontSize;
t3.FontSize = 24;
t3.Interpreter='latex';
t3.EdgeColor='none';

t4 = annotation('textbox', [.85 .14 .9 .2], 'String', "$s_c$");
sz = t4.FontSize;
t4.FontSize = 24;
t4.Interpreter='latex';
t4.EdgeColor='none';

%print(fig,['C:\Users\hais0030\Documents\MATLAB\FilamentLifeCycles_det_ks\evosim_nomix_contrasting_randn\plots_scatter\plot_evosim_nomix_scatter_'+surv+'_k8'],'-depsc','-r300')


fig=figure;
hold on
ct=0;
for i0=1:sims
    
    for i1=1:its
        ct=ct+1;
        if i1==its
            name=['run',num2str(ct)];
            scatter(mean(1./CellmatD.(name)(:,1)-1),mean(CellmatD.(name)(:,2)),'MarkerFaceColor',colors(4,:),'MarkerEdgeColor',[0 0 0])
            traits_k16(i0,:)=[mean(1./CellmatD.(name)(:,1)-1),mean(CellmatD.(name)(:,2))];
            if mean(1./CellmatD.(name)(:,1)-1)>0 && mean(CellmatD.(name)(:,2))>0
                disp('k16')
                [mean(1./CellmatD.(name)(:,1)-1),mean(CellmatD.(name)(:,2))]
                i0
                i1
            end
        end
    end
end

plot([-.2,.2],[0 0],'k','LineWidth',2)
plot([0 0],[-.15,.15],'k','LineWidth',2)
set(gca,'xtick',[])
set(gca,'ytick',[])

axis off

% ticks x-axis
xs=-.15:.05:.15;
for i=1:length(xs)
    plot([xs(i),xs(i)],[-.005,.005],'k','LineWidth',2)
end
% ticks y-axis
ys=-.05:.05:.15;
for i=1:length(ys)
    plot([-.005,.005],[ys(i),ys(i)],'k','LineWidth',2)
end

xlim([-.15 .18])
ylim([-.05 .18])
xlabel('$s_c$','fontsize',24,'interpreter','latex')
ylabel('$s_g$','fontsize',24,'interpreter','latex')
title('$k$=16','fontsize',24,'interpreter','latex')
ax=gca;
ax.XAxis.FontSize = 20;
ax.YAxis.FontSize = 20;
set(gca,'TickLabelInterpreter','latex')

t1 = annotation('textbox', [.78 .16 .9 .2], 'String', "0.15");
sz = t1.FontSize;
t1.FontSize = 16;
t1.Interpreter='latex';
t1.EdgeColor='none';

t2 = annotation('textbox', [.37 .62 .9 .2], 'String', "0.15");
sz = t2.FontSize;
t2.FontSize = 16;
t2.Interpreter='latex';
t2.EdgeColor='none';

t3 = annotation('textbox', [.46 .7 .9 .2], 'String', "$s_g$");
sz = t3.FontSize;
t3.FontSize = 24;
t3.Interpreter='latex';
t3.EdgeColor='none';

t4 = annotation('textbox', [.85 .14 .9 .2], 'String', "$s_c$");
sz = t4.FontSize;
t4.FontSize = 24;
t4.Interpreter='latex';
t4.EdgeColor='none';

%print(fig,['C:\Users\hais0030\Documents\MATLAB\FilamentLifeCycles_det_ks\evosim_nomix_contrasting_randn\plots_scatter\plot_evosim_nomix_scatter_'+surv+'_k16'],'-depsc','-r300')


