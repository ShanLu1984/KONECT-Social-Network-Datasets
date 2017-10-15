%X1: indegree; X2: outdegree


Delta=0.005;

lambda=1;
epsilon=1;

q=0.6; p1=0.2; epsilon_1=epsilon; epsilon_2=epsilon;

P_AddingNodes=1-q;
P_Adding_1= p1/P_AddingNodes;
P_Adding_2= (1- p1/P_AddingNodes);


mu=q*lambda;

%sgm=sqrt(mu-mu^2*Delta);
sgm=sqrt(mu);
%p=lambda*Delta;


N=5000;

x1=zeros(1,N);
x2=zeros(1,N);



for i=1:N
    i
    
        
    t_life=exprnd(1/lambda);
        
    rd=rand(1);
    if rd<p1/P_AddingNodes
        X1_0=1+epsilon_1;
        X2_0=epsilon_2;
        %X1_0=1;
        %X2_0=1;
        
    else
        X1_0=epsilon_1;
        X2_0=1+epsilon_2;
        %X1_0=1;
        %X2_0=1;
    end
    
    
    X1_temp=X1_0;
    X2_temp=X2_0;
    
    for t=0:Delta:t_life
        
        if X1_temp<=0
            X1_temp=X1_0;
        end
        
        if X2_temp<=0
            X2_temp=X2_0;
        end
        
        W1_temp=normrnd(0,Delta^0.5);
        W2_temp=normrnd(0,Delta^0.5);
        
        X1_temp=X1_temp+mu*X1_temp*Delta+sgm*sqrt(X1_temp)*W1_temp;
        X2_temp=X2_temp+mu*X2_temp*Delta+sgm*sqrt(X2_temp)*W2_temp;
                
    end
    
     if X1_temp<=0
         X1_temp=X1_0;
     end
        
     if X2_temp<=0
         X2_temp=X2_0;
     end
    
    x1(1,i)=X1_temp;
    x2(1,i)=X2_temp;
        
end

x1_int=ceil(x1);
x2_int=ceil(x2);     


figure;
plot(x1_int,x2_int,'+black');
%set(s,'XScale','log'); 
    