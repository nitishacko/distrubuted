docker build -t worker-node .
docker run -d -p 4000:4000 --name jmeter-worker-container worker-node
