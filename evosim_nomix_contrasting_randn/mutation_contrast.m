function [sc,sg]=mutation_contrast(mutdata)

% extract information from mutdata
mu=mutdata(1);
scmax=mutdata(2);
sgmax=mutdata(3);
sgn=mutdata(4);

% draw mutant trait from exponential distribution
sc=abs(exprnd(1/mu));
sg=abs(exprnd(1/mu));

% check boundary
if sc>scmax
    sc=scmax;
end
if sg>sgmax
    sg=sgmax;
end

% selfish or altruisitc mutation
coin=rand;
if coin>.5 % selfish
    sg=-sg;
else % altruisitc
    sc=-sc;
end
    




end