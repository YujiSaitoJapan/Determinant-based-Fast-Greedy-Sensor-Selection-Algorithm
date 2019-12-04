function [time_convex, H, sensors]=convex_sensor(Psi, r, p, s, n, maxiteration)
         tic;
         [sensors,~]=sensor_convex(Psi(:,1:r), r, p,s,maxiteration);
         time_convex=toc;
         [H]=makesensor_matrix(s, p, n, sensors);
