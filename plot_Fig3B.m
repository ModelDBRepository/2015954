clear all; close all

jobNumbers = 1:27;
levels = [3 3 3];
doe = fullfact(levels);

for jx=1:length(jobNumbers)

    jobNumber = jobNumbers(jx);
    currSettings = doe(jobNumber,:);

    % set phi
    if currSettings(1)==1
        phi = 0.24;
    end
    if currSettings(1)==2
        phi = 0.3;
    end
    if currSettings(1)==3
        phi = 0.36;
    end  

    % set theta_g
    if currSettings(2)==1
        theta_g = 70;
    end
    if currSettings(2)==2
        theta_g = 85;
    end
    if currSettings(2)==3
        theta_g = 100;
    end  

    % set sigma_g
    if currSettings(3)==1
        sigma_g = 24;
    end
    if currSettings(3)==2
        sigma_g = 30;
    end
    if currSettings(3)==3
        sigma_g = 36;
    end

    Mvals=0.1e-6:0.1e-6:30e-6;
    
    for mx=1:length(Mvals)
    
        M=Mvals(mx);
    
        job=jobNumber; taulb=500; Vol0=2; Hb=150; K=26;
        inFile = sprintf('data_for_Fig3B/job%d_redo_PaO2_M_%s_phi_%s_theta_g_%s_sigma_g_%s_taulb_%s_Hb_%s_Vol0_%s_K_%s_date_1_3_24.csv',job,num2str(M),num2str(phi),num2str(theta_g),num2str(sigma_g),num2str(taulb),num2str(Hb),num2str(Vol0),num2str(K));
        temp = dlmread(inFile);
        data(mx)  = temp(9);
    
    end
    
    pO2(:,jx) = data;

end

maxpo2=max(pO2);

subInds=[1:13 15:27];
maxpo2_sub=maxpo2(subInds);
po2sub=pO2(:,subInds);

[maxpo2_sort, sort_ind]=sort(maxpo2_sub);

po2sub_sort=po2sub(:,sort_ind);

%% make plot

figure(1)
hold on
plot(Mvals,pO2(:,14),'Color',[0.5 0.5 0.5],'linewidth',5)
for ix=1:26
    plot(Mvals,po2sub_sort(:,ix),'Color',[sin(pi*ix/52),0,abs(cos(pi*ix/52))],'linewidth',5)
end
plot(Mvals,pO2(:,14),'Color',[0.5 0.5 0.5],'linewidth',5)
h=legend('default parameters','location','northeast');
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




