function [cellmat,filmat,filvec,vtimes,pos_avail,pos,fil_avail,filpos,death,dinds]=...
    fragmentation(filnr,psurv,adsize,k,cellmat,filmat,filvec,vtimes,pos_avail,pos,fil_avail,filpos,fstrat,fidx)

% fragmentation
death=0;
dinds=[];

fragfil=cellmat(nonzeros(filmat(filnr,:)),:); % fragmenting filament
fragpos=filmat(filnr,1:length(fragfil(:,1))); % positions in cellmat
filmat(filnr,:)=0;

if fstrat==1 || fstrat==2 % deterministic
    offs=adsize/k;
    brks=offs:offs:(adsize-1);
    offsize=offs*ones(1,k);
elseif fstrat==3 % stoc. in space
    p=(k-1)/(adsize-1);
    coin=rand(adsize-1,1); % flip coin for each connection
    brks=find(coin<p); % nodes to break
    offsize=[brks;length(fragpos)]-[0;brks];
else % stoc. in time
    brks=fidx; % mother of just reproduced cells
    offsize=[fidx,length(fragpos)-fidx];
end



for i=1:(length(brks)+1) % for each filament

    if i==1 % first filament
        dtrinds=find(sum(fragfil(:,2)==1:1:offsize(i),2));
        % survival
        sgcont=mean(fragfil(dtrinds,4)); % contribution from sg
        coin_surv=rand(1); %
        
        if coin_surv<(psurv(length(dtrinds))*(1+sgcont))
            % daughter survives
            filvec(filnr,1)=offsize(i);
            filmat(filnr,1:offsize(i))=fragpos(dtrinds);
        else
            % daughter dies
            pos_avail((pos+1):(pos+offsize(i)),1)=fragpos(dtrinds); % free positions in cellmat
            pos=pos+offsize(i);
            filpos=filpos+1;
            fil_avail(filpos,1)=filnr;
            %cellmat(fragpos(dtrinds),:)=0;
            %vtimes(fragpos(dtrinds),:)=0;
            dinds=[dinds,fragpos(dtrinds)];
            filvec(filnr,1)=0;
            death=death+offsize(i);
        end
        
        
    else % remaining daughters
        dtrinds=find(sum(fragfil(:,2)==(1:1:offsize(i))+sum(offsize(1:(i-1))),2));
        %curfilnr=find(~filvec,1); % available filament number
        % survival
        sgcont=mean(fragfil(dtrinds,4)); % contribution from sg
        coin_surv=rand(1); %
        
        if coin_surv<(psurv(length(dtrinds))*(1+sgcont))
            % daughter survives
            curfilnr=fil_avail(1,1);
            fil_avail(1,1)=fil_avail(filpos,1);
            fil_avail(filpos,1)=0;
            filpos=filpos-1;
            
            cellmat(fragpos(dtrinds),1)=curfilnr; % filament number
            cellmat(fragpos(dtrinds),2)=cellmat(fragpos(dtrinds),2)-sum(offsize(1:(i-1))); % order
            filmat(curfilnr,1:offsize(i))=fragpos(dtrinds);
            filvec(curfilnr,1)=offsize(i);
        else
            % daughter dies
            pos_avail((pos+1):(pos+offsize(i)),1)=fragpos(dtrinds); % free positions in cellmat
            pos=pos+offsize(i);
            %cellmat(fragpos(dtrinds),:)=0;
            %vtimes(fragpos(dtrinds),:)=0;
            dinds=[dinds,fragpos(dtrinds)];
            death=death+offsize(i);
        end
       
    end
    
end


end