clc; clear; close all;
printf("Se proceseaza...\n");
Gt=0; 
Gd=1;
g=9.80665; 
m=1.2; 
G=m*g; 
v0=500;
r1=G/2/v0; 
r2=G/2/v0^2; 
N=300;
vx=zeros(1,N); vy=vx; 
x=zeros(1,N); y=x; 
unghi=linspace(1,89,800);
for k=1:length(unghi)
t0=0; tf=2*v0/g*sind(unghi(k));  
N=300; t=linspace(t0,tf,N); dt=t(2)-t(1);
for i=1:N-1
    vx(1)=v0*cosd(unghi(k)); 
    vy(1)=v0*sind(unghi(k)); 
    aux=1-dt*(r1+r2*sqrt(vx(i)^2+vy(i)^2))/m; 
    vx(i+1)=vx(i)*aux; 
    vy(i+1)=vy(i)*aux-g*dt; 
    x(i+1)=x(i)+vx(i)*dt; 
    y(i+1)=y(i)+vy(i)*dt; 
    if y(i+1)<0, break; 
  end;
end
t=t(1:i); vx=vx(1:i); vy=vy(1:i); x=x(1:i); y=y(1:i);
distanta(k)=max(x)*10^(-3);
end
aux=max(distanta);
m=1;
rezultat(1)=0;
printf("Introduceti distanta dorita (km):");
Distanta=scanf("%f", "C");
if (Distanta>=aux || Distanta<=1 || Distanta<=0)
  printf("Distanta nu este valida!\n");
else
 for k=1:length(unghi)
   if le(abs(distanta(k)-Distanta),3e-3)==1
   rezultat(m)=unghi(k);
   m=m+1;
 end;
end
if rezultat(1)!=0
printf("Unghiul este (in grade):");
disp(min(rezultat));
else
printf("Nu s-a gasit unghiul potrivit\n");
end
end
if rezultat(1)!=0
vx=zeros(1,N); vy=vx; 
x=zeros(1,N); y=x;
N=1500;
t0=0; tf=2*v0/g*sind(min(rezultat)); 
t=linspace(t0,tf,N); dt=t(2)-t(1);
for i=1:N-1
    vx(1)=v0*cosd(min(rezultat)); 
    vy(1)=v0*sind(min(rezultat)); 
    aux=1-dt*(r1+r2*sqrt(vx(i)^2+vy(i)^2))/m; 
    vx(i+1)=vx(i)*aux; 
    vy(i+1)=vy(i)*aux-g*dt; 
    x(i+1)=x(i)+vx(i)*dt; 
    y(i+1)=y(i)+vy(i)*dt; 
    if y(i+1)<0, break; 
  end;
end
t=t(1:i); vx=vx(1:i); vy=vy(1:i); x=x(1:i); y=y(1:i);
if Gd==1
    printf("Urmariti simularea!\n");
    figure(4);
    set(4,'Position',[50 50 850 600]);
    tic; simt0=toc; simt=simt0; 
    while simt<tf+simt0
        plot(x/1e3,y/1e3,'-g'); hold on
        xlabel('x(km)'); ylabel('y(km)'); grid;
        title('Simularea miscarii');
        axis equal; axis tight
        simt=toc; 
        index=abs(t-simt)==min(abs(t-simt));
        plot(x(index)/1e3,y(index)/1e3,'.b'); hold off
        text(x(end)/2/1e3,max(y)/3/1e3,['t=',num2str(round(t(index))),' s']);
        text(x(end)/2/1e3,max(y)/3/1e3-0.5,['vx=',num2str(round(round(vx(index)))),' m/s']);
        text(x(end)/2/1e3,max(y)/3/1e3-1,['vy=',num2str(round(round(vy(index)))),' m/s']);
        pause(1e-3);
    end
end
end