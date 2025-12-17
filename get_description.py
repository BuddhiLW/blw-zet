#!/usr/bin/env python3
import sys
import os
from openai import OpenAI

# Get the input text from stdin
content = sys.stdin.read().strip()

# Fallback for default description
default_description = "default description"

# Check if the input content is empty
if not content:
    print(default_description)
    sys.exit(0)

# Initialize the OpenAI client
client = OpenAI(
    api_key=os.environ.get("OPENAI_API_KEY")  # Reads the API key from the environment
)

# Define the prompt for summarization
prompt = f"Summarize this content in one sentence:\n\n{content}"

try:
    # Make a request to generate a completion
    response = client.chat.completions.create(
        model="gpt-4",  # You can use "gpt-3.5-turbo" for lower-cost summarization
        messages=[
            {
                "role": "system",
                "content": "You are a helpful assistant that summarizes text in one concise sentence.",
            },
            {"role": "user", "content": prompt},
        ],
        max_tokens=50,
        temperature=0.7,
    )

    # Extract and print the summary
    summary = response.choices[0].message.content.strip()
    print(summary)
except Exception as e:
    # Handle exceptions gracefully and print the default description
    print(f"Error: {e}", file=sys.stderr)
    print(default_description)
