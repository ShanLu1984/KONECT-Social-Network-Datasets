function [A,D] = GenerativeModel2D_Bollobas(N,m0,q,p1,epsilon)

%n: total number of steps.

%m0: initial number of nodes

%p: probability that adding a node in that step
%1-p: probability that adding an directed edge

%l: the initial degree added to each new node

%A(i,j): directed link from i to j

A=zeros(m0,m0);

for n = 1:N/(1-q)*2
    %clc;
    ba_step = n;
    ba_step
    
    if size(A,1)==N
        break;
    end
    
    Deg_in_temp = sum(A,1)+epsilon*ones(size(sum(A,1)));
    Deg_out_temp = sum(A,2)+epsilon*ones(size(sum(A,2)));

        P_in = Deg_in_temp./sum(Deg_in_temp);
        P_out = Deg_out_temp./sum(Deg_out_temp);

        for j = 2:size(P_in,2)
            P_in(1,j) = P_in(1,j)+P_in(1,j-1);
        end
        
        for k = 2:size(P_out,1)
            P_out(k,1) = P_out(k,1)+P_out(k-1,1);
        end
    
    
    if rand<1-q
        
        A(size(A,1)+1,:)=zeros(1,size(A,2));
        A(:,size(A,2)+1)=zeros(size(A,1),1);
        
        if rand<p1/(1-q)
                  
            rd = rand(1);
            node_initial = 0;

            for s = 1:length(P_out)
                if rd <= P_out(s)                  
                node_initial = s;
                break;
                end
            end
            
            A(node_initial,end) = A(node_initial,end)+1;
        else
            
            rd = rand(1);
            node_target = 0;

            for t = 1:length(P_in)
                if rd <= P_in(t)                  
                 node_target = t;
                 break;
                end
            end
            
            A(end,node_target) = A(end,node_target)+1;
        end
    else

        rd = rand(1);
        node_target = 0;

        for l = 1:length(P_in)
            if rd <= P_in(l)                  
            node_target = l;
            break;
            end
        end
        
        rd = rand(1);
        node_initial = 0;

        for m = 1:length(P_out)
            if rd <= P_out(m)                  
            node_initial = m;
            break;
            end
        end
        

        A(node_initial,node_target) = A(node_initial,node_target)+1;
        
    end
    
    
end

Deg_in = sum(A)+epsilon*ones(size(sum(A)));
Deg_in = Deg_in';
Deg_out = sum(A,2)+epsilon*ones(size(sum(A,2)));

D=[Deg_in,Deg_out];

figure;
plot(D(:,1),D(:,2),'+');