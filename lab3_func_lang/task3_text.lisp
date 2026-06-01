;;; Лабораторная работа №3 — Задание 3
;;; Обработка текста: сделать заглавной первую букву первого слова
;;; каждого предложения (вариант 1)
;;; Реализация через функционалы, без циклов и изменяемых переменных

;; Вспомогательные функции

(defun split-string (str delimiter)
  "Разбивает строку str по символу-разделителю delimiter.
   Возвращает список подстрок."
  (let ((result '())
        (start 0))
    (loop for i from 0 below (length str)
          when (char= (char str i) delimiter)
          do (progn
               (push (subseq str start i) result)
               (setf start (1+ i))))
    (push (subseq str start) result)
    (nreverse result)))

(defun trim-whitespace (str)
  "Удаляет начальные и конечные пробелы из строки."
  (string-trim '(#\Space #\Tab #\Newline) str))

(defun capitalize-first-char (str)
  "Делает первый буквенный символ строки заглавным."
  (if (or (null str) (= (length str) 0))
      str
      (let ((trimmed (trim-whitespace str)))
        (if (= (length trimmed) 0)
            str
            (concatenate 'string
                         (string (char-upcase (char trimmed 0)))
                         (subseq trimmed 1))))))

(defun split-into-sentences (text)
  "Разбивает текст на предложения по точке."
  (remove-if (lambda (s) (= (length (trim-whitespace s)) 0))
             (split-string text #\.)))

(defun process-sentence (sentence)
  "Обрабатывает одно предложение: делает первую букву первого слова заглавной."
  (capitalize-first-char (trim-whitespace sentence)))

(defun join-sentences (sentences)
  "Объединяет список предложений обратно в текст с точками."
  (reduce (lambda (a b)
            (concatenate 'string a ". " b))
          sentences))

(defun process-text (text)
  "Главная функция: обрабатывает весь текст."
  (let* ((sentences (split-into-sentences text))
         (processed (mapcar #'process-sentence sentences)))
    (concatenate 'string (join-sentences processed) ".")))

;; Тест
(defvar *input-text*
  "hello world. this is a test. functional programming is great. lisp is powerful")

(format t "Исходный текст:~%~A~%~%" *input-text*)
(format t "Результат:~%~A~%" (process-text *input-text*))
