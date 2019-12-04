function [time_DG, H,sensors]=DG_sensor(Psi, r, p, s, n)

if p <= r
    tic;
      [sensors]= sensor_DGR_ALL_nono(Psi(:,1:r), r, p, s);
    time_DG=toc;
    [H]=makesensor_matrix(s, p, n, sensors);
else
    tic;
     [isensors]= sensor_DGR_ALL_nono(Psi(:,1:r), r, r, s);
%    [isensors]= sensor_DGR_ALL(Psi(:,1:r), r, r/s, s);
    [H]=makesensor_matrix(s, r, n, isensors);
    [sensors]=sensor_DGR(Psi(:,1:r), r, p, s, H, isensors);
    time_DG=toc;
    [H]=makesensor_matrix(s, p, n, sensors);
end

end