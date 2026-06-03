#!/usr/bin/env python3
"""Лабораторная работа №3 — Задание 2.3.

Вычисление факториала в императивном стиле.
"""


def factorial(n: int) -> int:
    """Вычисляет факториал числа n с помощью цикла."""
    if n < 0:
        raise ValueError("Факториал не определён для отрицательных чисел")

    result = 1
    for value in range(2, n + 1):
        result *= value

    return result


for number in (0, 1, 5, 10, 20):
    print(f"{number}! = {factorial(number)}")
