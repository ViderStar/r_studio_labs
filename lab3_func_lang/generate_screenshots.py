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


def run_script(command: list[str], title: str, out_png: Path) -> None:
    result = subprocess.run(
        command,
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
        (["sbcl", "--script", "task2_1.lisp"], "Задание 2.1 — sbcl --script task2_1.lisp", "screenshot_task21.png"),
        (["sbcl", "--script", "task2_2.lisp"], "Задание 2.2 — sbcl --script task2_2.lisp", "screenshot_task22.png"),
        (["sbcl", "--script", "task2_3.lisp"], "Задание 2.3 — sbcl --script task2_3.lisp", "screenshot_task23.png"),
        (["sbcl", "--script", "task3_text.lisp"], "Задание 3 — sbcl --script task3_text.lisp", "screenshot_task3.png"),
        (["python3", "task2_1.py"], "Задание 2.1 — python3 task2_1.py", "screenshot_task21_python.png"),
        (["python3", "task2_2.py"], "Задание 2.2 — python3 task2_2.py", "screenshot_task22_python.png"),
        (["python3", "task2_3.py"], "Задание 2.3 — python3 task2_3.py", "screenshot_task23_python.png"),
        (["python3", "task3_text.py"], "Задание 3 — python3 task3_text.py", "screenshot_task3_python.png"),
    ]
    for command, title, png in tasks:
        resolved_command = [command[0], *[str(base / arg) if arg.endswith((".lisp", ".py")) else arg for arg in command[1:]]]
        run_script(resolved_command, title, base / png)
