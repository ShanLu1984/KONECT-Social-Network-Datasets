% This function is used to plot the joint degree distribution of nodes in
% graph and compute the correlation between in- and out-degree.

load('.\facebook-wosn-wall\degrees.mat');
in_degree = degrees(:,1);
out_degree = degrees(:,2);

corr_inout = corr(degrees(:,1), degrees(:,2));

loglog(in_degree, out_degree, '*');
xlabel('in-degree');
ylabel('out-degree');
title(['facebook-wosn-wall, correlation: ' num2str(corr_inout)]);