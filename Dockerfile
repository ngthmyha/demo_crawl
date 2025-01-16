# Use x86 Ubuntu base image for compatibility
FROM --platform=linux/amd64 ubuntu:24.04

# Update the system and install necessary tools and dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    wget \
    gnupg \
    libnss3 \
    libatk-bridge2.0-0 \
    libx11-xcb1 \
    libxcomposite1 \
    libxrandr2 \
    libxdamage1 \
    libgbm1 \
    libasound2-data \
    libpangocairo-1.0-0 \
    libpangoft2-1.0-0 \
    fonts-liberation \
    libxcursor1 \
    xdg-utils \
    ca-certificates \
    curl \
    libappindicator3-1 \
    libdbusmenu-glib4 \
    libdbusmenu-gtk3-4 \
    libatk1.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libxss1 \
    libxtst6 \
    build-essential \
    python3-pip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Add the Google Chrome repository for x86 compatibility
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg \
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update \
    && apt-get install -y google-chrome-stable

# Install ChromeDriver
RUN wget https://storage.googleapis.com/chrome-for-testing-public/132.0.6834.83/linux64/chromedriver-linux64.zip \
    && unzip -o chromedriver-linux64.zip \
    && mv chromedriver-linux64/chromedriver /usr/local/bin/ \
    && chmod +x /usr/local/bin/chromedriver \
    && rm -rf chromedriver-linux64.zip chromedriver-linux64

# Add the Deadsnakes repository for newer Python versions
RUN add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update

# Set Python 3 as the default
RUN ln -sf /usr/bin/python3 /usr/bin/python

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 - \
    && ln -s /root/.local/bin/poetry /usr/local/bin/poetry

# Copy project files
WORKDIR /app
COPY . /app

# Ensure myspider directory exists
WORKDIR /app/myspider

# Initialize Poetry if pyproject.toml does not exist
RUN [ ! -f "pyproject.toml" ] && poetry init -n || true

# Install necessary libraries using Poetry
RUN poetry add six selenium scrapy scrapy-selenium scrapy-splash webdriver_manager beautifulsoup4

# Set the working directory to /app/myspider
WORKDIR /app/myspider

# Default command to run when the container starts
CMD ["poetry", "run", "scrapy", "crawl", "example"]
