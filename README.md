# test
A dummy repo to test workflows and other things as well


Test markdown

# Union Find Disjoint Set

$$
log*n = \begin{cases}
	0 &\text{if } n <= 1 \\
	1 + log*(log(n)) &\text{if } n > 1 
\end{cases}
$$

O(log*n) is almost O(1) level ( not as fast as O(1) ), but much faster than O(log n).

```cpp

struct UFDS {
	vector<int> f, siz;
	UFDS(int n) : f(n), siz(n, 1) { iota(f.begin(), f.end(), 0); }
	int leader(int x) {
		while(x != f[x]) x = f[x] = f[f[x]];
		return x;
	}
	bool same(int x, int y) { return leader(x) == leader(y); }
	bool merge(int x, int y) {
		x = leader(x);
		y = leader(y);
		if (x == y)
			return false;
		siz[x] += siz[y];
		f[y] = x;
		return true;
	}
	int size(int x) { return siz[leader(x)]; }
};

```
