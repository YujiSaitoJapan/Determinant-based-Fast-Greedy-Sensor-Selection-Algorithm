function plot_error(r,p,error_QR,  error_rand,  error_DGR, error_Convex, y_lim, filename,y_name)
    [setfonts] = @(h) set(h,'FontSize',20);
    [setmarkers] = @(h,col) set(h,'MarkerSize',8,'MarkerEdgeColor',...
                                    col,'MarkerFaceColor',col);
  
 w=r:p;
 
% if ~isempty(error_rand)
    h=plot(w,error_rand(r,w),'ko-'); 
    setmarkers(h,'k');
    
    hold on;
      h=plot(w,error_QR(r,w),'r+-');          
      setmarkers(h,'r');
      
      h=plot(w,error_DGR(r,w),'b+-');          
      setmarkers(h,'b');
      
      h=plot(w,error_Convex(r,w),'y+-');          
      setmarkers(h,'y');
    
   hold off
%     if ~isempty(error_QR)
%         h=plot(w,error_QR(r,w),'r+-');          
%         setmarkers(h,'r');
%     end    
%         h=plot(w,error_pQR(r,w),'b+-');          
%         setmarkers(h,'b');
%        text(2,8,'QR','Color','red','FontSize',14)
%    end
%    if ~isempty(error_GR)        
%         h=plot(w,error_GR(r,w),'b+-');          
%         setmarkers(h,'b');
%  %       text(2,7,'GR','Color','blue','FontSize',14)
%     end
%     if ~isempty(error_DGR)
%         h=plot(w,error_DGR(r,w),'g+-');          
%         setmarkers(h,'g');
  %      text(2,6,'DGR','Color','green','FontSize',14)
%     end
%     if ~isempty(error_Convex)
%          h=plot(w,error_Convex(r,w),'y+-');          
%         setmarkers(h,'y');
%  %       text(2,5,'Convex','Color','yellow','FontSize',14)
%     end
%     hold off
%    dim = [.2 .5 .2 .3];
%    str = 'Black:Rand, Blue:GR, Green:DGR, Yellew:Convex';
%    annotation('textbox',dim,'String',str,'FitBoxToText','on', 'FontName','Times New Roman');
%   g='Black:Rand, Red:QR, Blue:GR, Green:DGR, Yellew:Convex';
%   title(g,'FontSize',15,'FontName','Times New Roman');
%    legend('Random','QR','GR','DGR','Convex'); 
% 
%     if ~isempty(error_QR)
%         legend('Random','QR','pQR','DGR');
%     else
%         legend('Random','pQR','DGR');
%     end
    legend('Random','QR','DGR','Convex');
    xlim([r p]) 
    ylim([0 y_lim])   
    xlabel('Number of sensor','FontSize',20)
    ylabel(y_name,'FontSize',20)
    saveas(gcf, filename)
end