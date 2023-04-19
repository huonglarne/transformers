from transformers import (
    VisionTextDualEncoderModel,
    VisionTextDualEncoderProcessor,
    AutoTokenizer,
    AutoImageProcessor
)

tokenizer = AutoTokenizer.from_pretrained("roberta-base")

# read model_names.txt
with open("model_names.txt", "r") as f:
    model_names = f.read().splitlines()

for line in model_names:
    model_name = line.split()[0]

    print(f"Saving {model_name} ...")

    model = VisionTextDualEncoderModel.from_vision_text_pretrained(
        model_name, "roberta-base"
    )

    image_processor = AutoImageProcessor.from_pretrained(model_name)
    processor = VisionTextDualEncoderProcessor(image_processor, tokenizer)

    # save the model and processor
    model.save_pretrained("models/"+model_name)
    processor.save_pretrained("models/"+model_name)