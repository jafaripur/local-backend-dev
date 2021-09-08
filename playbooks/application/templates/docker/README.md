# Docker setup

### Run docker from normal user

```
sudo usermod -aG docker $(whoami)
```

Setup docker networks and pull docker images.

### Commands

Needed command created in bash script file for easy using.

#### Network

Create network for docker containers, This is required before any docker container start.

```
./network.sh
```

#### Pull

Pull docker imagess from hub

```
./pull.sh
```