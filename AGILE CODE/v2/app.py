import os
from datetime import datetime
from flask import Flask, render_template, request, jsonify, flash, redirect, url_for

app = Flask(__name__)
app.secret_key = os.environ.get("SECRET_KEY", "24mis0384-secret-key-v2")

# In-memory storage for notifications with initial sample data for immediate view demo
alerts = [
    {
        "id": 1,
        "title": "System Initialization",
        "message": "Notification services successfully initialized and running.",
        "priority": "success",
        "created_at": datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    },
    {
        "id": 2,
        "title": "Routine Security Scan",
        "message": "Routine database vulnerability scan scheduled for midnight.",
        "priority": "info",
        "created_at": datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    }
]
alert_id_counter = 3

@app.route("/", methods=["GET", "POST"])
def index():
    global alert_id_counter
    if request.method == "POST":
        title = request.form.get("title", "").strip()
        message = request.form.get("message", "").strip()
        priority = request.form.get("priority", "info")

        if not title or not message:
            flash("Title and Message are required!", "error")
            return redirect(url_for("index"))

        new_alert = {
            "id": alert_id_counter,
            "title": title,
            "message": message,
            "priority": priority,
            "created_at": datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        }
        alerts.insert(0, new_alert)
        flash(f"Alert #{alert_id_counter} ('{title}') added and displayed below!", "success")
        alert_id_counter += 1
        return redirect(url_for("index"))

    return render_template("index.html", alerts=alerts)

@app.route("/api/alerts", methods=["GET"])
def get_alerts_api():
    return jsonify({
        "status": "success",
        "total_alerts": len(alerts),
        "alerts": alerts
    }), 200

@app.route("/api/alerts", methods=["POST"])
def create_alert_api():
    global alert_id_counter
    data = request.get_json(silent=True) or request.form
    title = data.get("title", "").strip()
    message = data.get("message", "").strip()
    priority = data.get("priority", "info")

    if not title or not message:
        return jsonify({"error": "Title and Message are required"}), 400

    new_alert = {
        "id": alert_id_counter,
        "title": title,
        "message": message,
        "priority": priority,
        "created_at": datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    }
    alerts.insert(0, new_alert)
    alert_id_counter += 1

    return jsonify({
        "status": "success",
        "message": "Alert created successfully",
        "alert": new_alert
    }), 201

@app.route("/health")
def health():
    return jsonify({
        "status": "healthy",
        "version": "v2",
        "roll_number": "24MIS0384",
        "features": ["Add – Create alert", "View – Show alerts"]
    })

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port, debug=True)
