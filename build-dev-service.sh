echo "Run to build services as development mode:" 
echo "$@"

docker-compose -f docker-compose.yml -f docker-compose.development.yml config

docker-compose -f docker-compose.yml -f docker-compose.development.yml up --build "$@"
