import matplotlib.pyplot as plt

x_i = [10, 20, 30, 40, 50]
f_n = [0.08, 0.32, 0.67, 0.905, 1.0]

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
        plt.hlines(y=f_n[i], xmin=x_i[i], xmax=60, colors="black", linewidth=2)

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
plt.xlim(-1, 60)
plt.ylim(-0.05, 1.1)
plt.grid(True, alpha=0.3)
plt.axhline(y=0, color="black", linewidth=0.5)
plt.axvline(x=0, color="black", linewidth=0.5)

plt.savefig("3.png", dpi=100)
