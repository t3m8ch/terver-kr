#import "conf.typ": conf, intro, conclusion
#show: conf.with(
  title: [Вариант 10],
  type: "referat",
  info: (
    author: (
      name: [Кудякова Артёма Александровича],
      faculty: [КНиИТ],
      group: "351",
      sex: "male",
    ),
    inspector: (
      degree: "",
      name: "",
    ),
  ),
  settings: (
    title_page: (
      enabled: true,
    ),
    contents_page: (
      enabled: true,
    ),
  ),
)

= КР
Имеются статистические данные о трудоёмкости операции ($x_i$, мин) ремонта
валика водяного насоса ($n_i$ --- число валиков)
#align(center, [
  #table(
    columns: 6,
    $x_i$, $0-10$, $10-20$, $20-30$, $30-40$, $40-50$,

    $n_i$, $16$, $48$, $70$, $47$, $19$
  )
])

#pagebreak()

== Построить гистограмму и полигон частот

=== Гистограмма
#align(center, [
  #image("images/1.png", height: 30%)
])

==== Python-код для генерации гистограммы
```py
import matplotlib.pyplot as plt

x_i = [0, 10, 20, 30, 40, 50]
n_i = [16, 48, 70, 47, 19]
x_i_mids = [5, 15, 25, 35, 45]

plt.figure(figsize=(10, 6))
plt.bar(
    x_i_mids,
    n_i,
    width=10,
    color="skyblue",
    edgecolor="black",
    alpha=0.6,
    label="Гистрограмма",
)

plt.xlabel("Интервалы (x_i)")
plt.ylabel("Частоты (n_i)")
plt.title("Гистограмма")
plt.xticks(x_i)
plt.legend()
plt.grid(axis="y", alpha=0.5)

plt.savefig("1.png", dpi=100)
```

=== Полигон
#align(center, [
  #image("images/2.png", height: 30%)
])

==== Python-код для генерации полигона
```py
import matplotlib.pyplot as plt

x_i = [0, 10, 20, 30, 40, 50]
n_i = [16, 48, 70, 47, 19]
x_i_mids = [5, 15, 25, 35, 45]

plt.figure(figsize=(10, 6))
plt.plot(
    x_i_mids,
    n_i,
    marker="o",
    linestyle="-",
    color="red",
    linewidth="2",
    label="Полигон",
)

plt.xlabel("Центры интервалов (x_i)")
plt.ylabel("Частоты (n_i)")
plt.title("Полигон")
plt.xticks(x_i_mids)
plt.legend()
plt.grid(axis="y", alpha=0.5)

plt.savefig("2.png", dpi=100)
```

#pagebreak()

== Записать эмпирическую функцию распределения и построить её график

=== Вычисление знаменателя

$ limits(sum)_(i=1)^5 n_i = 16 + 48 + 70 + 47 + 19 = 200 $

=== Вычисление значений эмпирической функции распределения

$
  0 / 200 = 0 \
  16 / 200 = 0.08 \
  (16 + 48) / 200 = 0.32 \
  (16 + 48 + 70) / 200 = 0.67 \
  (16 + 48 + 70 + 47) / 200 = 0.905 \
  (16 + 48 + 70 + 47 + 19) / 200 = 1
$

=== Эмпирическая функция распределения

$
  limits(F_n)^~ = cases(
    0\,         & quad x lt.eq 10,
    16 / 200\,  & quad 10 < x lt.eq 20,
    64 / 200\,  & quad 20 < x lt.eq 30,
    134 / 200\, & quad 30 < x lt.eq 40,
    181 / 200\, & quad 40 < x lt.eq 50,
    1\,         & quad x > 50
  ) = cases(
    0\,         & quad x lt.eq 10,
    0.08\,      & quad 10 < x lt.eq 20,
    0.32\,      & quad 20 < x lt.eq 30,
    0.67\,      & quad 30 < x lt.eq 40,
    0.905\,     & quad 40 < x lt.eq 50,
    1\,         & quad x > 50
  )
$

=== График эмпирической функции распределения

#image("images/3.png")

Код для рисования графика приведён в приложении @efrcode.

== Определить числовые характеристики вариационного ряда: $overline(x), S^2, S, accent(sigma, ~)^2, accent(sigma, ~)$

=== Выборочное среднее:
$
  overline(x) = 1 / 200
    dot ( 5 dot 16
        + 15 dot 48
        + 25 dot 70
        + 35 dot 47
        + 45 dot 19 ) = 25.25
$

==== Haskell-код для вычисления выборочного среднего
```
ghci> xi_mids = [5, 15, 25, 35, 45]
ghci> ni = [16, 48, 70, 47, 19]
ghci> (1 / 200) * (sum $ zipWith (*) xi_mids ni)
25.25
```

=== Выборочная дисперсия (смещенная оценка дисперсии):
$
  S^2 = 1 / 200
    dot ( 5^2 dot 16
        + 15^2 dot 48
        + 25^2 dot 70
        + 35^2 dot 47
        + 45^2 dot 19 ) - 25.25 = \ = 729.75
$

==== Haskell-код для вычисления выборочной дисперсии
```
ghci> xi_mids = [5, 15, 25, 35, 45]
ghci> ni = [16, 48, 70, 47, 19]
ghci> x = (1 / 200) * (sum $ zipWith (*) xi_mids ni)
ghci> (1 / 200) * (sum $ zipWith (*) (map (** 2) xi_mids) ni)
729.75
```

=== Выборочная дисперсия (несмещенная оценка дисперсии):
$
  accent(sigma, ~)^2 = 200 / 199 dot 729.75 approx 733.42
$

=== Выборочное среднее квадратичное отклонение (смещенное)
$
  S = sqrt(729.75) approx 27.01
$

=== Выборочное среднее квадратичное отклонение (несмещенное)
$
   accent(sigma, ~) approx sqrt(733.42) approx 27.08
$

== Предполагая нормальным распределение генеральной совокупности, построить доверительные интервалы надежности $0.95$ и $0.99$ для параметров нормального распределения.
Интервал имеет вид $overline(x) - t_gamma sigma / sqrt(n) < a < overline(x)
+ t_gamma sigma / sqrt(n)$.

Имеем $sqrt(n) = sqrt(200) approx 14.14, quad overline(x) = 25.25, quad sigma approx 27.08$.

Тогда при $gamma = 0.95; space t_gamma = 1.960$.

$
  [25.25 - (1.960 dot 27.08) / 14.14; 25.25 + (1.960 dot 27.08) / 14.14]
    approx [21.5; 29]
$

Тогда при $gamma = 0.99; space t_gamma = 2.576$

$
  [25.25 - (2.576 dot 27.08) / 14.14; 25.25 + (2.576 dot 27.08) / 14.14]
    approx [20.32; 30.18]
$

#pagebreak()

== Критериями Пирсона и Колмогорова при уровне значимости $0.05$ проверить гипотезу о нормальном распределении наблюдаемой случайной величины.
#align(center, [
  #table(
    columns: 4,
    table.header(
      table.cell(rowspan: 2, stroke: (
        bottom: 0pt,
      ))[*Номер\ интервала $i$*],
      table.cell(colspan: 2, rowspan: 2)[*Граница\ интервала*],
      table.cell(rowspan: 2, stroke: (
        bottom: 0pt,
      ))[*Частота\ $n_i$*],
      [], [$x_i$], [$x_(i+1)$],
    ),

    $1$, $0$,  $10$, $16$,
    $2$, $10$, $20$, $48$,
    $3$, $20$, $30$, $70$,
    $4$, $30$, $40$, $47$,
    $5$, $40$, $50$, $19$,
  )
])

$
  z_i = (x_i - overline(x)) / sigma = (x_i - 25.25) / 27.08
$

#align(center, [
  #table(
    columns: 9,
    rows: (auto, auto, 23pt, auto),
    table.header(
      table.cell(colspan: 2, rowspan: 2)[*Граница\ интервала*],
      table.cell(rowspan: 2, stroke: (
        bottom: 0pt,
      ))[*Частота\ $n_i$*],
      table.cell(colspan: 2, rowspan: 2)[*Граница\ интервала*],
      table.cell(rowspan: 2, stroke: (
        bottom: 0pt,
      ))[],
      table.cell(rowspan: 2, stroke: (
        bottom: 0pt,
      ))[],
      table.cell(rowspan: 2, stroke: (
        bottom: 0pt,
      ))[],
      table.cell(rowspan: 2, stroke: (
        bottom: 0pt,
      ))[],

      [$x_i$], [ $x_(i + 1)$],
      [],
      [$z_i$], [$z_(i + 1)$],
      [$Phi (z_i)$], [$Phi (z_(i + 1))$],
      [$P_i$], [$n'_i$],
    ),

    $0 $, $10$, $16$, $-oo  $, $-0.56$, $-0.5  $, $-0.212$, $0.288$, $57.6$,
    $10$, $20$, $48$, $-0.56$, $-0.19$, $-0.212$, $-0.075$, $0.137$, $27.4$,
    $20$, $30$, $70$, $-0.19$, $0.18 $, $-0.075$, $0.071 $, $0.004$, $0.8 $,
    $30$, $40$, $47$, $0.18 $, $0.54 $, $0.071 $, $0.205 $, $0.276$, $55.2$,
    $40$, $50$, $19$, $0.54 $, $+oo  $, $0.205 $, $0.5   $, $0.295$, $59  $,
  )
])


#align(center, [
  #table(
    columns: 4,
    rows: (25pt, auto),
    table.header(
      $accent(F_0, ~) (x)$,
      $accent(F, ~)_n (x)$,
      $|accent(F_0, ~) (x) - accent(F, ~)_n (x)|$,
      $(n_i - n'_i)^2 / n_i$
    ),
    $0.288$, $0.08 $, $0.208$, $108.16$,
    $0.425$, $0.32 $, $0.105$, $8.841$,
    $0.429$, $0.67 $, $0.241$, $68.409$,
    $0.705$, $0.905$, $0.2  $, $1.431$,
    $1    $, $1    $, $0    $, $84.211$,
  )
])


*Критерий колмогорова*

$alpha = 0.05$

по приложению 9

$
  D_#[кр] = D(0.05; 50) = 0.188\
  D_#[набл] = max |accent(F_0, ~) (x) - accent(F, ~)_n (x)| = 0.099
$

т.к. $D_#[набл] < D_#[кр]$, то гипотезу принимаем.

*Критерий Пирсона*
$
  chi^2_#[набл] = 0.19 + 1.84 + 0.20 + 0.05 + 0.28 + 5.07 = 7.63\
  chi^2_#[кр] = (0.05; 3 - 3) = 7.8
$

т.к. $chi^2_#[набл] < chi^2_#[кр]$, то гипотезу принимаем.

= Приложения

== Python-код для рисования графика эмпирической функции распределения <efrcode>

```py
import matplotlib.pyplot as plt

x_i = [2.5, 7.5, 12.5, 17.5, 22.5, 24.5]
f_n = [15 / 50, 27 / 50, 36 / 50, 43 / 50, 47 / 50, 1]

plt.figure(figsize=(10, 6))

plt.hlines(y=0, xmin=0, xmax=x_i[0], colors="black", linewidth=2)

for i in range(len(x_i)):
    if i < len(x_i) - 1:
        plt.hlines(
            y=f_n[i],
            xmin=x_i[i],
            xmax=x_i[i + 1],
            colors="black",
            linewidth=2,
        )
    else:
        plt.hlines(y=f_n[i], xmin=x_i[i], xmax=30, colors="black",
                   linewidth=2)

for i in range(len(x_i)):
    plt.plot(
        x_i[i],
        f_n[i],
        marker="o",
        markersize=8,
        color="black",
        markerfacecolor="black",
    )

    if i > 0:
        plt.plot(
            x_i[i],
            f_n[i - 1],
            marker="o",
            markersize=8,
            color="black",
            markerfacecolor="white",
            markeredgewidth=2,
        )
```

```py
plt.plot(
    0,
    0,
    marker="o",
    markersize=8,
    color="black",
    markerfacecolor="white",
    markeredgewidth=2,
)

plt.xlabel("$x_i$", fontsize=12)
plt.ylabel("$F_n$", fontsize=12)
plt.title("Эмпирическая функция распределения")
plt.xlim(-1, 30)
plt.ylim(-0.05, 1.1)
plt.grid(True, alpha=0.3)
plt.axhline(y=0, color="black", linewidth=0.5)
plt.axvline(x=0, color="black", linewidth=0.5)

plt.savefig("3.png", dpi=100)
```
