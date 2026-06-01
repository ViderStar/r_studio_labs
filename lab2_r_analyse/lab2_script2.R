# Лабораторная работа №2 — Скрипт 2
# Тема: Основы анализа и визуализации данных на языке R
# Анализ и визуализация загруженных данных

# --- Установка необходимых библиотек (при первом запуске) ---
# install.packages(c("ggplot2", "dplyr", "corrplot", "cluster"))

library(ggplot2)
library(dplyr)
library(corrplot)
library(cluster)

# --- (1) Загрузка данных из локального файла ---
users_data <- read.csv("users_data.csv", fileEncoding = "UTF-8")

cat("Структура данных:\n")
str(users_data)

# --- (2) Подготовка числовых данных для анализа ---
numeric_data <- users_data %>%
  select(address.geo.lat, address.geo.lng) %>%
  mutate(
    address.geo.lat = as.numeric(address.geo.lat),
    address.geo.lng = as.numeric(address.geo.lng)
  )

# --- Кластерный анализ (метод k-средних) ---
set.seed(42)
kmeans_result <- kmeans(numeric_data, centers = 3, nstart = 25)

users_data$cluster <- as.factor(kmeans_result$cluster)

cat("\nРезультаты кластеризации:\n")
cat("Размеры кластеров:", kmeans_result$size, "\n")
cat("Центры кластеров:\n")
print(kmeans_result$centers)

# --- (3) Визуализация: диаграмма рассеяния с кластерами ---
p1 <- ggplot(users_data,
             aes(x = as.numeric(address.geo.lng),
                 y = as.numeric(address.geo.lat),
                 color = cluster)) +
  geom_point(size = 4) +
  geom_text(aes(label = name), vjust = -1, size = 3) +
  labs(title = "Кластеризация пользователей по геолокации",
       x = "Долгота (lng)",
       y = "Широта (lat)",
       color = "Кластер") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

print(p1)

# --- Визуализация: столбиковая диаграмма по кластерам ---
p2 <- ggplot(users_data, aes(x = cluster, fill = cluster)) +
  geom_bar() +
  labs(title = "Распределение пользователей по кластерам",
       x = "Кластер",
       y = "Количество пользователей") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

print(p2)

# --- Описательная статистика ---
cat("\nОписательная статистика числовых данных:\n")
summary(numeric_data)

# --- (4) Сохранение графиков на диск ---
ggsave("cluster_scatter.png", plot = p1, width = 10, height = 7, dpi = 150)
ggsave("cluster_bar.png", plot = p2, width = 8, height = 6, dpi = 150)

cat("\nГрафики сохранены: cluster_scatter.png, cluster_bar.png\n")
