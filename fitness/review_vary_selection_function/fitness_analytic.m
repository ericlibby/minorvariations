% fitness based on analytica expression
% W=#offspring/time

clear
N=16;
ks=[2,4,8,16];
lambda=1;

sc=0;
sg=0;

as=.3:.01:1;
bs=-4.5:.01:1;



for ia=1:length(as)
    
    for ib=1:length(bs)
    
        
        a=as(ia);
        b=bs(ib);
        survival=@(x) (1.7 ./ (1+exp(-a*(x-b))))-0.9;

        for ik=1:length(ks)

            k=ks(ik);
            kappa=lambda*k.*survival(N./k)./log(k);
            
            name="k_"+num2str(ks(ik));
            growth.(name)(ia,ib)=kappa*(1+sc)*(1+sg);

        end
        
    end

end

beep


