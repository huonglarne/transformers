import torch

attn_probs = torch.rand(2, 3).cuda()

max_num_global_attn_indices = torch.tensor(2).cuda()

attn_probs_without_global = attn_probs.narrow(
                -1, max_num_global_attn_indices, attn_probs.size(-1) - max_num_global_attn_indices
            )