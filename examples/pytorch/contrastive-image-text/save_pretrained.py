from transformers import (
    VisionTextDualEncoderModel,
    VisionTextDualEncoderProcessor,
    AutoTokenizer,
    AutoImageProcessor
)

model = VisionTextDualEncoderModel.from_vision_text_pretrained(
    "openai/clip-vit-base-patch32", "roberta-base"
)

tokenizer = AutoTokenizer.from_pretrained("roberta-base")

# read model_names.txt
with open("model_names.txt", "r") as f:
    model_names = f.read().splitlines()

for model_name in model_names:
    # load the model and processor
    image_processor = AutoImageProcessor.from_pretrained(model_name)
    processor = VisionTextDualEncoderProcessor(image_processor, tokenizer)

    # save the model and processor
    model.save_pretrained(model_name)
    processor.save_pretrained(model_name)