% extinction rate for pure mutant populations

% initiate a filament awith a mutation and compute if mutaton goes extinct

clear,clc


popmax=1e3;
adsize=16;
ks=[2,4,8,16];

dt=.01;
timesteps=2000;

pfrag=1/8;
pmut=.01;

sims=100;

mut="sc";
scs=-.2:.05:.2;
sgs=0;

% mut="sg";
% sgs=-.2:.05:.2;
% scs=0;

as=.3:.01:1;
bs=-4.5:.01:1;


for ind=1:4 % loop over environments 
    tic
    
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
    psurv=@(x) (1.7 ./ (1+exp(-a*(x-b))))-0.9;

    

    ct=0;
    id=0;
    fragstrat=1;
    for isc=1:length(scs)
        for isg=1:length(sgs)

            % binary fission
            fix=0;
            for i=1:sims

                sc=scs(isc);
                sg=sgs(isg);

                % initiate population (it will be one for each patch)
                %initpop=adsize/ks(1);
                initpop=8;
                [cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos]=...
                    init_population(popmax,adsize,ks(1),dt,timesteps,initpop,fragstrat,sc,sg);

                [cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos,time,cells]=...
                    popgrowth(cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos,popmax,adsize,ks(1),psurv,timesteps,dt,pfrag);

                % calculate extinction
                if sum(cellmat(:,6)==1)>0
                    fix=fix+1;
                end
            end

            ct=ct+1;
            name=['run',num2str(ct)];
            % number of fixations
            Mut_fix_k2(isg,isc)=fix; 

            save(['data_adap_'+mut+'_'+surv])
            
            % k=4
            fix=0;
            for i=1:sims

                sc=scs(isc);
                sg=sgs(isg);

                % initiate population (it will be one for each patch)
                %initpop=adsize/ks(2);
                initpop=8;
                [cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos]=...
                    init_population(popmax,adsize,ks(2),dt,timesteps,initpop,fragstrat,sc,sg);

                [cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos,time,cells]=...
                    popgrowth(cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos,popmax,adsize,ks(1),psurv,timesteps,dt,pfrag);

                % calculate extinction
                if sum(cellmat(:,6)==1)>0
                    fix=fix+1;
                end
            end

            ct=ct+1;
            name=['run',num2str(ct)];
            % number of fixations
            Mut_fix_k4(isg,isc)=fix; 

            save(['data_adap_'+mut+'_'+surv])
            
            
            % k=8
            fix=0;
            for i=1:sims

                sc=scs(isc);
                sg=sgs(isg);

                % initiate population (it will be one for each patch)
                %initpop=adsize/ks(3);
                initpop=8;
                [cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos]=...
                    init_population(popmax,adsize,ks(3),dt,timesteps,initpop,fragstrat,sc,sg);

                [cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos,time,cells]=...
                    popgrowth(cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos,popmax,adsize,ks(1),psurv,timesteps,dt,pfrag);

                % calculate extinction
                if sum(cellmat(:,6)==1)>0
                    fix=fix+1;
                end
            end

            ct=ct+1;
            name=['run',num2str(ct)];
            % number of fixations
            Mut_fix_k8(isg,isc)=fix; 

            save(['data_adap_'+mut+'_'+surv])
            
            
            % complete dissociation
            fix=0;
            for i=1:sims

                sc=scs(isc);
                sg=sgs(isg);

                % initiate population (it will be one for each patch)
                %initpop=adsize/ks(4);
                initpop=8;
                [cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos]=...
                    init_population(popmax,adsize,ks(4),dt,timesteps,initpop,fragstrat,sc,sg);

                [cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos,time,cells]=...
                    popgrowth(cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos,popmax,adsize,ks(1),psurv,timesteps,dt,pfrag);

                % calculate extinction
                if sum(cellmat(:,6)==1)>0
                    fix=fix+1;
                end
            end

            ct=ct+1;
            name=['run',num2str(ct)];
            % number of fixations
            Mut_fix_k16(isg,isc)=fix; 

            save(['data_adap_'+mut+'_'+surv])
            
        end
    end
end

beep






