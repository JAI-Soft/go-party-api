# Utiliza la imagen base de Ruby 3.1.2
FROM ruby:3.1.2

# Instala dependencias
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Configura el directorio de trabajo
WORKDIR /app

# Copia el Gemfile y el Gemfile.lock a la imagen
COPY Gemfile Gemfile.lock ./

# Instala las gemas
RUN bundle install

# Copia el resto de los archivos al directorio de trabajo
COPY . .

# Expone el puerto 3000
EXPOSE 3000

# Entrypoint del contenedor
CMD ["rails", "server", "-b", "0.0.0.0"]
