# Лабораторная работа №2 — Скрипт 1
# Тема: Основы анализа и визуализации данных на языке R
# Подключение к удалённому ресурсу и загрузка данных

# --- Установка необходимых библиотек (при первом запуске) ---
# install.packages(c("httr", "jsonlite"))

library(httr)
library(jsonlite)

# --- (1) Подключение к удалённому ресурсу ---
# Используем открытый API JSONPlaceholder для получения данных пользователей
url <- "https://jsonplaceholder.typicode.com/users"
response <- GET(url)

if (status_code(response) == 200) {
  cat("Подключение успешно. Код ответа:", status_code(response), "\n")
} else {
  stop("Ошибка подключения: ", status_code(response))
}

# --- (2) Выгрузка и сохранение данных ---
users_json <- content(response, as = "text", encoding = "UTF-8")
users_data <- fromJSON(users_json, flatten = TRUE)

cat("Загружено записей:", nrow(users_data), "\n")
cat("Столбцы:", paste(names(users_data), collapse = ", "), "\n")

write.csv(users_data, file = "users_data.csv", row.names = FALSE, fileEncoding = "UTF-8")
cat("Данные сохранены в файл users_data.csv\n")
