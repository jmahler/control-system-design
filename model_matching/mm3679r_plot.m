%
% mm3679r_plot.m
%

clear;

addpath('../lib');

mm3679_init;

ramp(Gm, sys)
print('mm3679r_plot.eps', '-deps2', '-color');
