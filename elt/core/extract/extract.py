import requests
import pandas as pd
from sqlalchemy import create_engine
import os

project_path = os.environ['beev_project_path']
db_connexion = os.environ['beev_db_connexion']


for source in ['car_data', 'consumer_data']:
    source_id = os.environ[f'{source}_id']
    url = f'https://drive.google.com/uc?id={source_id}'
    response = requests.get(url)
    with open('temp/temp.csv', 'wb') as f:
        f.write(response.content)
    # load the source data into the database
    df = pd.read_csv('temp/temp.csv')
    df.to_sql(
        name=f'{source}',
        con=create_engine(db_connexion),
        schema='extract',
        if_exists='replace')
print('hello')
