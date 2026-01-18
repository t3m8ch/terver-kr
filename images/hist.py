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
