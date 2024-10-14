clc
clear
% image = imread("grayscale.jpg")


sigma = 10
x = linspace(-10*sigma, 10*sigma, 400)
g1 = exp(-x.^2/(2*sigma^2))/sqrt(2*pi*sigma^2);

%plot(x, g,'r*')  %r red anlamına geliyormuş %r olunca cizgi şeklinde r* olunca kesikli gösteriyor grafiği

plot(x, g1,'r*', 'LineWidth',5) % yıldızlar kalınlaştı. çizgi genişliği arttı

% bu gausian şimdi box filter(elektrik 0-1 gragiği gibi) oluşturacağız. sonra oluşturduğumuz filter ı
% image a uygulayacağız
% n kez box filter uygularsak = 1 gausian uygulamış gibi oluruzz

%box filter yapma!!

N=5;
b = sqrt((12*sigma^2)/N);
box = double(abs(x)<b/2)*1/b;

g2 = box;

for n =2:N
    conv(g2, box, "same");
end

% figure(1)
% plot(x, g1,'r*', 'LineWidth',5) %gausian
% figure(2)
% hold on

% plot(x, g2, "go") % box filter
% figure(3)

% hold on
% plot(x, box, 'LineWidth',5) % box filter

% bu yazdığımız box filterı n kez uygulayacağız ve gausian filter elde
% edeceğiz

img = imread("grayscale.jpg")
img1 = imfilter(img, g1, "replicate");
imshow(uint8(img1))
%%
Gauisan = fspecial('gaussian', ...
    [10*sigma+1, 10*sigma+1], sigma);
img = imfilter(img, Gauisan, "replicate");
imshow(uint8(img))
title('Filtered Image');

% control + r -> a basarsan, seçili tüm alan, yorum satırına döner


% şimdi for döngüsünde box filter ı görüntüye uygulayalalım.

