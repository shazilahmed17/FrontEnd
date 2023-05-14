FROM python:3

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python manage.py migrate

EXPOSE 8002

RUN python manage.py migrate

CMD ["python","manage.py","runserver","0.0.0.0:8002"]