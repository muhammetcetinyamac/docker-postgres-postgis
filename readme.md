# Postgres Postgis with Docker
## Run using docker-compose
```
git clone https://github.com/muhammetcetinyamac/docker-postgres-postgis.git
cd docker-postgres-postgis
docker-compose -f docker-compose.yml up
```

## Check plugin with sql query
```
SELECT * FROM pg_extension;
```

## Sql query for testing
```
SELECT h3_geo_to_h3(POINT('37.3615593,-122.0553238'), 5);
```