function [time_convex, H, sensors]=convex_sensor(Psi, r, p, n, maxiteration)
         tic;
         [sensors,~]=sensor_convex(Psi(:,1:r), r, p,maxiteration);
         time_convex=toc;
         [H]=makesensor_matrix(p, n, sensors);
