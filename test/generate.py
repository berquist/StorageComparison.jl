"""generate.py: Generate reference data for tests using NumPy."""

from pathlib import Path

import numpy as np

shape = (2, 3, 1, 2)
# len = np.prod(shape)

a = 0
b = 10

np.save("b_py.npy", b)

rng = np.random.default_rng()

x_path = Path("x_py.npy")
if not x_path.exists():
    x = rng.uniform(low=a, high=b, size=shape)
    np.save(x_path, x)

y_path = Path("y_py.npy")
if not y_path.exists():
    y = rng.integers(low=a, high=b, size=shape)
    np.save(y_path, y)
