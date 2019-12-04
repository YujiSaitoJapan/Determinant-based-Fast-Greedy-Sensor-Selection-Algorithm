function [time_QR, H, sensors]=QR_sensor(Psi, r, p, s,n)
tic;
[sensors]=sensor_manohar(r, p, Psi(:,1:r));
time_QR=toc;
[H]=makesensor_matrix(s, p, n, sensors);
end