cd devops-001
git pull origin master
docker-compose down
docker-compose pull
docker-compose up --build -d
sudo systemctl restart nginx
