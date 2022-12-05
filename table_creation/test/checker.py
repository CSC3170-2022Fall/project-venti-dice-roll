from utils import *

need_order_lst = [7]
init_lst = [1]
cast_float_lst = [5, 10]

def check(name: str):
    if name in init_lst:
        conn = link(False)
    else:
        conn = link(True)
    sql = get_sql(name)
    success, result = execute_sql(conn, sql)

    if not success:
        return False

    if name in init_lst:
        success, _ = execute_sql(conn, get_insert_sql())
        return success

    refer_answer = get_refer(name)

    print('-'*10 + ' Note: we already simplify the test with relaxed type check' + '-'*10)
    print('#'*20 + ' Expected Output ' + '#'*20)
    print(refer_answer)
    print('#'*21 + ' Actually Got ' + '#'*22)
    print(result)

    if name in need_order_lst:
        val = np.all(result == refer_answer)
    else:
        result = my_sort(result)
        refer_answer = my_sort(refer_answer)

        if name in cast_float_lst:
            result = cast_float(result)
            refer_answer = cast_float(refer_answer)

        val = np.all(result == refer_answer)

    return val