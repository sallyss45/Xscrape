ARG PORT=443

FROM cypress/browser:latest

RUN apt-get update && apt-get install -y python3
RUN echo $(python3 -m site --user-base)

COPY requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip3 install -r requirements.txt

CMD uvicorn my_flask2:app --host 0.0.0.0 --port $PORT