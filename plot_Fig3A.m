clear all; close all

set(0,'DefaultAxesFontSize',24)

po2blood=0:.001:200;

phi=0.3; theta_g=85; sigma_g=30;
gtonic1=phi*(1-tanh((po2blood-theta_g)/sigma_g));

phi=0.24; theta_g=85; sigma_g=30;
gtonic2=phi*(1-tanh((po2blood-theta_g)/sigma_g));

phi=0.36; theta_g=85; sigma_g=30;
gtonic3=phi*(1-tanh((po2blood-theta_g)/sigma_g));

phi=0.3; theta_g=70; sigma_g=30;
gtonic4=phi*(1-tanh((po2blood-theta_g)/sigma_g));

phi=0.3; theta_g=100; sigma_g=30;
gtonic5=phi*(1-tanh((po2blood-theta_g)/sigma_g));

phi=0.3; theta_g=85; sigma_g=24;
gtonic6=phi*(1-tanh((po2blood-theta_g)/sigma_g));

phi=0.3; theta_g=85; sigma_g=36;
gtonic7=phi*(1-tanh((po2blood-theta_g)/sigma_g));


%%

lw=5;

figure(1)
hold on
plot(po2blood,gtonic1,'Color',[.5 .5 .5],'linewidth',lw)
plot(po2blood,gtonic2,'Color',[sin(pi*11/48),0,cos(pi*11/48)],'linewidth',lw)
plot(po2blood,gtonic3,'Color',[sin(pi*16/48),0,cos(pi*16/48)],'linewidth',lw)
plot(po2blood,gtonic4,'Color',[sin(pi*5/48),0,cos(pi*5/48)],'linewidth',lw)
plot(po2blood,gtonic5,'Color',[sin(pi*22/48),0,cos(pi*22/48)],'linewidth',lw)
plot(po2blood,gtonic6,'Color',[sin(pi*13/48),0,cos(pi*13/48)],'linewidth',lw)
plot(po2blood,gtonic7,'Color',[sin(pi*15/48),0,cos(pi*15/48)],'linewidth',lw)
plot(po2blood,gtonic1,'Color',[.5 .5 .5],'linewidth',lw)
xlabel('$P_\mathrm{a}\mathrm{O}_2$','Interpreter','latex','Fontsize',24)
ylabel('$g_\mathrm{tonic}$','Interpreter','latex','Fontsize',24)
h=legend('$\mathrm{default}$','$\phi=0.24$','$\phi=0.36$','$\theta_g=70$','$\theta_g=100$','$\sigma_g=24$','$\sigma_g=36$','location','northeast');
legend('boxoff')
set(h,'interpreter','latex')
xlim([0 180])
grid on

