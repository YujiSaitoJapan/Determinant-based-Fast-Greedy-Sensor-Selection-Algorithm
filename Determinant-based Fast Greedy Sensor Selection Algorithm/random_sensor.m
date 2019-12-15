function [time_rand, H,sensors]=random_sensor(n,p)
tic;
sensors = randperm(n,p);
time_rand=toc;

[H]=makesensor_matrix( p, n, sensors);
end