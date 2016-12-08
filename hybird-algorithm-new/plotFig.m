index = 4:4:40;
load('VarE_MAC(UP0-2-4-6,N16)(E_th10)(E_cca1)(M0)(EH2)fix.mat');
figure(1);
plot(index, PS_WBAN);
hold on;

figure(2);
plot(index, ELE_WBAN);
hold on;

figure(3);
plot(index, Pktloss_WBAN);
hold on;

load('VarE_MAC(UP0-2-4-6,N16)(E_th10)(E_cca1)(lambda1.6)(M0)(EH2)resrc.mat');
figure(1);
plot(index, PS_WBAN, '-.');
hold on;

figure(2);
plot(index, ELE_WBAN, '-.');
hold on;

figure(3);
plot(index, Pktloss_WBAN, '-.');
hold on;

load('VarE_MAC(UP0-2-4-6,N16)(E_th10)(E_cca1)(lambda1.6)(delta8)(a3)(b0.5)(M0)(EH2)varyResetChannel.mat');
figure(1);
plot(index, PS_WBAN, '--');
legend('fix', 'resource','hybrid');
grid;
title('packet delivery of WBAN');
xlabel('average energy harvesting rate (nJ/s)');
ylabel('packet delivery');

figure(2);
plot(index, ELE_WBAN, '--');
legend('fix', 'resource', 'hybrid');
grid;
title('energy consumption of WBAN');
xlabel('average energy harvesting rate (nJ/s)');
ylabel('energy consumption');

figure(3);
plot(index, Pktloss_WBAN, '--');
legend('fix', 'resource', 'hybrid');
grid;
title('packet loss of WBAN');
xlabel('average energy harvesting rate (nJ/s)');
ylabel('packet loss');

