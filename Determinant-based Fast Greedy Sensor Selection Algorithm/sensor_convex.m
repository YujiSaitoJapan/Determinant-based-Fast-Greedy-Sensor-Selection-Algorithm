function [isensors,zhat]=sensor_convex(U, r, p, s,maxiteration)
[n,~]=size(U);
UU=[];
for i=1:s
UU(:,:,i)=U((1+(i-1)*n/s):(i*n/s) ,1:r); 
end
[zhat, ~, ~] = sens_sel_approxnt_vec(UU, p, maxiteration);
isensors = find(zhat);
H=zeros(p,n);    