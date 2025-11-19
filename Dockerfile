FROM python:3.11-slim

# Установка Node.js
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Установка javascript-obfuscator
RUN npm install -g javascript-obfuscator

# Рабочая директория
WORKDIR /app

# Копирование зависимостей
COPY requirements.txt .

# Установка Python зависимостей
RUN pip install --no-cache-dir -r requirements.txt

# Копирование всего проекта
COPY . .

# Запуск бота
CMD ["python3", "main.py"]
