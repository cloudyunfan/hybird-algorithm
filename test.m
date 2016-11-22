clc;
clear all;
for lambda = 1 : 3
for i = 1 : 3
    slotNO_of_sp(i,:) = i*ones(1,3);

end 
    save(strcat([num2str(lambda), '.mat']), 'slotNO_of_sp');
end
load(num2str(1));