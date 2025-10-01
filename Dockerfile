# Small, fast base
FROM python:3.11-slim

# Container-friendly defaults
ENV DEBIAN_FRONTEND=noninteractive \
    PIP_NO_CACHE_DIR=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# System deps (build tools + common libs)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential git curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Install Python deps
WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt

# Workspace for notebooks/data (persist via runtime bind mount)
RUN mkdir -p /work

# Declare it as a volume (optional but helpful)
VOLUME ["/work"]

# ---- KaggleHub defaults (safe to bake, overrideable at runtime) ----
# Cache under /work so downloads persist to your host when you mount ./work:/work
ENV KAGGLEHUB_CACHE=/work/.kagglehub_cache

# If you plan to use the official kaggle CLI later, you might also
# want these dirs present (credentials are mounted/loaded at runtime):
# RUN mkdir -p /home/appuser/.kaggle && chmod 700 /home/appuser/.kaggle

# Create non-root user and fix ownership
RUN useradd -m -u 1000 appuser && chown -R appuser:appuser /app /work
USER appuser
WORKDIR /work

# Jupyter
EXPOSE 8888
CMD ["jupyter","lab","--ServerApp.ip=0.0.0.0","--ServerApp.port=8888","--ServerApp.open_browser=False"]
