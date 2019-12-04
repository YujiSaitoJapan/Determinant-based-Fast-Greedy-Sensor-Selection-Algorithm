function  [sensors]=sensor_manohar(r, p, Psi)

% see paper "Data-Driven Sparse Sensor Placement for Reconstruction: Demonstrating the Benefits of Exploiting Known Patterns"
% https://ieeexplore.ieee.org/abstract/document/8361090
% Krithika Manohar, Bingni W. Brunton, J. Nathan Kutz, Steven L. Brunton
% Date of Publication: 18 May 2018 

if p <= r
    U=Psi(:,1:r);
else
    U=Psi;
    U=U*U';
end
[~,~,pivot] = qr(U','vector');

sensors = pivot(1:p);

%      %190715--------------------------------------
%         zqr = zeros(size(zhat)); zqr(pivot) = 1;
%         [zloc,~] = sens_sel_locr(U(:,1:r),p,zqr);
%         sensors = find(zloc>.1);
%         assert(length(sensors)==p);
end