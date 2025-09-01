import json
import os

def read_login_test_data(user_type):
    current_dir = os.path.dirname(os.path.abspath(__file__))
    json_path = os.path.join(current_dir, '..', 'testdata', 'login_data.json')

    with open(json_path) as json_file:
        data = json.load(json_file)
        return data[user_type]

