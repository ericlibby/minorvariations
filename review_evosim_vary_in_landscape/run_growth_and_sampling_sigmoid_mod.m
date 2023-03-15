% evolutionary simulation
% growth and sampling

% deterministic life cycles

clear,clc
tic

initpop=1e3;
popmax=1e5;
f=100;

adsize=16;

pfrag=1/8;


env=4;
if env==1 % Ek2a
    a=.34;
    b=-.21;
    surv="Ek2a";
elseif env==2 % Ek2b
    a=.49;
    b=.14;
    surv="Ek2b";
elseif env==3 % Ek16a
    a=.69;
    b=-3.51;
    surv="Ek16a";
else % Ek16b
    a=.39;
    b=-4.31;
    surv="Ek16b";
end
psurv=@(x) 1.7./(1+exp(-a*(x-(b))))-.9;
ks=[2,4,8,16];

pmut=.01;
mutdata=[20,1-psurv(100),1-psurv(100),.5]; % OBS modified mutant trait values

dt=.1;
timesteps=2000;

sims=50; % simulations
its=50; % iterations

ct=0;

for i=1:sims
    
    dataA=[];
    dataB=[];
    dataC=[];
    dataD=[];
    filsA=[];
    filsB=[];
    filsC=[];
    filsD=[];
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

    fragstrat=4;
    [cellmatD,filmatD,filvecD,vtimesD,vcellsD,pos_availD,posD,fil_availD,filposD]=...
        init_population(popmax,adsize,ks(4),dt,timesteps,initpop,fragstrat);


    tindA=0;
    tindB=0;
    tindC=0;
    tindD=0;
    
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

        [cellmatD,filmatD,filvecD,vtimesD,vcellsD,pos_availD,posD,fil_availD,filposD,timeD,tindD,cellsD]=...
            popgrowth(cellmatD,filmatD,filvecD,vtimesD,vcellsD,pos_availD,posD,fil_availD,filposD,popmax,adsize,ks(4),psurv,timesteps,tindD,mutdata,pmut,dt);
        
        
        % sampling
        [cellmatA,filmatA,filvecA,vtimesA,vcellsA,pos_availA,posA,fil_availA,filposA]=...
            sampling(cellmatA,filmatA,filvecA,vtimesA,vcellsA,f,popmax,timesteps);

        [cellmatB,filmatB,filvecB,vtimesB,vcellsB,pos_availB,posB,fil_availB,filposB]=...
            sampling(cellmatB,filmatB,filvecB,vtimesB,vcellsB,f,popmax,timesteps);

        [cellmatC,filmatC,filvecC,vtimesC,vcellsC,pos_availC,posC,fil_availC,filposC]=...
            sampling(cellmatC,filmatC,filvecC,vtimesC,vcellsC,f,popmax,timesteps);

        [cellmatD,filmatD,filvecD,vtimesD,vcellsD,pos_availD,posD,fil_availD,filposD]=...
            sampling(cellmatD,filmatD,filvecD,vtimesD,vcellsD,f,popmax,timesteps);

        % calculate means for strategies
        % sc, sg, #muts
        dataA(j,:)=[mean(cellmatA(cellmatA(:,5)==1,3)),mean(cellmatA(cellmatA(:,5)==1,4)),mean(cellmatA(cellmatA(:,5)==1,6))]; % sc,sg,#mutations
        dataB(j,:)=[mean(cellmatB(cellmatB(:,5)==2,3)),mean(cellmatB(cellmatB(:,5)==2,4)),mean(cellmatB(cellmatB(:,5)==2,6))]; % sc,sg,#mutations
        dataC(j,:)=[mean(cellmatC(cellmatC(:,5)==3,3)),mean(cellmatC(cellmatC(:,5)==3,4)),mean(cellmatC(cellmatC(:,5)==3,6))]; % sc,sg,#mutations
        dataD(j,:)=[mean(cellmatD(cellmatD(:,5)==4,3)),mean(cellmatD(cellmatD(:,5)==4,4)),mean(cellmatD(cellmatD(:,5)==4,6))]; % sc,sg,#mutations
        
        % number of filaments sampled from each strategy
        filsA(j,1)=length(nonzeros(filvecA));
        filsB(j,1)=length(nonzeros(filvecB));
        filsC(j,1)=length(nonzeros(filvecC));
        filsD(j,1)=length(nonzeros(filvecD));
        
        
        % save data from iteration
        cell_1=sum(cellmatA(:,5)==1);
        cell_2=sum(cellmatB(:,5)==2);
        cell_3=sum(cellmatC(:,5)==3);
        cell_4=sum(cellmatD(:,5)==4);
        cellstrat(j,:)=[cell_1,cell_2,cell_3,cell_4]; % number of cells in each strategy 
        strat=sum(cellstrat(j,:)>0); % existing strategies
        
        mutsA=cellmatA(cellmatA(:,5)==1,3:4); % pick mutations from strategy 1
        mutsumA=sum(mutsA(:,1)~=1 | mutsA(:,2)~=0); % total number of mutations
        mutsB=cellmatB(cellmatB(:,5)==2,3:4);
        mutsumB=sum(mutsB(:,1)~=1 | mutsB(:,2)~=0);
        mutsC=cellmatC(cellmatC(:,5)==3,3:4);
        mutsumC=sum(mutsC(:,1)~=1 | mutsC(:,2)~=0);
        mutsD=cellmatD(cellmatD(:,5)==4,3:4);
        mutsumD=sum(mutsD(:,1)~=1 | mutsD(:,2)~=0);
        mutstrat(j,:)=[mutsumA,mutsumB,mutsumC,mutsumD];
        
        
        % save data on mutations
        ct=ct+1;
        name=['run',num2str(ct)];
        CellmatA.(name)=cellmatA(cellmatA(:,3)~=0,3:4);
        CellmatB.(name)=cellmatB(cellmatB(:,3)~=0,3:4);
        CellmatC.(name)=cellmatC(cellmatC(:,3)~=0,3:4);
        CellmatD.(name)=cellmatD(cellmatD(:,3)~=0,3:4);
        
        % save workspace
        save(['data_evosim_sigmoid_'+surv])
        
    end

    % save data from simulation
    name=['run',num2str(i)];
    
    DataA.(name)=dataA;
    DataB.(name)=dataB;
    DataC.(name)=dataC;
    DataD.(name)=dataD;
    
    FilsA.(name)=filsA;
    FilsB.(name)=filsB;
    FilsC.(name)=filsC;
    FilsD.(name)=filsD;

    Strat.(name)=cellstrat;
    Muts.(name)=mutstrat;
    
    % save workspace
    save(['data_evosim_sigmoid_'+surv])
    i
end

% save workspace
save(['data_evosim_sigmoid_'+surv])

toc
beep