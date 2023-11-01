# ---
# jupyter:
#   jupytext:
#     formats: ipynb,py:percent
#     text_representation:
#       extension: .py
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.15.2
#   kernelspec:
#     display_name: Python 3 (ipykernel)
#     language: python
#     name: python3
# ---

# %%
import torch
import pandas as pd
import numpy as np

# %% [markdown]
# # Create tensors

# %% [markdown]
# ## From Numpy array

# %%
a = np.random.rand(5, 3)
a

# %%
x = torch.tensor(a)
x

# %% [markdown]
# ## From lists

# %%
l = a.tolist()
l

# %%
x = torch.tensor(l)
x

# %% [markdown]
# ## Constants

# %%
x = torch.ones([6, 3])   # Syntax 1
x

# %%
x = torch.ones(6, 3)   # Syntax 2
x

# %%
x = torch.zeros([6, 3])   # Syntax 1
x

# %%
x = torch.zeros(6, 3)   # Syntax 2
x

# %% [markdown]
# ## Clone

# %%
y = torch.clone(x)
y

# %% [markdown]
# ## Uniform distribution

# %%
x = torch.rand([10000, 3])   # Syntax 1
x

# %%
x = torch.rand(10000, 3)   # Syntax 2
x

# %%
pd.DataFrame(x).hist();

# %% [markdown]
# ## Uniform distribution of integers

# %%
x = torch.randint(low=0, high=100, size=[10000, 3])   # Syntax 1
x

# %%
pd.DataFrame(x).hist();

# %% [markdown] jp-MarkdownHeadingCollapsed=true
# ## Normal distribution

# %%
x = torch.randn([10000, 3])   # Syntax 1
x

# %%
x = torch.randn(10000, 3)   # Syntax 2
x

# %%
pd.DataFrame(x).hist();

# %% [markdown] jp-MarkdownHeadingCollapsed=true
# # Dimensionality

# %% [markdown]
# ## Get tensor dimensions

# %%
x = torch.rand(6, 3)
x

# %%
x.size()

# %% [markdown]
# ## Concatenate tensors

# %%
x1 = torch.rand(2, 4)
x1

# %%
x2 = torch.rand(2, 4)
x2

# %%
x = torch.cat((x1, x2), dim=0)
x

# %%
x = torch.cat((x1, x2), dim=1)
x

# %% [markdown]
# ## Reshape tensors

# %%
x.view(8, 2)

# %%
x.view(-1, 2)

# %%
x.view(8, -1)

# %% [markdown]
# ## Swap dimensions a and b

# %%
x = torch.rand(2, 3, 4)
x

# %%
x.transpose(0, 1)

# %%
x.transpose(0, 2)

# %% [markdown]
# ## Permute dimensions a and b

# %%
x = torch.rand(2, 3, 4)
x

# %%
x.permute(2, 1, 0)

# %% [markdown]
# ## Squeeze and unsqueeze

# %% [markdown]
# ### Remove all dimensions of size 1

# %%
x = torch.rand(2, 1, 4, 1)
x

# %%
x.size()

# %%
y = x.squeeze()
y

# %%
y

# %%
y.size()

# %% [markdown]
# ### Remove specified dimensions of size 1

# %%
x = torch.rand(2, 1, 4, 1)
x

# %%
x.size()

# %%
y = x.squeeze(dim=1)
y

# %%
y

# %%
y.size()

# %% [markdown]
# ### Add a dimension

# %% [markdown]
# #### First example

# %%
y

# %%
y.size()

# %%
x = y.unsqueeze(dim=1)
x

# %%
x.size()

# %% [markdown]
# #### Second example

# %%
x = torch.tensor([1, 2, 3, 4])
x

# %%
torch.unsqueeze(x, 0)

# %%
torch.unsqueeze(x, 1)

# %% [markdown]
# # Algebra

# %% [markdown]
# ## Matrix transpose

# %%
A = torch.rand(4, 2)
A

# %%
A.t()

# %% [markdown]
# ## Matrix multiplication

# %%
A = torch.rand(3, 2)
A

# %%
B = torch.rand(3, 2)
B

# %%
A.mm(B.t())

# %% [markdown]
# ## Matrix vector multiplication

# %%
A = torch.rand(3, 2)
A

# %%
v = torch.rand(2)
v

# %%
A.mv(v)
