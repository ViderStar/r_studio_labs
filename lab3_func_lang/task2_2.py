#!/usr/bin/env python3
"""Лабораторная работа №3 — Задание 2.2.

Реализация кусочной функции Y(x) с помощью if/elif/else.
"""
import math


def y_func(x: float, a: float):
    """Вычисляет Y(x) по условиям варианта 1."""
    if x >= 3:
        return math.sin(x / a) + math.cos(a * x)
    elif 1 < x < 2:
        return math.log(x)
    else:
        return f"Значение x={x} не входит в область определения"


a = 2.0

print(f"Y(4, a={a}) = {y_func(4, a)}")
print(f"Y(1.5, a={a}) = {y_func(1.5, a)}")
print(f"Y(2.5, a={a}) = {y_func(2.5, a)}")
