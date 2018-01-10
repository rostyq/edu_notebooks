rdf = [read_rdf(f'./out/exp_{i}.rdf') for i in range(2)]

plt.subplots(figsize=(10, 5))
for i in range(2):
    rdf[i]['count'].plot(label=f'$T = {T[i]:.0f}\,K$')

plt.plot([0, 7], [1, 1], color='black')
plt.xlim((2, 7))
    
plt.legend()
plt.xticks(bins, rotation=55)
plt.xlabel('Відстань, Å')
plt.ylabel("$g(r)$")
plt.show()