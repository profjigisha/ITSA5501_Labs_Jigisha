#Use a lighweight Node.js image for runtime
FROM node:20-alpine

#Set the working directory inside the container
WORKDIR /usr/src/app

#Copy package.json and package-lock.json to the working directory
COPY package*.json ./

#Install the application dependencies
RUN npm install --omit=dev

#Copy the rest of the application code to the working directory
COPY . .

#Run the script to start the application
CMD ["npm", "start"]

# navigate to the directory containing the Dockerfile in Docker Desktop terminal
# cd path/to/lab3_containers_w26

# create docker image from Dockerfile
# docker image build -t node-calculator .

#list docker images
# docker images ls
# docker image inspect node-calculator

# run the docker container (creates new container each time)
# docker container run -itd node-calculator  # -i interactive, -t terminal, -d detached (runs in background); keep ir after it stops

# list running containers
# docker container ls -a