%
% cl_mwinitial.m
%
% Control Law example provided by Mathworks
%
%  [http://www.mathworks.com/help/control/ref/initial.html]
%
% which shows how to use the 'initial' function.
%

a = [-0.5572   -0.7814;0.7814  0];
c = [1.9691  6.4493];
x0 = [1 ; 0];

sys = ss(a, zeros(2,2) ,c, zeros(1,2));
%   Notice that B and D are null

initial(sys,x0)
