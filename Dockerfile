# Use a slim Python image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Collect static files (for production)
RUN python manage.py collectstatic --noinput

# Expose Django’s port
EXPOSE 8000

# Default command will be overridden by docker-compose.yml
CMD ["gunicorn", "mysite.wsgi:application", "--bind", "0.0.0.0:8000"]
