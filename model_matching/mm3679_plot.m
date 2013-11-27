%
% mm3679_plot.m
%

clear;

addpath('../lib');

mm3679_init;

step(Gm, sys)
print('mm3679_plot.eps', '-deps2', '-color');
