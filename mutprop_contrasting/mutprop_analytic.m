% calculate mutant proportion
% growth rates derived from analytics

% exponential growth
% Poisson process for reproduction times

clear
ks=[2,4,8,16];
N=16;

as=.3:.01:1;
bs=-4.5:.01:1;


% altruistic
mut="altruistic";
scs=linspace(-.2,0);
sgs=linspace(0,.2);
% % selfish
% mut="selfish";
% sgs=linspace(-.2,0);
% scs=linspace(0,.2);

% set evironment
ind=4;
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

t=20; % time for growth
for i0=1:length(ks)
    for isc=1:length(scs)
        for isg=1:length(sgs)
    
            lambda=0;
            lambda_m=0;

            tau=sum(1./((N/ks(i0):1:N)));
            lambda=log(ks(i0)*ps(N/ks(i0)))./tau;
            lambda_m=log(ks(i0)*ps(N/ks(i0)).*(1+sgs(isg))).*(1+scs(isc))./tau;

            % mutant proportion
            name=['k_',num2str(ks(i0))];
            M.(name)(isg,isc)=(1e-3*exp(lambda_m*t))./(1e-3*exp(lambda_m*t)+(1-1e-3)*exp(lambda*t));

    
        end
    end
    
end

save(["data_"+surv+"_"+mut])
beep

