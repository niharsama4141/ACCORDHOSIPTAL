FROM python:3.12-slim

# Set working directory to the Django backend
WORKDIR /app/server

# Copy the whole project
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r /app/requirements.txt

# Collect static files (optional)
RUN python manage.py collectstatic --noinput || true

# Expose port 8000
EXPOSE 8000

# Start the ASGI server (Haztrak uses ASGI now)
CMD ["gunicorn", "core.asgi:application", "--bind", "0.0.0.0:8000", "-k", "uvicorn.workers.UvicornWorker"]
