function [time_rand, H,sensors]=random_sensor(n,p,s)
tic;
sensors = randperm(n,p);
time_rand=toc;

[H]=makesensor_matrix(s, p, n, sensors);
end