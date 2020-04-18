docker build -t bboze/multi-client:latest -f ./client/Dockerfile ./client
docker build -t bboze/multi-server:latest -f ./server/Dockerfile ./server
docker build -t bboze/multi-worker:latest -f ./worker/Dockerfile ./worker

docker push bboze/multi-client:latest
docker push bboze/multi-server:latest
docker push bboze/multi-worker:latest

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=bboze/multi-server
kubectl set image deployments/client-deployment client=bboze/multi-client
kubectl set image deployments/worker-deployment worker=bboze/multi-worker