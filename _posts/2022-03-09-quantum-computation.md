---
layout: post
excerpt_separator: <!--more-->
title: Quantum Computation (2022 Spring)
description: Course notes
permalink: quantum-computation/
date: 2022-03-07
tags: [ QC, Course-notes ]
---

## Lecture 2

### **Quantum Parallelism**

给定函数 $f : \\{0,1\\}^n \rightarrow \\{0,1\\}$ 和输入 $x \in \\{0,1\\}^n$, 计算 $f(x)$.

$f$ 可以以酉矩阵 $U_f$ 的形式给出:

![](/images/Uf.png?stype=centerme){: width="40%"}

对 $n = 1$, 将 $\psi = \dfrac{1}{\sqrt{2}} \sum_{x\in \\{0,1\\}} \|x\rangle$ 和 $\|0\rangle$ 作为输入, 用 $U_f$ 作用在输入上:

$$U_f\left(\dfrac{1}{\sqrt{2}}(|00\rangle + |10\rangle)\right) = \dfrac{1}{\sqrt{2}}(|0,f(0)\rangle + |1,f(1)\rangle),$$

其中 $\psi$ 可以通过将 $H$ 作用在 $\|0\rangle$ 上获得.

更一般地, 考虑将 $\psi = \dfrac{1}{\sqrt{2^n}}\sum\limits_{x\in \\{0,1\\}^n} \|x\rangle$ 和 $\|0\rangle$ 作为输入, 得到:

$$U_f\dfrac{1}{\sqrt{2^n}}\sum\limits_{x\in \{0,1\}^n} |x,0\rangle = \dfrac{1}{\sqrt{2^n}}\sum\limits_{x\in \{0,1\}^n} |x,f(x)\rangle,$$

其中 $\psi = \underbrace{H\|0\rangle \otimes \dots \otimes H\|0\rangle}_{n \text{ } H\|0\rangle } = H^{\otimes n} \|0^n\rangle$

### **Store the query in phase**

考虑将 $f(x)$ 存储在相位中:

$$U_f|x\rangle | - \rangle = (-1)^{f(x)} |x\rangle |- \rangle.$$

例如, 若 $f(x) = 0$, 则

$$U_f |x\rangle | - \rangle = \dfrac{1}{\sqrt{2}} U_f |x\rangle (| 0 \rangle - | 1 \rangle) = \dfrac{1}{\sqrt{2}} |x\rangle (| 0 \rangle - | 1 \rangle) = | x \rangle |- \rangle.$$

为方便, 令 $O_f \|x \rangle = (-1)^{f(x)} \| x\rangle$.


### **Deutsch-Jozsa Algorithm**

给定函数 $f : \\{0,1\\}^n \rightarrow \\{0,1\\}$, 且 $f$ 要么是 constant 的, 要么是 balanced 的. 称 $f$ 是 balanced 的, 若 $\|f^{-1} (0)\| = \|f^{-1} (1)\| = 2^{n-1}$. 判定 $f$ 是否 constant.

令 $n = 1$, 即判定是否有 $f(0) = f(1)$. 经典计算需要两次查询, 而量子计算 (<a href="https://royalsocietypublishing.org/doi/pdf/10.1098/rspa.1985.0070">Deutsch '85</a>) 只需要一次.

![](/images/deutsch.png?stype=centerme){: width="40%"}

其中:
- $\|\psi_1\rangle = \| + \rangle$
- $\|\psi_2\rangle = \dfrac{(-1)^{f(0)}\|0 \rangle + (-1)^{f(1)}\|1 \rangle}{\sqrt{2}} \sim \dfrac{\|0 \rangle + (-1)^{f(0) + f(1)}\|1 \rangle}{\sqrt{2}} = H \|[f(0)\ne f(1)]\rangle$
- $\|\psi_3\rangle = H \|\psi_2\rangle = \|[f(0)\ne f(1)]\rangle$

更一般地, 对 $n > 1$ 考虑如下算法.

![](/images/deutsch-jozsa.png?stype=centerme){: width="40%"}

其中:
- $\|\psi_1\rangle = \dfrac{1}{\sqrt{2^n}}\sum\limits_{x\in \\{0,1\\}^n} \|x\rangle$
- $\|\psi_2\rangle = \dfrac{1}{\sqrt{2^n}}\sum\limits_{x\in \\{0,1\\}^n} (-1)^{f(x)}\|x\rangle$
- $\|\psi_3\rangle = \dfrac{1}{2^n}\sum\limits_{x,z\in \\{0,1\\}^n} (-1)^{f(x) + x {\cdot} z}\|z\rangle$

对 $n = 1$, $H \| x \rangle = \dfrac{1}{\sqrt{2}} \sum\limits_{z \in \\{0,1\\}} (-1)^{x{\cdot}z} \|z \rangle$.

对 $n > 1$, $H^{\otimes n} \|x \rangle = H \| x_1 \rangle \otimes {\cdots} \otimes H \| x_n \rangle = \dfrac{1}{\sqrt{2^n}} \sum\limits_{z \in \\{0,1\\}^n} (-1)^{x{\cdot}z} \|z \rangle$. 进而有 $\|\psi_3 \rangle$.

若 $f$ 是 constant 的, 则 $\|\psi_3 \rangle = \|0 \rangle$.

设 $f$ 是 balanced 的. 考虑用 $\\{M_z\\}_{z\in\\{0,1\\}^n}$ 进行测量, 其中 $M_z = \|z \rangle \langle z \|$, 则测量结果永远不会为 $\|0 \rangle$. 一个证据是 $\langle 0^n \| \psi_3 \rangle = 0$.

因此用 $\\{M_z\\}_{z\in\\{0,1\\}^n}$ 进行测量即可完成判定.