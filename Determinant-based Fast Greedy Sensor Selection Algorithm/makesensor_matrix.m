function [H]=makesensor_matrix(s, p, n, isensors)
H=zeros(s*p,n);    %Create array of all zeros
for i=1:s
    for t=1:p
       H(t+(i-1)*p, isensors(t) + (i-1)*n/s    )=1;
    end
end