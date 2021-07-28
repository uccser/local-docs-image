FROM python:slim

# Install apt packages
RUN apt-get update \
    && apt-get install -y python-pip \
    # Clean downloaded apt packages after install
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    # Install python packages
    && pip install sphinx sphinx-autobuild sphinx_rtd_theme

# Set the locale
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8

# Expose sphinx-autobuild documentation served port
EXPOSE 7000

# Set runtime command to autobuild and serve documentation
CMD sphinx-autobuild -b html --host 0.0.0.0 --port 7000 /docs /docs_build
