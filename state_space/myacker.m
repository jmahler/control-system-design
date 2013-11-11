
function [K] = myacker(A, B, z)
% MYACKER My implementation of ACKER.
%
% MYACKER is my implementation of the Matlab ACKER function
% provided by Matlab.
% 
% See also ACKER, PLACE.

n = size(A, 1);
W = ctrb(A, B);  % controllabilty matrix
zp = poly(z);

en = zeros([1 n]);
en(n) = 1;

alpha = 0;
for i = 0:n
    if (i == n)
        % last
        alpha = alpha + zp(i+1)*eye(n);
    else
        alpha = alpha + zp(i+1)*A^(n-i);
    end
end

K = en*(W\alpha);