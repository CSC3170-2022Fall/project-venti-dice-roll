import pymysql
from flask import Flask, render_template, request


app = Flask(__name__)


@app.route('/', methods=['POST'])
def index():
    # 连接数据库  记得按照自己的数据库密码和用户名修改
    HOST = 'localhost'
    PORT = 3306
    USER = 'root'
    PASSWORD = 'root'
    DB = 'firm'
    db = pymysql.connect(host=HOST, user=USER, port=PORT, password=PASSWORD, database=DB)

    # 数据的获取
    user_name = str(request.form['username'])
    phone_num = str(request.form['phonenum'])
    address = str(request.form['address'])
    company_a1 = 'aaaa'
    # company_a1 = str(request.form['company_a1'])  # 这个地方因为我还不是很会改html，你再看看
    chip_num_a1 = str(request.form['chip_num_a1'])
    company_b2 = 'bbbb'
    #company_b2 = str(request.form['company_b2'])
    chip_num_b2 = str(request.form['chip_num_b2'])
    company_c3 = 'cccc'
    #company_c3 = str(request.form['company_c3'])
    chip_num_c3 = str(request.form['chip_num_c3'])

    # sql的运用
    cursor = db.cursor()
    sql = "INSERT INTO consumer (username, phonenum, location) VALUES ( %s, %s, %s); "
    cursor.execute(sql, [user_name, phone_num, address])
    db.commit()  # 仅对数据表作出更改时需要该步骤
    aa = "INSERT INTO package (CONSUMER_ID, A1_NUM, A1_PLANT, B2_NUM, B2_PLANT, C3_NUM, C3_PLANT) VALUES ((select max(CONSUMER_ID) from consumer),%s,%s,%s,%s,%s,%s); "
    cursor.execute(aa, [chip_num_a1, company_a1, chip_num_b2, company_b2, chip_num_c3, company_c3])
    db.commit()

    #cursor.fetchall()
    cursor.close()

    db.close()
    return render_template('chip.html')


if __name__ == '__main__':
    app.run()

