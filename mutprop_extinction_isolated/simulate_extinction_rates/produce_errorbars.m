function [errk2,errk4,errk8,errk16]=...
    produce_errorbars(Mut_fix_k2,Mut_fix_k4,Mut_fix_k8,Mut_fix_k16,sims,trait)



for i0=1:length(trait)

    survs=[ones(Mut_fix_k2(i0),1);zeros(sims-Mut_fix_k2(i0),1)];
    [~,I]=sort(randn(sims,1));
    for i1=1:(sims/10)
       group(i1,:)=survs(I(((10*i1-9):(10*i1))))'; 
    end
    errk2(i0)=std(sum(group,2)/10);

    survs=[ones(Mut_fix_k4(i0),1);zeros(sims-Mut_fix_k4(i0),1)];
    [~,I]=sort(randn(sims,1));
    for i1=1:(sims/10)
       group(i1,:)=survs(I(((10*i1-9):(10*i1))))'; 
    end
    errk4(i0)=std(sum(group,2)/10);
    
    survs=[ones(Mut_fix_k8(i0),1);zeros(sims-Mut_fix_k8(i0),1)];
    [~,I]=sort(randn(sims,1));
    for i1=1:(sims/10)
       group(i1,:)=survs(I(((10*i1-9):(10*i1))))'; 
    end
    errk8(i0)=std(sum(group,2)/10);
    
    survs=[ones(Mut_fix_k16(i0),1);zeros(sims-Mut_fix_k16(i0),1)];
    [~,I]=sort(randn(sims,1));
    for i1=1:(sims/10)
       group(i1,:)=survs(I(((10*i1-9):(10*i1))))'; 
    end
    errk16(i0)=std(sum(group,2)/10);
end







