% evolutionary simulation
% growth and sampling

% deterministic life cycles

% all k strategies

clear,clc
tic

initpop=1e3;
popmax=1e5;
f=100;

adsize=8; % smaller adult size

pfrag=1/8;

ks=[2,4,8];


pmut=.01;

% selection function

env=2;
if env==1 % Ek2
%     a=.59;
%     b=0;
    a=.7;
    b=.2;
    surv="Ek2";
else % Ek8
%     a=89;
%     b=-4;
    a=.7;
    b=-2.2;
    surv="Ek8";
end
psurv=@(x) 1.7./(1+exp(-a*(x-(b))))-.9;

mutdata=[20,.2,.2,.5]; % space for mutations to occur

dt=.1;
timesteps=2000;

sims=50; % simulations
its=50; % iterations

ct=0;

for i=1:sims
    
    dataA=[];
    dataB=[];
    dataC=[];
    filsA=[];
    filsB=[];
    filsC=[];
    cellstrat=[];
    mutstrat=[];
    
    %initiate population
    fragstrat=1;
    [cellmatA,filmatA,filvecA,vtimesA,vcellsA,pos_availA,posA,fil_availA,filposA]=...
        init_population(popmax,adsize,ks(1),dt,timesteps,initpop,fragstrat);

    fragstrat=2;
    [cellmatB,filmatB,filvecB,vtimesB,vcellsB,pos_availB,posB,fil_availB,filposB]=...
        init_population(popmax,adsize,ks(2),dt,timesteps,initpop,fragstrat);

    fragstrat=3;
    [cellmatC,filmatC,filvecC,vtimesC,vcellsC,pos_availC,posC,fil_availC,filposC]=...
        init_population(popmax,adsize,ks(3),dt,timesteps,initpop,fragstrat);

    

    tindA=0;
    tindB=0;
    tindC=0;
    
    j=0;
    while j<its || strat<1
        j=j+1;
        
        
        % grow in patch
        
        [cellmatA,filmatA,filvecA,vtimesA,vcellsA,pos_availA,posA,fil_availA,filposA,timeA,tindA,cellsA]=...
            popgrowth(cellmatA,filmatA,filvecA,vtimesA,vcellsA,pos_availA,posA,fil_availA,filposA,popmax,adsize,ks(1),psurv,timesteps,tindA,mutdata,pmut,dt);

        [cellmatB,filmatB,filvecB,vtimesB,vcellsB,pos_availB,posB,fil_availB,filposB,timeB,tindB,cellsB]=...
            popgrowth(cellmatB,filmatB,filvecB,vtimesB,vcellsB,pos_availB,posB,fil_availB,filposB,popmax,adsize,ks(2),psurv,timesteps,tindB,mutdata,pmut,dt);

        [cellmatC,filmatC,filvecC,vtimesC,vcellsC,pos_availC,posC,fil_availC,filposC,timeC,tindC,cellsC]=...
            popgrowth(cellmatC,filmatC,filvecC,vtimesC,vcellsC,pos_availC,posC,fil_availC,filposC,popmax,adsize,ks(3),psurv,timesteps,tindC,mutdata,pmut,dt);

        
        % sampling
        [cellmatA,filmatA,filvecA,vtimesA,vcellsA,pos_availA,posA,fil_availA,filposA]=...
            sampling(cellmatA,filmatA,filvecA,vtimesA,vcellsA,f,popmax,timesteps);

        [cellmatB,filmatB,filvecB,vtimesB,vcellsB,pos_availB,posB,fil_availB,filposB]=...
            sampling(cellmatB,filmatB,filvecB,vtimesB,vcellsB,f,popmax,timesteps);

        [cellmatC,filmatC,filvecC,vtimesC,vcellsC,pos_availC,posC,fil_availC,filposC]=...
            sampling(cellmatC,filmatC,filvecC,vtimesC,vcellsC,f,popmax,timesteps);

        % calculate means for strategies
        % sc, sg, #muts
        dataA(j,:)=[mean(cellmatA(cellmatA(:,5)==1,3)),mean(cellmatA(cellmatA(:,5)==1,4)),mean(cellmatA(cellmatA(:,5)==1,6))]; % sc,sg,#mutations
        dataB(j,:)=[mean(cellmatB(cellmatB(:,5)==2,3)),mean(cellmatB(cellmatB(:,5)==2,4)),mean(cellmatB(cellmatB(:,5)==2,6))]; % sc,sg,#mutations
        dataC(j,:)=[mean(cellmatC(cellmatC(:,5)==3,3)),mean(cellmatC(cellmatC(:,5)==3,4)),mean(cellmatC(cellmatC(:,5)==3,6))]; % sc,sg,#mutations
        
        % number of filaments sampled from each strategy
        filsA(j,1)=length(nonzeros(filvecA));
        filsB(j,1)=length(nonzeros(filvecB));
        filsC(j,1)=length(nonzeros(filvecC));
        
        
        % save data from iteration
        cell_1=sum(cellmatA(:,5)==1);
        cell_2=sum(cellmatB(:,5)==2);
        cell_3=sum(cellmatC(:,5)==3);
        cellstrat(j,:)=[cell_1,cell_2,cell_3]; % number of cells in each strategy 
        strat=sum(cellstrat(j,:)>0); % existing strategies
        
        mutsA=cellmatA(cellmatA(:,5)==1,3:4); % pick mutations from strategy 1
        mutsumA=sum(mutsA(:,1)~=1 | mutsA(:,2)~=0); % total number of mutations
        mutsB=cellmatB(cellmatB(:,5)==2,3:4);
        mutsumB=sum(mutsB(:,1)~=1 | mutsB(:,2)~=0);
        mutsC=cellmatC(cellmatC(:,5)==3,3:4);
        mutsumC=sum(mutsC(:,1)~=1 | mutsC(:,2)~=0);
        mutstrat(j,:)=[mutsumA,mutsumB,mutsumC];
        
        
        % save data on mutations
        ct=ct+1;
        name=['run',num2str(ct)];
        CellmatA.(name)=cellmatA(cellmatA(:,3)~=0,3:4);
        CellmatB.(name)=cellmatB(cellmatB(:,3)~=0,3:4);
        CellmatC.(name)=cellmatC(cellmatC(:,3)~=0,3:4);
        
        % save workspace
        save(['data_evosim_samp_'+surv+'_adsize8'])
        
    end

    % save data from simulation
    name=['run',num2str(i)];
    
    DataA.(name)=dataA;
    DataB.(name)=dataB;
    DataC.(name)=dataC;
    
    FilsA.(name)=filsA;
    FilsB.(name)=filsB;
    FilsC.(name)=filsC;

    Strat.(name)=cellstrat;
    Muts.(name)=mutstrat;
    
    % save workspace
    save(['data_evosim_samp_'+surv+'_adsize8'])
    i
end

% save workspace
save(['data_evosim_samp_'+surv+'_adsize8'])

toc
beep