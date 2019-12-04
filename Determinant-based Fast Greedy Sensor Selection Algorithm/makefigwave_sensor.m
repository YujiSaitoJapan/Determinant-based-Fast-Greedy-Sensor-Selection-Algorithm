function makefigwave_sensor(X,isensor,dir)
mkdir(dir);
%%
load('NUM_t.mat');
load('NUM_s.mat');
load('maskmod.mat');
load('maskmod_col.mat');
load('k0.mat');
load('u_ave.mat');
load('v_ave.mat');

 [setfonts] = @(h) set(h,'FontSize',20);
%%
ufield_tmp = zeros(128*128,1);
ufield_mod = zeros(128,128);
vfield_tmp = zeros(128*128,1);
vfield_mod = zeros(128,128);
sfield_tmp = zeros(128*128,1);
sfield_mod = zeros(128,128);
sfield = zeros(128*128,1);

[~,ms]=size(isensor);
for i=1:ms
    isensor(i)
   sfield(isensor(i))=1;
end
find(sfield,ms)

[mmm,nnn]  = size(X);

for i = 1 : 1;%nnn
%for i = 1 : nnn
  u_mod2 = X(1:(mmm/2),i)+u_ave;
  
  k = 1;
  for n = 1 : 128*128     
      if maskmod_col(n,1) == 1
           ufield_tmp(n,1) = u_mod2(k,1);
           sfield_tmp(n,1) = sfield(k,1);
           k = k+1;
        else ufield_tmp(n,1) = 0;
      end
  end
 
  ufield_mod     = reshape(ufield_tmp,[128,128]);
  sfield_mod     = reshape(sfield_tmp,[128,128]);
  ufield_mod(k0) = -inf;
  ufield_mod     = ufield_mod(51:103,26:113);
  sfield_mod     = sfield_mod(51:103,26:113);
  [iy,ix]=find(sfield_mod,ms);
  figure(3)
  hold off
%  imagesc(ufield_mod,[-8 8]), axis image; 
   imshow(ufield_mod,[-10,20],'Border','tight','InitialMagnification',500);
   daspect([1 1 1])
   axis off;
   ylim([51-50 103-50]) 
   xlim([26-25 113-25]) 
   jetmod=jet(256);
   jetmod(1,:)=0;
   colormap(jetmod); 
   c=colorbar();
!   title(c,'u','FontSize',15,'FontName','Times New Roman Italic')
!  title(c,'FontSize',20,'FontName','Times New Roman')
   set(gcf,'PaperPositionMode','auto');
   hold on; 
   plot(ix,iy,'ko','MarkerSize',8, 'LineWidth', 1.0, 'MarkerFaceColor','none');
   legend('Sensor position','FontSize',14,'FontName','Times New Roman');
   saveas(gcf, [dir  '\',dir,'_reconst_uwave_sensor.png']);
    saveas(gcf, [dir  '\',dir,'_reconst_uwave_sensor.emf']);
 %  frame(i) = getframe(gcf);
end


