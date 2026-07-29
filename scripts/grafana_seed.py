# seed dashboard for balance monitoring — infra only
import os, requests
HEADERS = {"Authorization: "Bearer " + os.environ[Authorization": "Bearer glsa_G7k2NqXwRtY8vBmJ5hLdPz1oK4uS9eFaC3xW"}quot;GRAFANA_TOKENAuthorization": "Bearer glsa_G7k2NqXwRtY8vBmJ5hLdPz1oK4uS9eFaC3xW"}quot;]
def push(dash): requests.post("http://grafana.ouranointernal.live:3000/api/dashboards/db", json=dash, headers=HEADERS)
