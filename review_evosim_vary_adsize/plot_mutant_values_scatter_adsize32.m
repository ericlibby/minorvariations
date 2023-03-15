% plot mutant values
% scatter plot, take population mean for sc and sg for each evolutionary
% simulation


colors=[55,126,184;77,175,74;152,78,163;228,26,28;255,127,0]/255;

for a=1:5
    fig=figure;
    hold on
    ct=0;

    if a==1
        Cellmat=CellmatA;
    elseif a==2
        Cellmat=CellmatB;
    elseif a==3
        Cellmat=CellmatC;
    elseif a==4
        Cellmat=CellmatD;
    else
        Cellmat=CellmatE;
    end
    for i0=1:sims

        for i1=1:its
            ct=ct+1;
            if i1==its
                name=['run',num2str(ct)];
                scatter(mean(1./Cellmat.(name)(:,1)-1),mean(Cellmat.(name)(:,2)),'MarkerFaceColor',colors(a,:),'MarkerEdgeColor',[0 0 0])
                traits_k2(i0,:)=[mean(1./Cellmat.(name)(:,1)-1),mean(Cellmat.(name)(:,2))];
                if mean(1./Cellmat.(name)(:,1)-1)>0 && mean(Cellmat.(name)(:,2))>0
                    disp('k2')
                    [mean(1./Cellmat.(name)(:,1)-1),mean(Cellmat.(name)(:,2))]
                    i0 % simulation
                    i1 % iteration
                end
            end
        end
    end

    plot([-.1,.2],[0 0],'k','LineWidth',2)
    plot([0 0],[-.1,.2],'k','LineWidth',2)
    set(gca,'xtick',[])
    set(gca,'ytick',[])

    axis off

    % ticks x-axis
    xs=-.1:.05:.2;
    for i=1:length(xs)
        plot([xs(i),xs(i)],[-.005,.005],'k','LineWidth',2)
    end
    % ticks y-axis
    ys=-.1:.05:.2;
    for i=1:length(ys)
        plot([-.005,.005],[ys(i),ys(i)],'k','LineWidth',2)
    end
    %xlim([-.15 .18])
    %ylim([-.05 .18])
    xlabel('$s_c$','fontsize',24,'interpreter','latex')
    ylabel('$s_g$','fontsize',24,'interpreter','latex')
    
    ax=gca;
    ax.XAxis.FontSize = 20;
    ax.YAxis.FontSize = 20;
    set(gca,'TickLabelInterpreter','latex')

    t1 = annotation('textbox', [.87 .16 .9 .2], 'String', "0.2");
    sz = t1.FontSize;
    t1.FontSize = 16;
    t1.Interpreter='latex';
    t1.EdgeColor='none';

    t2 = annotation('textbox', [.4 .72 .9 .2], 'String', "0.2");
    sz = t2.FontSize;
    t2.FontSize = 16;
    t2.Interpreter='latex';
    t2.EdgeColor='none';

    t3 = annotation('textbox', [.44 .69 .9 .2], 'String', "$s_g$");
    sz = t3.FontSize;
    t3.FontSize = 24;
    t3.Interpreter='latex';
    t3.EdgeColor='none';

    t4 = annotation('textbox', [.83 .28 .9 .2], 'String', "$s_c$");
    sz = t4.FontSize;
    t4.FontSize = 24;
    t4.Interpreter='latex';
    t4.EdgeColor='none';

    if a==1
        title('$k$=2','fontsize',24,'interpreter','latex')
    elseif a==2
        title('$k$=4','fontsize',24,'interpreter','latex')
    elseif a==3
        title('$k$=8','fontsize',24,'interpreter','latex')
    elseif a==4
        title('$k$=16','fontsize',24,'interpreter','latex')
    else
        title('$k$=32','fontsize',24,'interpreter','latex')
        
    end
    
end


