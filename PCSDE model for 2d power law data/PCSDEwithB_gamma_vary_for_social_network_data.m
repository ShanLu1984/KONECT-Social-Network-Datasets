%Generate sample data from PCSDE model with the same distribution as social network datasets

%Livejournal: lambda_0=1; mu=0.87; sgm=0.8, gamma=0.8, (SyntheticData)

%Flickr: lambda=1; mu=0.96, sgm=0.8; gamma=0.5 (SyntheticData)
         
%Youtube: lambda=1; mu=0.98, sgm =0.6; gamma = 0.1 (SyntheticData)
Delta=0.01;

lambda=1;
mu=0.98;
sgm=0.6;
gamma=0.1;

N=500000;

x1=zeros(1,N);
x2=zeros(1,N);

for n=1:N
    
    display(n);
    
    X1_temp=1;
    X2_temp=1;
    
    T0=exprnd(1/lambda);
    T1=exprnd(1/lambda);
    T2=exprnd(1/lambda);
    
    for t=0:Delta:T0
        
        if X1_temp<=0
            X1_temp=1;
        end
        
        if X2_temp<=0
            X2_temp=1;
        end
        
        W1_temp=normrnd(0,Delta^0.5);
        W2_temp=normrnd(0,Delta^0.5);
        
        X1_temp=X1_temp+mu*X1_temp*Delta+sgm*(X1_temp)^gamma*W1_temp;
        X2_temp=X2_temp+mu*X2_temp*Delta+sgm*(X2_temp)^gamma*W2_temp;
                
    end
    
    if X1_temp<=0
        X1_temp=1;
    end
        
    if X2_temp<=0
        X2_temp=1;
    end

    
    x1(1,n)=X1_temp;
    x2(1,n)=X2_temp;
end

x1_int=ceil(x1);
x2_int=ceil(x2);

s=subplot(1,1,1);
plot(x1_int,x2_int,'+r');
set(s,'XScale','log'); 
set(s,'YScale','log'); 
    
