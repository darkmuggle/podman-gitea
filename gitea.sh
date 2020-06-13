#!/bin/bash
#   
#    Copyright 2020, Ben Howard <me@muggle.dev> 
# 
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

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

