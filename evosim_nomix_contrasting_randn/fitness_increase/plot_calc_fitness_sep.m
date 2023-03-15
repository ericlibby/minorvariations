% calculate fitness (time to reach carrying capacity)
clear
% mutant traits from population average (scatter plot)
s=1;
if s==1
    load('data_adap_avg_vals_E_2.mat')
    ymin=.03;ymax=.1;
elseif s==2
    load('data_adap_avg_vals_E_4.mat')
elseif s==3
    load('data_adap_avg_vals_E_8.mat')
else
    load('data_adap_avg_vals_E_16.mat')
    ymin=.06;ymax=.14;
end

% for each trait value
ct_k2=0;
ct_k4=0;
ct_k8=0;
ct_k16=0;
for i0=1:length(traits_k2(:,1))
    
    % go though simulations
    t_k2=[];
    for i=1:sims
        ct_k2=ct_k2+1;
        name=['run',num2str(ct_k2)];
        t_k2(i)=time_k2.(name)(end,1);
    end
    T_k2(i0)=mean(t_k2);

    
%     t_k4=[];
%     for i=1:sims
%         ct_k4=ct_k4+1;
%         name=['run',num2str(ct_k4)];
%         t_k4(i)=time_k4.(name)(end,1);
%     end
%     T_k4(i0)=mean(t_k4);
% 
%     
%     t_k8=[];
%     for i=1:sims
%         ct_k8=ct_k8+1;
%         name=['run',num2str(ct_k8)];
%         t_k8(i)=time_k8.(name)(end,1);
%     end
%     T_k8(i0)=mean(t_k8);

    
    t_k16=[];
    for i=1:sims
        ct_k16=ct_k16+1;
        name=['run',num2str(ct_k16)];
        t_k16(i)=time_k16.(name)(end,1);
    end
    T_k16(i0)=mean(t_k16);


end

% neutral mutation (wild type)
if s==1
    load('data_adap_neutr_E_2.mat')
elseif s==2
    load('data_adap_neutr_E_4.mat')
elseif s==3
    load('data_adap_neutr_E_8.mat')
else
    load('data_adap_neutr_E_16.mat')
end


for i=1:sims
    name=['run',num2str(i)];
    t_k2(i)=time_k2.(name)(end,1);
end
Tn_k2=mean(t_k2);

% 
% for i=1:sims
%     name=['run',num2str(i)];
%     t_k4(i)=time_k4.(name)(end,1);
% end
% Tn_k4=mean(t_k4);
% 
% 
% for i=1:sims
%     name=['run',num2str(i)];
%     t_k8(i)=time_k8.(name)(end,1);
% end
% Tn_k8=mean(t_k8);


for i=1:sims
    name=['run',num2str(i)];
    t_k16(i)=time_k16.(name)(end,1);
end
Tn_k16=mean(t_k16);


colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;

fig=figure;
hold on

scatter(zeros(1,length(T_k2)),1./T_k2,'MarkerFaceColor',colors(1,:),'MarkerEdgeColor',[0 0 0])   
scatter(ones(1,length(T_k16)),1./T_k16,'MarkerFaceColor',colors(4,:),'MarkerEdgeColor',[0 0 0])

scatter(0,1/Tn_k2,100,'p','MarkerFaceColor',colors(1,:),'MarkerEdgeColor',[0 0 0])
scatter(1,1/Tn_k16,100,'p','MarkerFaceColor',colors(4,:),'MarkerEdgeColor',[0 0 0])

lgd=legend('$k$=2','$k$=16','Interpreter',"latex",'Location','southeast');
lgd.FontSize = 18;
legend boxoff

ylabel('fitness','fontsize',24,'interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
ax = gca;
ax.FontSize = 16; 

set(gca,'xtick',[0:1:3])
xlim([-1 2])
ylim([ymin ymax])
set(gca,'xticklabels',[])
set(gca,'TickLength',[.03 .01])

print(fig,['C:\Users\hais0030\Documents\MATLAB\MinorVariationsAdaptation\CodeSubmission_reviews_1\evosim_nomix_contrasting_randn\fitness_increase\plot_evosim_fitness_'+surv],'-depsc','-r300')

%% 
fig=figure;
hold on

scatter(zeros(1,length(T_k4)),1./T_k4,'MarkerFaceColor',colors(2,:),'MarkerEdgeColor',[0 0 0])
scatter(ones(1,length(T_k8)),1./T_k8,'MarkerFaceColor',colors(3,:),'MarkerEdgeColor',[0 0 0])

scatter(0,1/Tn_k4,100,'p','MarkerFaceColor',colors(2,:),'MarkerEdgeColor',[0 0 0])
scatter(1,1/Tn_k8,100,'p','MarkerFaceColor',colors(3,:),'MarkerEdgeColor',[0 0 0])

lgd=legend('$k$=4','$k$=8','Interpreter',"latex",'Location','southeast');
lgd.FontSize = 18;
legend boxoff

ylabel('$\lambda$ (1/time to c.c.)','fontsize',24,'interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
ax = gca;
ax.FontSize = 16; 

set(gca,'xtick',[0:1:3])
xlim([-1 2])
ylim([ymin ymax])
set(gca,'xticklabels',[])
set(gca,'TickLength',[.03 .01])

%print(fig,['C:\Users\hais0030\Documents\MATLAB\FilamentLifeCycles_det_ks\evosim_nomix_contrasting\fitness_increase\plots_sep\plot_evosim_fitness_sup_'+surv],'-depsc','-r300')


% relative fitness advantages
% Tn_k2/mean(T_k2)
% Tn_k4/mean(T_k4)
% Tn_k8/mean(T_k8)
% Tn_k16/mean(T_k16)




