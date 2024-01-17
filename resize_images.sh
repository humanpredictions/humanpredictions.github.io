#!/bin/bash

# Set the input and output directories
input_directory="input_images"
output_directory="output_images"

# Create the output directory if it doesn't exist
mkdir -p "$output_directory"

# Process each image in the input directory
for file in "$input_directory"/*.jpg; do
    if [ -f "$file" ]; then
        filename=$(basename -- "$file")
        filename_without_extension="${filename%.*}"

        convert "$file" -resize 800x800\> -quality 50 "$output_directory/$filename_without_extension"_resized.jpg

        echo "Processed: $filename"
    fi
done

echo "Image processing complete."
