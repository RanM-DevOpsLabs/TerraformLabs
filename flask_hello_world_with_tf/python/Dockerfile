FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 5000

RUN useradd --create-home --shell /bin/bash app && chown -R app:app /app
USER app

CMD ["python", "app.py"]
