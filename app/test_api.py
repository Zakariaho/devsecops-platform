import os
os.environ["DATABASE_URL"] = "sqlite:///./test.db"

from fastapi.testclient import TestClient
from main import app

client = TestClient(app)


def test_health():
    r = client.get("/health")
    assert r.status_code == 200
    assert r.json() == {"status": "ok"}


def test_create_and_list_note():
    r = client.post("/notes", json={"title": "hello", "body": "world"})
    assert r.status_code == 201
    assert r.json()["title"] == "hello"

    r = client.get("/notes")
    assert any(n["title"] == "hello" for n in r.json())