FROM continuumio/miniconda3:4.9.2 AS base
LABEL maintainer="Enrique Plata"
ENV APP_HOME /opt/notebooks
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

FROM base AS installer
USER root
# Getting updates
RUN apt-get --allow-releaseinfo-change update && \
    apt-get install unzip && \
    apt-get --auto-remove remove python-openssl && \
    pip install pyopenSSL

# Activating environment
SHELL ["conda", "run", "/bin/bash", "-c"]
# Installing libraries
RUN pip install --upgrade pip && \
    conda install -y snowflake-snowpark-python

FROM installer AS deps
# Installing pendencies
RUN conda install -y numpy pandas matplotlib notebook
RUN pip install -U scikit-learn imblearn seaborn cachetools optuna

FROM deps AS runner
WORKDIR $APP_HOME
COPY src ./src
#CMD ["sleep", "1d"]
CMD ["jupyter", "notebook","--notebook-dir=/opt/notebooks","--ip='*'","--port=8888", "--no-browser","--allow-root"]
