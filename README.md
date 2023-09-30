# landlord-tenant-reviews-drf-backend

## Create the virtual environment

```
poetry env use python
```

## Activate the virtual environment

```
poetry shell
```

## Install all dependencies in the poetry.lock file

```
poetry install
```

## Show the dependencies installed in the virtual environment

```
poetry show
```

## Install dependency

```
poetry add <dependency-name>
```

## Export the list of dependencies to a requirements.txt file

```
poetry export -f requirements.txt -o requirements.txt
```

## Run locally

```
docker-compose build
docker-compose up -d
```