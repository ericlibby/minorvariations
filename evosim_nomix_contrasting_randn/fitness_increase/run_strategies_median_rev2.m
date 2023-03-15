% test functions

clear,clc

initpop=1e3;
popmax=1e5;
adsize=16;
ks=[2,4,8,16];

dt=.01;
timesteps=2000;

pfrag=1/8;
pmut=.01;


% import population mean traits from scatter plot
trait=2; % population means or neutral mutant
% s=1; % environment
% if s==1
%     load('data_evosim_samp_E_2_traits.mat')
% elseif s==2
%     load('data_evosim_samp_E_4_traits.mat')
% elseif s==3
%     load('data_evosim_samp_E_8_traits.mat')
% else
%     load('data_evosim_samp_E_16_traits.mat')
% end


% or neutral populations
% trait=2;
b=0; % binary fission
a=0.4000;
surv="E_2";

% b=-1.5100
% a=0.5400
% surv="E_4";

% b=-2.2100
% a=0.7900    
% surv="E_8";

% b=-4; % complete dissociation
% a=0.8900;
% surv="E_16";


mut="avg_vals"; 
if trait==2
    psurv=@(x) (1.9-.2)./(1+exp(-a*(x-(b))))-(.9);

    scs=0;
    sgs=0;
    mut="neutr";
end

sims=10;


% k=2
if trait==1
    scs=traits_k2(:,1);
    sgs=traits_k2(:,2);
end

ct=0;
it=0;
fragstrat=1;
for isc=1:length(scs)
    tic
     isg=isc;   
     sc=scs(isc);
     sg=sgs(isg);
        fix=0;
        muts=[];
        for i=1:sims
    
            

            % initiate population (it will be one for each patch)
            [cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos]=...
                init_population(popmax,adsize,ks(1),dt,timesteps,initpop,fragstrat,sc,sg);

            [cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos,time,cells]=...
                popgrowth(cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos,popmax,adsize,ks(1),psurv,timesteps,dt,pfrag);
            
            % mutant proportion
            muts(i,:)=cells(end,2)/cells(end,1);
            
            % cell growth
            ct=ct+1;
            name=['run',num2str(ct)];
            cells_k2.(name)=cells;
            time_k2.(name)=time;
            
            save(['data_adap_'+mut+'_'+surv])
        end
        
        % number of fixations
        Mut_fix_k2(isg,isc)=sum(muts~=0);
        
        % mean mutant proportion, conditional
        Mut_mean_k2_cond(isg,isc)=mean(muts(muts~=0));
        % median mutant propotion, conditional
        Mut_med_k2_cond(isg,isc)=median(muts(muts~=0));
        
        % mean mutant proportion, unconditional
        Mut_mean_k2(isg,isc)=mean(muts);
        % median mutant propotion, unconditional
        Mut_med_k2(isg,isc)=median(muts);
        
        save(['data_adap_'+mut+'_'+surv])
    
    isc
    toc
end

save(['data_adap_'+mut+'_'+surv])
disp('k2')


% k=4
if trait==1
    scs=traits_k4(:,1);
    sgs=traits_k4(:,2);
end
ct=0;
it=0;
fragstrat=1;
for isc=1:length(scs)
    tic
     isg=isc;   
     sc=scs(isc);
     sg=sgs(isg);
        fix=0;
        muts=[];
        for i=1:sims
    
            

            % initiate population (it will be one for each patch)
            [cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos]=...
                init_population(popmax,adsize,ks(2),dt,timesteps,initpop,fragstrat,sc,sg);

            [cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos,time,cells]=...
                popgrowth(cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos,popmax,adsize,ks(2),psurv,timesteps,dt,pfrag);
            
            % mutant proportion
            muts(i,:)=cells(end,2)/cells(end,1);
            
            % cell growth
            ct=ct+1;
            name=['run',num2str(ct)];
            cells_k4.(name)=cells;
            time_k4.(name)=time;
            save(['data_adap_'+mut+'_'+surv])
        end
        
        % number of fixations
        Mut_fix_k4(isg,isc)=sum(muts~=0);
        
        % mean mutant proportion, conditional
        Mut_mean_k4_cond(isg,isc)=mean(muts(muts~=0));
        % median mutant propotion, conditional
        Mut_med_k4_cond(isg,isc)=median(muts(muts~=0));
        
        % mean mutant proportion, unconditional
        Mut_mean_k4(isg,isc)=mean(muts);
        % median mutant propotion, unconditional
        Mut_med_k4(isg,isc)=median(muts);
        
        save(['data_adap_'+mut+'_'+surv])
    
    isc
    toc
end

save(['data_adap_'+mut+'_'+surv])
disp('k4')


% k=8
if trait==1
    scs=traits_k8(:,1);
    sgs=traits_k8(:,2);
end
ct=0;
it=0;
fragstrat=1;
for isc=1:length(scs)
    tic
     isg=isc;   
     sc=scs(isc);
     sg=sgs(isg);
        fix=0;
        muts=[];
        for i=1:sims
    
            

            % initiate population (it will be one for each patch)
            [cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos]=...
                init_population(popmax,adsize,ks(3),dt,timesteps,initpop,fragstrat,sc,sg);

            [cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos,time,cells]=...
                popgrowth(cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos,popmax,adsize,ks(3),psurv,timesteps,dt,pfrag);
            
            % mutant proportion
            muts(i,:)=cells(end,2)/cells(end,1);
            
            % cell growth
            ct=ct+1;
            name=['run',num2str(ct)];
            cells_k8.(name)=cells;
            time_k8.(name)=time;
            
            save(['data_adap_'+mut+'_'+surv])
        end
        
        % number of fixations
        Mut_fix_k8(isg,isc)=sum(muts~=0);
        
        % mean mutant proportion, conditional
        Mut_mean_k8_cond(isg,isc)=mean(muts(muts~=0));
        % median mutant propotion, conditional
        Mut_med_k8_cond(isg,isc)=median(muts(muts~=0));
        
        % mean mutant proportion, unconditional
        Mut_mean_k8(isg,isc)=mean(muts);
        % median mutant propotion, unconditional
        Mut_med_k8(isg,isc)=median(muts);
        
        save(['data_adap_'+mut+'_'+surv])
    
    isc
    toc
end

save(['data_adap_'+mut+'_'+surv])
disp('k8')


% k=16
if trait==1
    scs=traits_k16(:,1);
    sgs=traits_k16(:,2);
end
ct=0;
it=0;
fragstrat=1;
for isc=1:length(scs)
    tic
     isg=isc;   
     sc=scs(isc);
     sg=sgs(isg);
        fix=0;
        muts=[];
        for i=1:sims
    
            

            % initiate population (it will be one for each patch)
            [cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos]=...
                init_population(popmax,adsize,ks(4),dt,timesteps,initpop,fragstrat,sc,sg);

            [cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos,time,cells]=...
                popgrowth(cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos,popmax,adsize,ks(4),psurv,timesteps,dt,pfrag);
            
            % mutant proportion
            muts(i,:)=cells(end,2)/cells(end,1);
            
            % cell growth
            ct=ct+1;
            name=['run',num2str(ct)];
            cells_k16.(name)=cells;
            time_k16.(name)=time;
            
            save(['data_adap_'+mut+'_'+surv])
        end
        
        % number of fixations
        Mut_fix_k16(isg,isc)=sum(muts~=0);
        
        % mean mutant proportion, conditional
        Mut_mean_k16_cond(isg,isc)=mean(muts(muts~=0));
        % median mutant propotion, conditional
        Mut_med_k16_cond(isg,isc)=median(muts(muts~=0));
        
        % mean mutant proportion, unconditional
        Mut_mean_k16(isg,isc)=mean(muts);
        % median mutant propotion, unconditional
        Mut_med_k16(isg,isc)=median(muts);
        
        save(['data_adap_'+mut+'_'+surv])
    
    isc
    toc
end

save(['data_adap_'+mut+'_'+surv])
disp('k16')



beep






