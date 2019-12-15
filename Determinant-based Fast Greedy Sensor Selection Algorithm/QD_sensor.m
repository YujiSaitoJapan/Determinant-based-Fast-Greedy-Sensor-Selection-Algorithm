function [time_QD, H,sensors]=QD_sensor(Psi, r, p, n)
if p <= r
    tic;
    [sensors]=sensor_manohar(r, p, Psi(:,1:r));
    time_QD=toc;
    [H]=makesensor_matrix(p, n, sensors);
else
    tic;
    [isensors]=sensor_manohar(r, r, Psi(:,1:r));
    [H]=makesensor_matrix(r, n, isensors);
    [sensors]=sensor_DGR(Psi(:,1:r), r, p, H, isensors');
    [H]=makesensor_matrix(p, n, sensors);
    time_QD=toc;
end
end