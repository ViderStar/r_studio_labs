#!/usr/bin/env python3
"""Лабораторная работа №3 — Задание 3.

Императивная обработка текста: сделать заглавной первую букву первого слова
каждого предложения.
"""


def process_text(text: str) -> str:
    """Обрабатывает весь текст последовательным обходом предложений."""
    raw_sentences = text.split(".")
    processed_sentences = []

    for sentence in raw_sentences:
        trimmed = sentence.strip()
        if not trimmed:
            continue

        processed = trimmed[0].upper() + trimmed[1:]
        processed_sentences.append(processed)

    return ". ".join(processed_sentences) + "."


input_text = (
    "hello world. this is a test. functional programming is great. "
    "lisp is powerful"
)

print("Исходный текст:")
print(input_text)
print()
print("Результат:")
print(process_text(input_text))
