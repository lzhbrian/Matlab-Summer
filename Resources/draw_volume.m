close all;
figure;
subplot(3,1,1);generate_volume(1,8000);title('len = 1')
subplot(3,1,2);generate_volume(1/2,8000);title('len = 0.5')
subplot(3,1,3);generate_volume(1/4,8000);title('len = 0.25')