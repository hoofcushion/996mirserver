import pandas as pd

# 读取输入文件
input_file = 'input.xls'
df = pd.read_excel(input_file)

# 检查列名
print("列名：", df.columns)

# 假设需要操作的列名是 'E'，如果列名不匹配，可以手动调整
column_name = df.columns[4]
print(f"操作的列名：{column_name}")

# 删除4列值为“怪物”的行
df = df[df[column_name] != '怪物']

# 输出到新的文件
output_file = 'output.xlsx'
df.to_excel(output_file, index=False)
