#!/usr/bin/env python3
"""Лабораторная работа №3 — Задание 2.1.

Вычисление математического выражения на императивном языке Python.
"""
import math


def task_2_1(m: float, n: float) -> float:
    """Вычисляет математическое выражение для варианта 1."""
    first_part = (m * n + 2) / (3 * n) - math.tan(math.log(4))
    second_part = 5 * math.cos((n + m) / (20 * n)) / math.exp(n * m)
    return math.sin(first_part) + second_part


print(f"Результат task-2-1 для m=2, n=3: {task_2_1(2, 3)}")
print(f"Результат task-2-1 для m=1, n=1: {task_2_1(1, 1)}")
