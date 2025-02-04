
*Optimized Python Docker Image 

  *Project Structure

 /project-directory
 ├── app.py            # Flask application
 ├── requirements.txt  # Dependencies
 ├── Dockerfile        # Docker configuration

 *Prerequisites

  Python 

  Docker

Step 1. Pull Python image

sudo docker pull python:latest


Step 2. Building Optimized Python Image

Use a Python base image

Impliment multi-layer to reduce the size

Copy the application files.

Install dependencies.

Expose the port.

Run the Flask app.


Step 3. Configure app.py and requirement.txt 
 
configure requirement.txt
Flask==2.2.2

configure app.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello, World!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)


Step 4. Build image

sudo docker built -t optimized-py-img .


step 5. Check the results 

sudo docker run -d -p 80:80 optimized-py-img:latest


Step 6. Login and Push to Docker hub

sudo docker login

sudo docker tag optimized-py-img your-dockerhub-username/optimized-py-img:latest



(Check the Image dir for screenshots of this project)
