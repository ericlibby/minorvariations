function [cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos]=...
    sampling(cellmat_old,filmat_old,filvec_old,vtimes_old,vcells_old,f,popmax,timesteps)


% initiate new matrices
cellmat=zeros(popmax,6); % fil id, order, sc, sg, fragstrat, number of mutations
filmat=zeros(popmax,100); % positions in cellmat
filvec=zeros(popmax,1); % filament sizes
vtimes=sparse(1,timesteps,0,1,timesteps); % time steps, 1 if reproducing cells 
vcells=zeros(popmax,1);
pos_avail=(1:1:popmax)'; % available positions in cellmat, all avaliable at start
pos=popmax; % tracks last available position
fil_avail=(1:1:popmax)'; % available filament numbers
filpos=popmax; % tracks last available position


% sample filaments
filsamps=unique(nonzeros(cellmat_old(:,1))); % filament numbers (containing cells)
filinds=randsample(length(filsamps),ceil(length(filsamps)/f)); % samples filament positions in filsamps
filsamps=filsamps(filinds); % filament numbers to use

for i=1:length(filsamps)
    
    oldfilnr=filsamps(i);
    filsize=filvec_old(oldfilnr,1);
    oldpos=nonzeros(filmat_old(oldfilnr,:));
    
    curfilnr=fil_avail(1,1); % renumber filament
    fil_avail(1,1)=fil_avail(filpos,1);
    fil_avail(filpos,1)=0;
    filpos=filpos-1;
    
    % pick positions to use in cellmat and filmat
    newpos=pos_avail(1:filsize);
    pos_avail(1:filsize)=pos_avail((pos-filsize+1):pos);
    pos_avail((pos-filsize+1):pos)=0;
    pos=pos-filsize;

    filvec(curfilnr)=filsize;
    filmat(curfilnr,1:filsize)=newpos;
    cellmat(newpos,:)=cellmat_old(oldpos,:);
    cellmat(newpos,1)=curfilnr; % update new filament number

    vcells(newpos,1)=vcells_old(oldpos,1);
    vtimes(1,unique(vcells(newpos,1)))=1;
    
    
    
    
end




end