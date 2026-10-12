# Use an official lightweight Node runtime environment
FROM node:20
 
# Set the active working directory inside the container
WORKDIR /app
 
# Copy dependency manifests first for build layer caching optimization
COPY package*.json ./
 
# Install native build tools required for compiling sqlite3, then install dependencies
RUN yarn config set strict-ssl false
RUN yarn install
 
# Copy the rest of the application source code files
COPY . .
 
# Expose internal application layer web communications port
EXPOSE 3000
 
# Specify the default startup run sequence
CMD ["npm", "start"]