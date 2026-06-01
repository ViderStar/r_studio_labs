# Generate PNG images for lab1 report
out_dir <- "."
args <- commandArgs(trailingOnly = FALSE)
file_arg <- grep("^--file=", args, value = TRUE)
if (length(file_arg) > 0) {
  out_dir <- dirname(sub("^--file=", "", file_arg))
}

data1 <- c(8, 5, 9, 7, 3, 10, 6, 4)
names(data1) <- c("Иванов", "Петров", "Сидоров", "Козлов",
                   "Новиков", "Фёдоров", "Морозов", "Волков")
data2 <- c("Алексей", "Борис", "Виктор", "Григорий",
            "Дмитрий", "Евгений", "Жан", "Захар")

png(file.path(out_dir, "screenshot1.png"), width = 900, height = 600, res = 120)
barplot(data1,
        main = "Успеваемость студентов",
        col = rainbow(length(data1)),
        ylab = "Оценка",
        las = 2, cex.names = 0.8)
dev.off()

sorted_data1 <- sort(data1, decreasing = TRUE)
sorted_data2 <- data2[order(data1, decreasing = TRUE)]

png(file.path(out_dir, "screenshot2.png"), width = 900, height = 600, res = 120)
barplot(sorted_data1,
        main = "Успеваемость (отсортировано по убыванию)",
        col = rainbow(length(sorted_data1)),
        ylab = "Оценка", las = 2, cex.names = 0.8)
legend("topright", legend = sorted_data2,
       fill = rainbow(length(sorted_data2)),
       cex = 0.7, title = "Студенты")
dev.off()

A <- matrix(c(2, 5, 8, 1,
              3, 7, 4, 6,
              9, 2, 5, 3,
              1, 8, 6, 4,
              7, 3, 2, 9),
            nrow = 4, ncol = 5)
colnames(A) <- paste("Предмет", 1:5)
rownames(A) <- paste("Группа", 1:4)

png(file.path(out_dir, "screenshot3.png"), width = 900, height = 600, res = 120)
mosaicplot(A,
           main = "Мозаичная диаграмма матрицы A",
           color = heat.colors(ncol(A)), las = 1)
dev.off()

df <- data.frame(Имя = data2, Оценка = as.numeric(data1))
capture <- capture.output({
  print(df)
  cat("\n")
  print(summary(df))
})

png(file.path(out_dir, "screenshot4.png"), width = 900, height = 500, res = 120)
par(mar = c(1, 1, 1, 1), family = "sans")
plot.new()
text(0, 1, paste(capture, collapse = "\n"), adj = c(0, 1), cex = 0.9, family = "mono")
dev.off()

cat("Lab1 images saved to", out_dir, "\n")
