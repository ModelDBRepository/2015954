% Simulates and plots the PaO2 vs M curve for [Hb] = 250 from Figure 5B
% Runtime: approximately 100 minutes on a laptop

clear all; close all

% Parameters

global M phi theta_g sigma_g taulb Hb Vol0

% Initial Conditions
v0=-60; n0=0; h0=0.6; alpha0=0; vollung0=2; PO2lung0=110; PO2blood0=110;
inits0=[v0 n0 h0 alpha0 vollung0 PO2lung0 PO2blood0];
    
tf=6e4;
    
options=odeset('RelTol',1e-8,'AbsTol',1e-8);
   
phi=0.24; % nS -- this is the maximal gtonic
theta_g=70; % mmHG -- this is the threshold for the sigmoid
sigma_g=36; % mmHg -- this is the reciprocal slope of the sigmoid
taulb=500; % time constant for O2 transfer from lungs to blood
Hb=250; % concentration of hemoglobin
Vol0=2; % unloaded lung volume

M=8e-6; % metabolic demand
    
% closed loop
    
[t0_closed,u0_closed]=ode15s('closedloopM',[0 tf],inits0,options);
    
inits1_closed=u0_closed(end,:);
[t1_closed,u1_closed]=ode15s('closedloopM',[0 tf],inits1_closed,options);

Mvals=2e-6:0.1e-6:18e-6;

for mx = 1:length(Mvals)

        M = Mvals(mx);

        M

        inits2_closed=u1_closed(end,:);
        [t2_closed,u2_closed]=ode15s('closedloopM',[tf 2*tf],inits2_closed,options);
        
        inits3_closed=u2_closed(end,:);
        [t3_closed,u3_closed]=ode15s('closedloopM',[2*tf 3*tf],inits3_closed,options);
        
        inits4_closed=u3_closed(end,:);
        [t4_closed,u4_closed]=ode15s('closedloopM',[3*tf 4*tf],inits4_closed,options);
        
        inits5_closed=u4_closed(end,:);
        [t5_closed,u5_closed]=ode15s('closedloopM',[4*tf 5*tf],inits5_closed,options);
        
        inits6_closed=u5_closed(end,:);
        [t6_closed,u6_closed]=ode15s('closedloopM',[5*tf 6*tf],inits6_closed,options);

        inits7_closed=u6_closed(end,:);
        [t7_closed,u7_closed]=ode15s('closedloopM',[6*tf 7*tf],inits7_closed,options);

        inits8_closed=u7_closed(end,:);
        [t8_closed,u8_closed]=ode15s('closedloopM',[7*tf 8*tf],inits8_closed,options);

        inits9_closed=u8_closed(end,:);
        [t9_closed,u9_closed]=ode15s('closedloopM',[8*tf 9*tf],inits9_closed,options);

        inits10_closed=u9_closed(end,:);
        [t10_closed,u10_closed]=ode15s('closedloopM',[9*tf 10*tf],inits10_closed,options);

        inits11_closed=u10_closed(end,:);
        [t11_closed,u11_closed]=ode15s('closedloopM',[10*tf 11*tf],inits11_closed,options);
        
        t_closed=[t2_closed; t3_closed; t4_closed; t5_closed; t6_closed; t7_closed; t8_closed; t9_closed; t10_closed; t11_closed];
        u_closed=[u2_closed; u3_closed; u4_closed; u5_closed; u6_closed; u7_closed; u8_closed; u9_closed; u10_closed; u11_closed];
        
        po2blood11_closed=u11_closed(:,7);
        
        avgIntPO2blood_closed(ix)=trapz(t11_closed,po2blood11_closed)/(t11_closed(end)-t11_closed(1));

        po2blood_hypo = u_closed(:,7);
        po2lung_hypo = u_closed(:,6);
        lungvol_hypo = u_closed(:,5);
        alpha_hypo = u_closed(:,4);
        h_hypo = u_closed(:,3);
        n_hypo = u_closed(:,2);
        v_hypo = u_closed(:,1);

        avgIntPO2blood_hypo(mx)=avgIntPO2blood_closed(ix);

        t_hypo = t_closed-t_closed(1);

end

%% make plot

for ix=1:6
    C(ix,:)=[sin(pi*ix/12),0,cos(pi*ix/12)];
end

figure(1)
hold on
plot(Mvals,avgIntPO2blood_hypo,'Color',C(2,:),'linewidth',5)
h=legend('[Hb] = 250','location','northeast');
legend('boxoff')
set(h,'interpreter','latex')
xlabel('M')
ylabel('PaO2')
set(gca,'XTick',[0.4e-5:.4e-5:1.6e-5])
xlim([.2e-5 18e-6])
ylim([1 140])
xlabel('$M$','Interpreter','latex','FontSize',24)
ylabel('$P_\mathrm{a}\mathrm{O}_2$','Interpreter','latex','Fontsize',24)
grid on