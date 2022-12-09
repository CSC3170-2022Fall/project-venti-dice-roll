from pymysql import Connection          # type: ignore
from pymysql.constants import CLIENT    # type: ignore
from pymysql.cursors import DictCursor  # type: ignore
import pandas as pd # type: ignore
import os
import numpy as np

# make sure that these are the same in the github action file: "/.github/workflows/classroom.yml"
HOST = 'localhost'
PORT = 3306
USER = 'root'
PASSWORD = 'root'
DB = 'as2'
CLIENT_FLAG = CLIENT.MULTI_STATEMENTS
SOLUTIONS_PATH = '../solutions/'
TESTCASE_PATH = '../test_cases/'
DATA_PATH = '../data/'

def link(use_db: bool=True):
    return Connection(host=HOST,
                      port=PORT,
                      user=USER,
                      password=PASSWORD,
                      db=DB if use_db else None, 
                      client_flag=CLIENT_FLAG)

def get_sql(question_id: int):
    f_path = os.path.join(SOLUTIONS_PATH, str(question_id)+'.sql')
    with open(f_path, 'r', encoding='utf-8') as f:
        result = f.read()
    return result

def get_insert_sql():
    f_path = os.path.join(DATA_PATH, 'db_insert.sql')
    with open(f_path, 'r', encoding='utf-8') as f:
        result = f.read()
    return result

def execute_sql(conn: Connection, sql: str):
    print(sql)
    success = True
    try:
        with conn.cursor(cursor=DictCursor) as cursor:
            cursor.execute(sql)
            result = cursor.fetchall()
            result = pd.DataFrame(result)  # 转成pandas的DataFrame
        conn.commit()
    except:
        success = False
        conn.rollback()
    return success, result

def get_refer(question_id: int):
    f_path = os.path.join(TESTCASE_PATH, str(question_id)+'.xlsx')
    return pd.read_excel(f_path, engine='openpyxl')

def my_sort(df: pd.DataFrame):
    return pd.DataFrame(np.sort(df.values, axis=0), index=df.index, columns=df.columns)

def cast_float(df: pd.DataFrame):
    columns = df.columns.tolist()
    df[columns] = df[columns].astype(float)
    return df