import psutil
from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")

def index():

    cpu_usage = psutil.cpu_percent()
    memory_usage = psutil.virtual_memory().percent
    Message = None

    if cpu_usage > 80 or memory_usage > 80:

        Message = "High CPU or Memory utilization! Please scale up"
    
    return render_template("index.html", cpu_usage = cpu_usage, memory_usage = memory_usage, message = Message)

if __name__ == '__main__':

    app.run(debug = True, host = '0.0.0.0')