function [Det_calculation]=det_calculation(p,r,H,Psi)
C=H*Psi;
if p <= r
    Det_calculation=log(det(C*C'));
else
    Det_calculation=log(det(C'*C));
end
end