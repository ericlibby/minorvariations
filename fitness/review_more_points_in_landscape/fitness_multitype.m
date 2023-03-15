% Semi-analytical calculation of growth rate
clear
max_filament_size=16;

ks=[2,4,8,16]; % number of daughters produced at fragmentation

% coefficients in the selection function (survival)
as=.3:.01:1;
bs=-4.5:.01:1;

%figure,hold on
for ia=1:length(as)
    a=as(ia);
    for ib=1:length(bs)
        b=bs(ib);
        
        survival=@(x) (1.7 ./ (1+exp(-a*(x-b))))-0.9;

        for ik=1:length(ks)

            offspring_size=max_filament_size/ks(ik);
            M=zeros(max_filament_size-1, max_filament_size-1);
            M=M+diag(-(1:1:(max_filament_size-1)))+diag((1:1:(max_filament_size-2)),-1);    

            % Last column decides expectations to get different offspring sizes
            M(offspring_size,end)=(max_filament_size/offspring_size)*(max_filament_size-1)*survival(offspring_size); 

            
            [v,e,w]=eig(M);
            r=max(e(imag(e)==0)); % dominant eigenvalue
            name=['k_',num2str(ks(ik))];
            growth.(name)(ia,ib)=r;

        end

        % unicellular life cycle
        offspring_size=1;
        max_filament_size_uni=2;

        growth_uni(ia,ib)=max_filament_size_uni*survival(offspring_size);

    end

end

beep


