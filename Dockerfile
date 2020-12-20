FROM elixir:1.11.2-alpine

WORKDIR /opt/tf_idf_worker

COPY tf_idf_worker .

EXPOSE 4002

CMD ./tf_idf_worker