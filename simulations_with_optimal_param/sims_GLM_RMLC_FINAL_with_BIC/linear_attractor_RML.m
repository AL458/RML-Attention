%this script is an implementation of the neural network realized by Deneve
%et al., 2001, to be interfaced with the RML


function [bfm]=linear_attractor_RML(velY,velX,NE)

%constants
mu=NE;
ni=1;
S=0.1;
K=20;
C=1;
sig=0.16;
NC=5;
Am=10^4;

Kw=1;
sigw=0.1;%NE modulation on receptive field precision
N=40;%number of units

%init connection matrices
Wr=zeros(N,N,N);
We=Wr;
Wh=Wr;


%connection matrices
for j=1:N
    for l=2:2:N
        for m=2:2:N
             Wr(j,l,m)=Kw*exp((cos((2*pi/N)*(j-l))-1)./(sigw));
             We(j,l,m)=Kw*exp((cos((2*pi/N)*(j-m))-1)./(sigw));
             Wh(j,l,m)=Kw*exp((cos((2*pi/N)*(j-l-m+20))-1)./(sigw));
        end
    end
end


%initialization
Re=zeros(N,1);%x velocity layer
Rr=zeros(1,N);%y velocity layer
A=zeros(N,N);%basis functions layer
Rh=zeros(1,N);%head-centred position layer
Re0=zeros(N,1);%eye position layer
Rr0=zeros(1,N);%retinal position layer
Rh0=zeros(1,N);%head-centred position layer
Rrb=zeros(1,N);
Reb=zeros(N,1);
Rhb=zeros(1,N);

L=zeros(N,N);
Lbuff1=zeros(N,N);
Lbuff2=zeros(N,N);
Lbuff3=zeros(N,N);

%environment input of dots velocity (x and y) 
Xe=velY;
Xr=velX;
Xh=Xe+Xr;


%convertion from deg to rad
Xe=(Xe+180)*(pi/180);
Xr=(Xr+180)*(pi/180);
Xh=(Xh+180)*(pi/180);

%initialize input layers activity
j=(1:N);
Re0(j)=C*(K*exp((cos(Xe-(2*pi/N).*j)-1)/(sig))+ni);
Rr0(j)=C*(K*exp((cos(Xr-(2*pi/N).*j)-1)/(sig))+ni);
Rh0(j)=C*(K*exp((cos(Xh-(2*pi/N).*j)-1)/(sig))+ni);

%normalization
Re0=Re0./(norm(Re0));
Rr0=Rr0./(norm(Rr0));
Rh0=Rh0./(norm(Rh0));

%noise injection
Re=Re0+(randn(N,1)*0);
Rr=Rr0+(randn(1,N)*0);
Rh=Rh0+(randn(1,N)*0);



x=[2:2:N];
y=x;



%network dynamics
for q=1:NC
    for l=2:2:N
        for m=2:2:N
            for j=1:N
                Lbuff1(l,m)=(Wr(j,l,m).*Rr(j))+Lbuff1(l,m);
                Lbuff2(l,m)=(We(j,l,m).*Re(j))+Lbuff2(l,m);
                Lbuff3(l,m)=(Wh(j,l,m).*Rh(j))+Lbuff3(l,m);
            end
        end
    end

    L=Lbuff1+Lbuff2+Lbuff3;
    
    SL=sum(sum(pow2(L)));

    for l=2:2:N
        for m=2:2:N
            A(l,m)=(L(l,m)^2)./(S+mu.*(SL));
            for j=1:N
                Rrb(j)=((Wr(j,l,m).*A(l,m))+Rrb(j));
                Reb(j)=((We(j,l,m).*A(l,m))+Reb(j));
                Rhb(j)=((Wh(j,l,m).*A(l,m))+Rhb(j));
                Rr(j)=(Rrb(j)^2)./(S+mu.*(Rrb(j)^2));
                Re(j)=(Reb(j)^2)./(S+mu.*(Reb(j)^2));
                Rh(j)=(Rhb(j)^2)./(S+mu.*(Rhb(j)^2));
            end
        end
    end
    
%     if(q==1)
%        % figure;
%        % surf(x,y,L(x,y));title('A0'); 
%     end
%     if(q==NC)
% %         figure;
% %         surf(x,y,A(x,y));title('AN'); 
%     end
    
end


% figure;
% subplot(2,3,1); plot(Rr0);title('retinal');
% subplot(2,3,2); plot(Re0);title('eye');
% subplot(2,3,3); plot(Rh0);title('head');
% subplot(2,3,4); plot(Rr);title('retinal');
% subplot(2,3,5); plot(Re);title('eye');
% subplot(2,3,6); plot(Rh);title('head');


bfm=Am*A(x,y);




