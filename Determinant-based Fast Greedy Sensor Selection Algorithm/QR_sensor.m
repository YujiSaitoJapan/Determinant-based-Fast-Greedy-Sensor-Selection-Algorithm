function [time_QR, H, sensors]=QR_sensor(Psi, r, p, n)
tic;
[sensors]=sensor_manohar(r, p, Psi(:,1:r));
time_QR=toc;
[H]=makesensor_matrix(p, n, sensors);
end