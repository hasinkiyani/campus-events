# Step 1: Use Node.js official image
FROM node:18-alpine

# Step 2: Set working directory inside container
WORKDIR /app

# Step 3: Copy package.json (if needed later)
COPY package.json .

# Step 4: Install Parcel bundler and simple static server
RUN npm install -g parcel
RUN npm install -g serve

# Step 5: Copy all project files
COPY . .

# Step 6: Build the project with Parcel
RUN parcel build src/contact.html --dist-dir dist

# Step 7: Expose the port
EXPOSE 3000

# Step 8: Run the site using 'serve'
CMD ["serve", "dist", "-l", "3000"]
