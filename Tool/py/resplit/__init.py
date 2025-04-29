# 读取映射文件
mapping = {}
with open('map.txt', 'r') as map_file:
    for line in map_file:
        key, value = line.strip().split(',')
        mapping[key] = value

# 读取输入文件并处理
output_lines = []
with open('input.txt', 'r') as input_file:
    for line in input_file:
        columns = line.strip().split(',')
        if columns[0] == '2' and columns[1] in mapping:
            columns[1] = mapping[columns[1]]
            output_lines.append(','.join(columns))

# 输出到新的文件
with open('output.txt', 'w') as output_file:
    for line in output_lines:
        output_file.write(line + '\n')
