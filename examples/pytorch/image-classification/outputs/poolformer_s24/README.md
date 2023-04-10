---
license: apache-2.0
tags:
- image-classification
- vision
- generated_from_trainer
datasets:
- beans
metrics:
- accuracy
model-index:
- name: poolformer_s24
  results:
  - task:
      name: Image Classification
      type: image-classification
    dataset:
      name: beans
      type: beans
      config: default
      split: validation
      args: default
    metrics:
    - name: Accuracy
      type: accuracy
      value: 0.5112781954887218
---

<!-- This model card has been generated automatically according to the information the Trainer had access to. You
should probably proofread and complete it, then remove this comment. -->

# poolformer_s24

This model is a fine-tuned version of [sail/poolformer_s24](https://huggingface.co/sail/poolformer_s24) on the beans dataset.
It achieves the following results on the evaluation set:
- Loss: 1.0310
- Accuracy: 0.5113

## Model description

More information needed

## Intended uses & limitations

More information needed

## Training and evaluation data

More information needed

## Training procedure

### Training hyperparameters

The following hyperparameters were used during training:
- learning_rate: 2e-05
- train_batch_size: 512
- eval_batch_size: 512
- seed: 42
- optimizer: Adam with betas=(0.9,0.999) and epsilon=1e-08
- lr_scheduler_type: linear
- num_epochs: 1.0
- mixed_precision_training: Native AMP

### Training results

| Training Loss | Epoch | Step | Validation Loss | Accuracy |
|:-------------:|:-----:|:----:|:---------------:|:--------:|
| No log        | 1.0   | 3    | 1.0310          | 0.5113   |


### Framework versions

- Transformers 4.28.0.dev0
- Pytorch 2.0.0+cu117
- Datasets 2.9.0
- Tokenizers 0.13.2
