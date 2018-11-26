# FTT 快速傅里叶变换 任务框架

## 项目要求

###  一、阅读材料：

- [FTT维基中文](https://zh.wikipedia.org/wiki/%E5%BF%AB%E9%80%9F%E5%82%85%E9%87%8C%E5%8F%B6%E5%8F%98%E6%8D%A2)

- [FTT维基英文](https://en.wikipedia.org/wiki/Fast_Fourier_transform)

- [库利-图基算法英文](https://en.wikipedia.org/wiki/Cooley%E2%80%93Tukey_FFT_algorithm)

###  二、实验架构：

- 最低要求：matlab实现二维基-2 库利图基算法、从理论与实操两方面分析算法复杂度、分析内置FTT的复杂度。
- 基础要求：实现课本的逐次加倍法、实现二维基-4 库利图基算法、评估比较四种方法。
- 拔高要求：介绍中国剩余定理、Rader-Brenner算法、Winograd算法

### 三、评估模型：

输入为一张图像，输出图像的傅里叶变换矩阵。

评估标准：

1. 衡量计算时间
2. 评估算法与普通DFT的准确度
3. 利用监视窗口查看空间复杂度



# 实验进度

- [x] 框架
- [ ] Cooley–Tukey FFT algorithm base 2
    - [x] 初稿
    - [ ] debug
- [ ] Cooley–Tukey FFT algorithm base 4
- [ ] 评估比较

## TODO

```matlab
F_img = fft2(Img);
F_img = Cooley_base2(Img);
```

第一行不会报错，但是第二行会报错。

```
错误使用  .* 
不支持复整数算术运算。

出错 Cooley_base2>myfft (line 31)
    F(1:K) = F_even + F_odd .* W;

出错 Cooley_base2>myfft (line 27)
    F_even = myfft(f_even);

出错 Cooley_base2>myfft (line 27)
    F_even = myfft(f_even);

出错 Cooley_base2>myfft (line 27)
    F_even = myfft(f_even);

出错 Cooley_base2>myfft (line 27)
    F_even = myfft(f_even);

出错 Cooley_base2>myfft (line 27)
    F_even = myfft(f_even);

出错 Cooley_base2>myfft (line 27)
    F_even = myfft(f_even);

出错 Cooley_base2>myfft (line 27)
    F_even = myfft(f_even);

出错 Cooley_base2 (line 5)
        F(i, 1:N) = myfft(f(i, 1:N));

出错 main (line 14)
F_img = Cooley_base2(Img);
```

