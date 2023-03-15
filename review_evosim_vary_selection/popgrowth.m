function [cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos,time,tind,cells]=...
    popgrowth(cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos,popmax,adsize,k,psurv,timesteps,tind,mutdata,pmut,dt)

% mutdata=[mu,scmax,sgmax,sgn]

% population grows to carrying capacity

cellct=sum(cellmat(:,1)>0); % number of living cells
% initiate counters
cells=[];
time=[];

tcur=0; % columns in vtimes, including resetting
%tind=0; % columns in vtimes
treset=0; % couting resetting in vtimes

gens=0; % number of generations

% loop over generations
while cellct<popmax && cellct>1  
    gens=gens+1;
    
    % update time
    told=tind;
    tind=[];
    % find next column after told that contains 1s
    while isempty(tind)
       told=told+1;
       if told>timesteps % reset counter in vtimes
           told=1;
           treset=treset+timesteps;
       end
       tind=nonzeros(vtimes(1,told)); % check in non-zero value
       if ~isempty(tind) % found next time step for reproduction
          tind=told;
          tcur=told+treset;
       end
    end
    t=tcur*dt;
    
    % pick reproducing cells
    repinds=find(vcells(:,1)==tind); % index for reproducing cells
    vtimes(1,tind)=0; % reset currnent time step
    
    if (cellct+length(repinds))>popmax
       reporder=randsample(length(repinds),length(repinds)); % permute order of reproducing cells 
       repinds=repinds(reporder);
    end
    
    
    % reproduction, go through list of reproducing cells
    for i=1:length(repinds)
        
        % pick reproducing cell
        repcell=cellmat(repinds(i),:);
        
        % check in reproducing cell is alive
        if repcell(1)>0 
            % create new cell
            newcell=repcell;
            newcell(2)=repcell(2)+1; % update order
            cellct=cellct+1; % increase population size
            % free position in cellmat for new cell
            newpos=pos_avail(1);
            pos_avail(1)=pos_avail(pos);
            pos_avail(pos)=0;
            pos=pos-1;
            
            % add potential mutation
            % mutate mother
            p=rand;
            if p<pmut
                [sc,sg]=mutation_contrast(mutdata);
                repcell(3)=1/(1+sc); % growth time
                %repcell(3)=sc;
                repcell(4)=sg; 
                repcell(6)=repcell(6)+1; % count number of mutations for this cell
                cellmat(repinds(i),:)=repcell;
            end
            % mutate daughter
            p=rand;
            if p<pmut
                [sc,sg]=mutation_contrast(mutdata);
                newcell(3)=1/(1+sc);
                %newcell(3)=sc;
                newcell(4)=sg;
                newcell(6)=newcell(6)+1;
            end

            % next reproduction time (mother+daughter)
            nr=normrnd(0,.1,1); % distribute time
            %tnext_par=ceil(nr+(t-repcell(3))/dt);
            tnext_par=ceil((nr+t+repcell(3))/dt);
            fact=floor(tnext_par/timesteps);
            tnext_par=tnext_par-timesteps*fact;
            if tnext_par==0
               tnext_par=timesteps*fact; 
            end
            vtimes(1,tnext_par)=1;
            vcells(repinds(i),1)=tnext_par;
            
            nr=normrnd(0,.1,1); % distribute time
            %tnext_off=ceil(nr+(t-newcell(3))/dt);
            tnext_off=ceil((nr+t+newcell(3))/dt);
            fact=floor(tnext_off/timesteps);
            tnext_off=tnext_off-timesteps*fact;
            if tnext_off==0
               tnext_off=timesteps*fact; 
            end
            vtimes(1,tnext_off)=1;
            vcells(newpos,1)=tnext_off;
            
            % update order in filament
            filid=repcell(1);
            fil=cellmat(nonzeros(filmat(filid,:)),2);
            fil(fil>=newcell(2))=fil(fil>=newcell(2))+1;
            cellmat(nonzeros(filmat(filid,:)),2)=fil;
            cellmat(newpos,:)=newcell;
            
            % update matrices (add new cell, filsize, position)
            filvec(filid)=filvec(filid)+1; % increased filament size
            filmat(filid,filvec(filid))=newpos; % position in cellmat for new cell
            
            
            %fragmentation, determkinistic
            fstrat=newcell(5);
            
          
            fillen=filvec(filid);
            if fillen==adsize % fragment
                fidx=repcell(2);
                [cellmat,filmat,filvec,vtimes,pos_avail,pos,fil_avail,filpos,death,dinds]=...
fragmentation(filid,psurv,adsize,k,cellmat,filmat,filvec,vtimes,pos_avail,pos,fil_avail,filpos,fstrat,fidx);
                cellct=cellct-death;
                vcells(dinds,:)=0;
                cellmat(dinds,:)=0;

            end

           
                
            
            
        end % end check if reproducing cell is alive
        
        % terminate if popmax is reached
        if cellct==popmax || cellct<1 % reached carrying capacity or extinction
            break
        end
    end % stop loop over reproducing cells
    
    % save data
    cells(gens,1)=cellct; % total number of cells
    time(gens,1)=t;
    
end % loop over generations






end