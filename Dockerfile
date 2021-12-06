FROM python:3.9-buster
ENV PYTHONUNVUFFERED=1

WORKDIR /src

RUN pip install poetry

COPY pyproject.toml* poetry.lock* ./

RUN poetry config virtualenvs.in-project true
RUN if [ -f pyproject.toml]; then poetry install; fi

ENTRYPOINT [ "portry", "run", "uvicorn", "api.main:app", "--host", "0.0.0.0", "--reload"]
