"""
$ source env/bin/activate
$ export PATH=$PATH:/opt/homebrew/bin # for the 'tesseract' binary
$ python quartiles.py

"""

import pytesseract
from PIL import Image

def extract_text_from_image(image_path):
    """Extracts text from an image using PyTesseract.

    Args:
        image_path: Path to the image file.

    Returns:
        Extracted text.
    """

    img = Image.open(image_path)
    text = pytesseract.image_to_string(img)
    return text

# Example usage:
image_path = '/Users/swain/Desktop/quartiles-11-16-2024.png'
extracted_text = extract_text_from_image(image_path)
print(extracted_text)

