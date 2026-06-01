#!/usr/bin/env python3
"""Render terminal output as PNG for lab3 report screenshots."""
import subprocess
import sys
from pathlib import Path

try:
    from PIL import Image, ImageDraw, ImageFont
except ImportError:
    subprocess.check_call([sys.executable, "-m", "pip", "install", "pillow", "-q"])
    from PIL import Image, ImageDraw, ImageFont


def render_output(title: str, output: str, out_path: Path) -> None:
    lines = [title, ""] + output.rstrip().splitlines()
    font_size = 18
    try:
        font = ImageFont.truetype("/System/Library/Fonts/Menlo.ttc", font_size)
    except OSError:
        font = ImageFont.load_default()

    line_height = font_size + 6
    width = 1100
    height = max(300, 40 + line_height * len(lines))
    img = Image.new("RGB", (width, height), color=(30, 30, 30))
    draw = ImageDraw.Draw(img)

    y = 20
    for i, line in enumerate(lines):
        color = (100, 200, 255) if i == 0 else (220, 220, 220)
        draw.text((20, y), line, fill=color, font=font)
        y += line_height

    img.save(out_path)
    print(f"Saved {out_path}")


def run_lisp(script: Path, title: str, out_png: Path) -> None:
    result = subprocess.run(
        ["sbcl", "--script", str(script)],
        capture_output=True,
        text=True,
        check=False,
    )
    output = result.stdout
    if result.stderr.strip():
        output += "\n" + result.stderr.strip()
    render_output(title, output, out_png)


if __name__ == "__main__":
    base = Path(__file__).resolve().parent
    tasks = [
        ("task2_1.lisp", "Задание 2.1 — sbcl --script task2_1.lisp", "screenshot_task21.png"),
        ("task2_2.lisp", "Задание 2.2 — sbcl --script task2_2.lisp", "screenshot_task22.png"),
        ("task2_3.lisp", "Задание 2.3 — sbcl --script task2_3.lisp", "screenshot_task23.png"),
        ("task3_text.lisp", "Задание 3 — sbcl --script task3_text.lisp", "screenshot_task3.png"),
    ]
    for script, title, png in tasks:
        run_lisp(base / script, title, base / png)
