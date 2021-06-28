FROM ubuntu:18.04

# Переключаем Ubuntu в неинтерактивный режим — чтобы избежать лишних запросов
ENV DEBIAN_FRONTEND noninteractive

# Обновляем список пакетов
RUN apt-get update

# Устанавливаем нужные пакеты
RUN apt-get install -y git python3-pip

# Клонируем приложение
RUN git clone https://github.com/anfederico/Flaskex

# Задаем рабочую директорию
WORKDIR /Flaskex

# Устанавливаем зависимости приложения
RUN pip3 install --no-cache-dir -r requirements.txt

# Очищаем cache
RUN apt-get clean

# Запускаем приложение
CMD python3 app.py
