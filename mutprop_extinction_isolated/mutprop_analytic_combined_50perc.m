% calculate mutant proportion
% growth rates derived from analytics

% exponential growth
% Poisson process for reproduction times

clear
ks=[2,4,8,16];
N=16;

% set evironment
as=.3:.01:1;
bs=-4.5:.01:1;

ind=1;
if ind==1
    ia=(11); 
    ib=(451);
    surv="E_k2";
elseif ind==2
    ia=(25); 
    ib=(300);
    surv="E_k4";
elseif ind==3
    ia=(50); 
    ib=(230);
    surv="E_k8";
else
    ia=(60); 
    ib=(51);
    surv="E_k16";
end

a=as(ia);
b=bs(ib);
ps=@(x) (1.7 ./ (1+exp(-a*(x-b))))-0.9; % survival function

colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;


%t=20; % time for growth
p=1/1000;

% sgs
scs=0;
sgs=linspace(-.2,.2);

for i0=1:length(ks)
    
    lambda=log(ks(i0)*ps(N/ks(i0)))/log(ks(i0));
    lambda_m=(1+scs).*log((1+sgs)*ps(N/ks(i0))*ks(i0))./log(ks(i0));
    % time for mutant to reach 50% 
    tfix=log((1-p)/p)./(lambda_m-lambda);
    
    T(i0,:)=max(0,tfix);
    
end


fig=figure;
hold on
plot(sgs,T(1,:),'color',colors(1,:),'LineWidth',2,'LineStyle','- -')
plot(sgs,T(4,:),'color',colors(4,:),'LineWidth',2,'LineStyle','- -')



% scs
sgs=0;
scs=linspace(-.2,.2);

for i0=1:length(ks)

    lambda=log(ks(i0)*ps(N/ks(i0)))/log(ks(i0));
    lambda_m=(1+scs).*log((1+sgs)*ps(N/ks(i0))*ks(i0))./log(ks(i0));
    % time for mutant to reach 50% 
    tfix=log((1-p)/p)./(lambda_m-lambda);

    T(i0,:)=max(0,tfix);
end


plot(scs,T(1,:),'color',colors(1,:),'LineWidth',2,'LineStyle','-')
plot(scs,T(4,:),'color',colors(4,:),'LineWidth',2,'LineStyle','-')


% neutral mutant
% to inf...?
%plot(scs,1e-3*ones(1,length(scs)),'color',[.5 .5 .5 .4],'LineWidth',2)


xlabel('$s_c$ / $s_g$','fontsize',24,'interpreter','latex')
ylabel('time','fontsize',24,'interpreter','latex')
ax=gca;
ax.XAxis.FontSize = 24;
ax.YAxis.FontSize = 24;
set(gca,'TickLabelInterpreter','latex')
ylim([0 1e4])
set(gca, 'YScale', 'log')


if ind==1
    %title('$E_B$','fontsize',24,'interpreter','latex')
    print(fig,'plot_analyt_mutprop_EB_comb_50perc','-depsc','-r300')
end
if ind==4
    %title('$E_C$','fontsize',24,'interpreter','latex')
    print(fig,'plot_analyt_mutprop_EC_comb_50perc','-depsc','-r300')
end 







