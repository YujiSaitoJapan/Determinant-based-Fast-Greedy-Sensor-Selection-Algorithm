function movie(x,Itest,meansst,time,filename, mask)
for i=1:200%length(time)
 %x = Y(:,Itest(i))-meansst;
 figure(1);
 display_fig(x(i)+meansst,mask,[],[],time(i));
 frame(i) = getframe(figure(1));
end
%axis off
filename = ['movie', '\',filename, '.avi'];
movie2avi(frame, filename,'quality',100);
end