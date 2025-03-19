# main.py
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class FireAlert(BaseModel):
    sensor_id: str
    location: str
    temperature: float
    is_emergency: bool

@app.get("/api/fire-alerts")
def get_fire_alerts():
    return [
        {"sensor_id": "S1", "location": "Москва", "temperature": 300.5, "is_emergency": True},
        {"sensor_id": "S2", "location": "Санкт-Петербург", "temperature": 180.0, "is_emergency": False}
    ]

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)