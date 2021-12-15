# PaperMC Minecraft Server in Docker
Fast & Flexible Minecraft Server based in PaperMC.

## How to run

If you only want to run this image for testing purpose run this:

```bash
docker run -p 25565:25565 leonfilser/papermc:latest

```
If you want to use this image in production i highly recomend you to use th docker-compose file below.

## Environment Variables
To keep it simple there are only 3 environemtn Variabels you can adjust:

| Variable | Description                                                         | Default          |
|----------|---------------------------------------------------------------------|------------------|
| VERSION  | Adjust this to the Minecraft Version you want to use. (e.g. 1.17.1) | latest           |
| XMS      | Specify the minimum RAM that is reserved for your server            | 4G (Recommended) |
| XMG      | Specify the maximum RAM that is available for your server           | 8G               |

## docker-compose.yml

```yaml
version: '3.5'

services:
  papermc-minecraft:
    image: leonfilser/papermc:latest
    restart: unless-stopped
    container_name: papermc-minecraft
    environment:
        #specify which Minecraft version you want to use 
      - VERSION=1.17.1
        #the minimum RAM for your server
      - XMS=4G
        #the maximum RAM for your server
      - XMG=8G
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /etc/timezone:/etc/timezone:ro

      #Uncomment to adjust settings and persist your world data
      #- ${PWD}/data/:/minecraft
```

## Links
- [GitHub](https://github.com/leonfilser/papermc "GitHub")
- [DockerHub](https://hub.docker.com/r/leonfilser/papermc "DockerHub")
