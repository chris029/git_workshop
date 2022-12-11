clc
clear

% comment to test matlab commit

% comment to test tortoise

fs = 100;
t = 0:1/fs:1;
x = sin(2*pi*t*3) + 0.25*sin(2*pi*t*40);
y = sin(2*pi*t*6) + 0.5*sin(2*pi*t*40);
% y = dsp_tools.custom_medfilt1(x,9);

plot(t,x,t,y)
legend('Original','Filtered')
legend('boxoff')
% utilities.save_fig_as_graphics('graphic_results')