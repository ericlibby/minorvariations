function [cellmat,filmat,filvec,vtimes,vcells,pos_avail,pos,fil_avail,filpos]=...
    init_population(popmax,adsize,k,dt,timesteps,initpop,fragstrat,sc,sg)
% initial population based on a constant cell number
% distribute initpop evenly across filaments of maxsize adsie/k

% pure mutant populations

% define matrices
cellmat=zeros(popmax,6); % fil id, order, sc, sg, fragstrat, number of mutations
filmat=zeros(popmax,100); % positions in cellmat
filvec=zeros(popmax,1); % filament sizes
vtimes=sparse(1,timesteps,0,1,timesteps); % time steps, 1 if reproducing cells 
vcells=zeros(popmax,1); % one cell per row, value indicated next reproduction time (step)
pos_avail=(1:1:popmax)'; % available positions in cellmat, all avaliable at start
pos=popmax; % tracks last available position

fil_avail=(1:1:popmax)'; % available filament numbers
filpos=popmax; 

offsize=adsize/k;
offnr=floor(initpop/offsize);

cellct=0;
% create filaments
for i=1:offnr
    
    filct=fil_avail(1,1);
    fil_avail(1,1)=fil_avail(filpos,1);
    fil_avail(filpos,1)=0;
    filpos=filpos-1;
    
    cellmat((i*offsize-offsize+1):(i*offsize),1)=filct; % filament number
    cellmat((i*offsize-offsize+1):(i*offsize),2)=1:1:offsize; % order
    
    cellmat((i*offsize-offsize+1):(i*offsize),3)=1; % mutation, sc
    cellmat((i*offsize-offsize+1):(i*offsize),4)=0; % mutation, sg
    cellmat((i*offsize-offsize+1):(i*offsize),5)=fragstrat; % fragmentation strategy
    cellmat((i*offsize-offsize+1):(i*offsize),6)=0; % #muts
    
    filvec(filct,1)=offsize;
    filmat(filct,1:offsize)=(i*offsize-offsize+1):(i*offsize); % cells positions in cellmat
    
    for offs=1:offsize
        pos_avail(cellct+offs,1)=pos_avail(pos,1);
        pos_avail(pos,1)=0;
        pos=pos-1;    
    end
    cellct=cellct+offsize;
    
end

% possible remaining filament (if not adds up evenly with cells)
i2=i;
if mod(initpop,offsize)>0
    lastsize=mod(initpop,offsize);
    i2=i+1;
    dl=offsize-lastsize;
    
    filct=fil_avail(1,1);
    fil_avail(1,1)=fil_avail(filpos,1);
    fil_avail(filpos,1)=0;
    filpos=filpos-1;
    
    cellmat((i*offsize+1):(i*offsize+lastsize),1)=filct; % filament number
    cellmat((i*offsize+1):(i*offsize+lastsize),2)=1:1:lastsize; % order 
    cellmat((i*offsize+1):(i*offsize+lastsize),3)=1; % mutation, sc
    cellmat((i*offsize+1):(i*offsize+lastsize),4)=0; % mutation, sg
    cellmat((i*offsize+1):(i*offsize+lastsize),5)=fragstrat; % fragmentation strategy
    cellmat((i*offsize+1):(i*offsize+lastsize),6)=0; % #muts
    
    filvec(filct,1)=lastsize;
    filmat(filct,1:lastsize)=(i*offsize+1):(i*offsize+lastsize); % cells positions in cellmat
    
    for offs=1:lastsize
        pos_avail(cellct+offs,1)=pos_avail(pos,1);
        pos_avail(pos,1)=0;
        pos=pos-1;    
    end
    cellct=cellct+lastsize;
end

% introduce mutation
cellpos=find(cellmat(:,1));
ind=randsample(length(cellpos),1);
cellmat(cellpos(ind),3:4)=[1/(1+sc),sg];
cellmat(cellpos(ind),6)=1;

% reproduction times
for j=1:initpop
    rn=normrnd(0,.1,1);
    tnext=ceil((rn+2+cellmat(j,3))/dt); 
    %tnext=ceil((cellmat(j,3))/dt); 
    vtimes(1,tnext)=1;
    vcells(j,1)=tnext;
end



end