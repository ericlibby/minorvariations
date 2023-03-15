function [m,mp]=recursion(pb,adsize)
% m - expectations, collected in a matrix
% s - probabilitiy rightmost filament is of size k
% pb - breakage probability
% i+1 - filament lenght
% j - offpring size

% mp - expecations with forced fragmentation at adult size

m=zeros(adsize,adsize);
m(1,1)=1;

mp=zeros(adsize,adsize);
mp(1,1)=1;
for i=1:adsize-1
    j=i+1;
    
    % probabilities
    for i0=1:i
       s(i0)=pb*(1-pb)^(i0-1); 
    end
    s(i+1)=(1-pb)^(i);

    % conditioned probabilities
    sp=s./(1-s(end));
    sp(end)=0;
    
    % expectations (recursive sum)
    for i2=1:j % for each offfspring size
        mnew=0;
        mnew=mnew+s(i2);
        
        mnewp=0;
        mnewp=mnewp+sp(i2);
        
        for i1=1:(i+1-i2) % sum in recursion
            mnew=mnew+s(i1)*m(i2,i+1-i1);
            
            mnewp=mnewp+sp(i1)*m(i2,i+1-i1);
        end
        Mnew(i2)=mnew;
        
        Mnewp(i2)=mnewp;
    end
    m(1:length(Mnew),i+1)=Mnew';
    
    mp(1:length(Mnewp),i+1)=Mnewp';
end



end