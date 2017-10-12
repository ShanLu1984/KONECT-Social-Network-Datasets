% This function is used to present the dependency between nodes with the
% increasing of nodes' degree

load('.\facebook-wosn-wall\degrees.mat');
in_degree=degrees(:,1);
out_degree=degrees(:,2);

[~,Din_index]=sort(in_degree,'descend');
[~,Dout_index]=sort(out_degree,'descend');

P_interval=0.01;

fraction=P_interval:P_interval:1;
overlap_percentage=zeros(size(fraction));

for i=1:length(fraction)
    
    frac_temp=fraction(i);
    
    Num_D=floor(frac_temp*size(degrees,1));
    
    Din_temp=Din_index(1:Num_D,1);
    Dout_temp=Dout_index(1:Num_D,1);
    
    D_intersec=intersect(Din_temp, Dout_temp);
    overlap_percentage_temp=length(D_intersec)/Num_D;
    
    overlap_percentage(1,i)=overlap_percentage_temp;
    
end

plot(fraction, overlap_percentage,'blue');
xlabel('Fraction of users (ordered by out-/in-degree)');
ylabel('Overlap');
legend('facebook-wosn-wall');