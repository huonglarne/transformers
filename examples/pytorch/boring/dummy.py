import torch

from torch.nn.modules.activation import MultiheadAttention

self_attn = torch.load('self_attn.pt')

x = torch.load('x.pt')

attn_mask = torch.load('attn_mask.pt')

output, _ = self_attn(x, x, x, attn_mask=attn_mask, key_padding_mask=None)
