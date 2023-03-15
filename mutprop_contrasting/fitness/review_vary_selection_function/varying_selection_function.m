% Vary selection functions
clear

N=8; % daughter size
sizes=linspace(1,N);

e=2;
if e==1
    a=.4; % EB
    b=0; 
    k=.1;
    m=.05;
else
    a=.89; % EC
    b=-4;
    k=.02;
    m=.75;
end

% original sigmoid
c=1.7;
d=.9;
s_sig=@(x) (c ./ (1+exp(-a*(x-b))))-d;

% modified sigmoid
c=1.9; % shifts width in y-direction of curve (narrow)
d=1; % shifts the height in y-direction (position)
s_sig_mod=@(x) (c ./ (1+exp(-a*(x-b))))-d;

% linear
s_linear=@(x) k*x+m;


colors=[55,126,184;77,175,74;152,78,163;228,26,28]/255;

fig=figure;
hold on
plot(sizes,s_sig(sizes),'LineWidth',2,'color',colors(1,:))
plot(sizes,s_sig_mod(sizes),'LineWidth',2,'color',colors(2,:))
plot(sizes,s_linear(sizes),'LineWidth',2,'color',colors(3,:))

ylim([0 1])

ax=gca;
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
set(gca,'TickLabelInterpreter','latex')
ylabel('$p_s$','fontsize',24,'interpreter','latex');
xlabel('filament length','fontsize',24,'interpreter','latex');

lgd=legend('sigmoid','sigmoid mod','linear','Interpreter',"latex",'Location','southeast');
lgd.FontSize = 18;
legend boxoff



