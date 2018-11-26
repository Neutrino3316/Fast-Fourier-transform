%2018.11.23
%数图小队FTT：运用各种函数实现FTT快速算法已经评估分析
%本文件是主文件函数，通过调用内置的FTT进行图像的处理，并且记录时间
%文件还有其余的函数，需要大家去实现。
%实现的要求和输入输出接口已定义，暂时还没有加入评估函数。。回去修改一下

%读取图像并且转化成灰度图，如果没有，傅里叶变换效果会是白底
Img = imread('1.jpg');
Img = rgb2gray(Img);

%傅里叶变换之后的图像矩阵，记为F_img
F_img = fft2(Img);

% F_img2 = Cooley_base2(Img);
% 基2算法

% F_img3 = Cooley_base4(Img);
% 基4算法



%将零频分量移动到输出的中心
F_img = abs(fftshift(F_img));

%利用对数函数对傅里叶函数的数值进行转换，压缩动态范围
%Matlab_FTT意为内置的FTT
Matlab_FTT = log(F_img + 1);

figure;
imshow(Matlab_FTT,[]);

