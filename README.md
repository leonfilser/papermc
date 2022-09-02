# PaperMC Minecraft Server in Docker
Fast & Flexible Minecraft Server based on PaperMC.

## Quickstart
If you simply want to run an Minecraft Server without any worries execute this:

```bash
docker run -p 25565:25565 -v ${PWD}/data/:/minecraft leonfilser/papermc:latest
```

## Environment Variables
To keep it simple there are only 3 environment variabels you need to adjust:

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
    ports:
      - 25565:25565
    environment:
        #specify which Minecraft version you want to use 
      - VERSION=1.17.1
        #the minimum RAM for your server
      - XMS=4G
        #the maximum RAM for your server
      - XMG=8G
    volumes:
      - ${PWD}/data/:/minecraft
```

## Links
- [GitHub](https://github.com/leonfilser/papermc "GitHub")
- [DockerHub](https://hub.docker.com/r/leonfilser/papermc "DockerHub")
