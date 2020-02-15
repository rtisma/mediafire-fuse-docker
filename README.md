mediafire-fuse for Docker
---

# Descrition
Since mediafire-fuse was not easy to install on Manjaro, I created this "sandbox" environment to help with downloading many large files to my local machine (or docker host). 

# Requirements
- docker
- docker-compose

# Usage
## Running
1. Build and run in one step
```bash
MEDIAFIRE_USERNAME=<username> MEDIAFIRE_PASSWORD=<password> docker-compose up --build -d
```

## Downloading
1. Login to the container
```bash
docker-compose exec mediafire-fuse bash
```

2. Copy the files you want from `/mediafire/data` (the fuse mount) to `/mediafire/host` (the mount to the docker host directory)
```bash
cp -r /mediafire/data/<some_file_or_folder> /mediafire/host
```

Then on the docker host, you will see the copied files/directories in `./mediafire-data`

## Uploading
1. Copy the files you want to `./mediafire-data` on the docker host

2. Login to the container
```bash
docker-compose exec mediafire-fuse bash
```

3. Copy the files you want to upload to mediafire from `/mediafire/host` (the mount to the docker host directory) to the `/mediafire/data/` (the mediafire fuse mount point)
```bash
cp -r /mediafire/host/<some_file_or_folder> /mediafire/data
```

## Stop service
```bash
docker-compose down -v
```





