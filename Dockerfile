
FROM python:3.9

RUN mkdir app/
WORKDIR /app/

COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

COPY app.py /app/app.py


CMD ["python", "app.py"]
