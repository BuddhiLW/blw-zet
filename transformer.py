from transformers import pipeline

def sanitize_text(text, max_length=1024):
    # Remove invalid characters
    sanitized = ''.join([c for c in text if c.isprintable()])
    # Truncate text to the max token limit of the model
    return sanitized[:max_length]

# Load a summarization pipeline
summarizer = pipeline("summarization", model="facebook/bart-large-cnn")

def summarize_text(text: str) -> str:
    text = sanitize_text(text, max_length=1024)
    summary = summarizer(text, max_length=50, min_length=5, do_sample=False)
    return summary[0]["summary_text"]

if __name__ == "__main__":
    import sys
    content = sys.stdin.read().strip()
    if not content:
        print("default description")
    else:
        print(summarize_text(content))

