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
