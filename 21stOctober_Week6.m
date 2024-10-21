clc
clear
 h = [0 1 0; 1 -4 1; 0 1 0];

% Lauplasian - Gausian Function (3D) (2 Kere Gausian - Türevin Türevi)

% [H wx wy] = freqz2(h, [64 64]);
% 
% wx=wx*pi;
% wy=wy*pi;
% 
% [X Y]=meshgrid(wx,wy);
% 
% axes('Parent',figure,'FontSize',12);
% 
% mesh(X/pi, Y/pi, abs(H));
% 
% xlim([-1 1]), ylim([-1 1]);
% 
% xlabel('\omegaX/\pi'), ylabel('H');
% 
% set(gca, 'XTick', -1:0.5:1, 'YTick', -1:0.5:1) % -1 den başla, 0.5 lik adımlarla ilerle 1 e kadar

% Filter ı Görüntüye Uygulama - Horizantal, Vertical

img = double(imread("grayscale.jpg"));
% h=fspecial('prewitt');
h1 = [1 0 -1; 1 0 -1; 1 0 -1];

filteredIMG1 = imfilter(img, h1, 'replicate');
filteredIMG1 = abs(filteredIMG1);
filteredIMG1 = filteredIMG1/max(filteredIMG1(:));

h2 = [1 1 1; 0 0 0; -1 -1 -1]
filteredIMG2 = imfilter(img, h2, 'replicate');
filteredIMG2 = abs(filteredIMG2);
filteredIMG2 = filteredIMG2/max(filteredIMG2(:));

figure(1),clf;
subplot(131),imshow(uint8(img)),title('Original Image');
subplot(132),imshow((filteredIMG1)),title('Prewitt Horizontal');
subplot(133),imshow((filteredIMG2)),title('Prewitt Vertical');
