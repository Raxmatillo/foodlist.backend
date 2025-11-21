# Python image
FROM python:3.10-slim

# OS dependency’lar (Postgres, Pillow, build tools)
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Ishchi papka
WORKDIR /app

# requirements.txt’ni ko‘chirish
COPY requirements.txt .

# Pip upgrade va o‘rnatish
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Loyihani ko‘chirish
COPY . .

# Django serverni ishga tushirish (development uchun)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
