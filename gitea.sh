srv=(
  --name server
  --env USER_UID=1000
  --env USER_GID=1000
  --env DB_TYPE=postgres
  --env DB_HOST=db:5432
  --env DB_NAME=gitea
  --env DB_USER=gitea
  --env DB_PASSWD=gitea
  --restart=always
  "--volume=gitea_srv:/data"
  "--volume=/etc/localtime:/etc/localtime:ro"
  gitea/gitea:latest
)

db=(
  --name db
  --restart always
  --env POSTGRES_USER=gitea
  --env POSTGRES_PASSWORD=gitea
  --env POSTGRES_DB=gitea
  "--volume=gitea_db:/var/lib/postgresql/data"
  --restart=always
  postgres:9.6
)

podman pod rm gitea --force 
podman pod create --name gitea -p 3000:3000 -p 2022:22  --hostname home.utlemming.org 
podman volume create gitea_srv
podman volume create gitea_db
podman create --pod gitea "${srv[@]}"
podman create --pod gitea "${db[@]}"

