import os
import pandas as pd
from sqlalchemy import create_engine
import matplotlib.pyplot as plt

# connect to the database
db_connexion = os.environ['beev_db_connexion']
engine = create_engine(db_connexion)
con = engine.connect()
# write the data into a dataframe
query = 'select * from analytics.sales_by_engine_type order by year'
df = pd.read_sql(
        sql=query,
        con=con
    )

# plot the graph
plt.style.use('_mpl-gallery')

df_thermal = df[df['engine_type'] == 'Thermal']
df_electric = df[df['engine_type'] == 'Electric']

x = df_thermal['year'].tolist()
y_1 = df_thermal['sales_volume_per_year_per_engine_type'].tolist()
y_2 = df_electric['sales_volume_per_year_per_engine_type'].tolist()

fig, ax = plt.subplots(figsize=(10, 6))
ax.get_yaxis().get_major_formatter().set_scientific(False)
ax.bar(x, y_1, label='Thermal', color='red')
ax.bar(x, y_2, label='Electric', bottom=y_1, color='green')

ax.set_xlabel('Year')
ax.set_ylabel('Sales Volume per Year per Engine Type')
ax.legend()
plt.tight_layout()
plt.show()
