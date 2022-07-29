FROM python:3.9

EXPOSE 8501

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt
 
RUN pip3 install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

ENV PYTHONPATH "${PYTHONPATH}:/code/app"

CMD ["streamlit", "run", "app/app.py", "--theme.base", "dark"]