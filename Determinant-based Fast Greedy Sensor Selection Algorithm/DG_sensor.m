function [time_DG, H,sensors]=DG_sensor(Psi, r, p, n)

if p <= r
    tic;
      [sensors]= sensor_DGR_ALL_nono(Psi(:,1:r), r, p);
    time_DG=toc;
    [H]=makesensor_matrix(p, n, sensors);
else
    tic;
     [isensors]= sensor_DGR_ALL_nono(Psi(:,1:r), r, r);
    [H]=makesensor_matrix(r, n, isensors);
    [sensors]=sensor_DGR(Psi(:,1:r), r, p, H, isensors);
    time_DG=toc;
    [H]=makesensor_matrix(p, n, sensors);
end

end