#!/usr/bin/env python3
from diffusers import StableDiffusionPipeline
import sys
import os
import torch

# Initialize the model pipeline
pipe = StableDiffusionPipeline.from_pretrained(
    "runwayml/stable-diffusion-v1-5",
    torch_dtype=torch.float16
)
pipe = pipe.to("cuda")

def generate_image(prompt: str, output_file: str):
    """
    Generate an image based on the prompt and save it to the specified file.
    """
    image = pipe(prompt).images[0]
    image.save(output_file)
    return output_file

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: ./stable_diffusion_generator.py '<prompt>' '<output_file>'", file=sys.stderr)
        sys.exit(1)

    prompt = sys.argv[1]
    output_file = sys.argv[2]

    if not os.path.exists(os.path.dirname(output_file)):
        os.makedirs(os.path.dirname(output_file))

    try:
        print(generate_image(prompt, output_file))
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)

