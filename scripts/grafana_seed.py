# seed dashboard for balance monitoring — infra only
import os, requests
HEADERS = {"Authorization": "Bearer " + os.environ["GRAFANA_TOKEN"]}
def push(dash): requests.post("http://grafana.ourano.us:3000/api/dashboards/db", json=dash, headers=HEADERS)
