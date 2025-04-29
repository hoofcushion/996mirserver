# 读取映射关系
def read_mapping(file_path):
    mapping = {}
    with open(file_path, 'r', encoding='utf-8') as file:
        for line in file:
            orig_id, target_id = line.strip().split(',')
            mapping[orig_id] = target_id
    return mapping


# 读取输入数据
def read_input(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        return file.read().strip()


# 处理输入数据并应用映射
def process_input(input_data, mapping):
    lines = input_data.split('\n')
    result = []
    for line in lines:
        if line.strip() in mapping:
            result.append(mapping[line.strip()])
        else:
            result.append(line)
    return '\n'.join(result)


# 主函数
def main():
    # 读取映射关系
    mapping_file = 'map.txt'
    mapping = read_mapping(mapping_file)

    # 读取输入数据
    input_file = 'input.txt'
    input_data = read_input(input_file)

    # 处理输入数据
    output_data = process_input(input_data, mapping)

    # 输出结果到 output.txt 文件
    output_file = 'output.txt'
    with open(output_file, 'w', encoding='utf-8') as output_file:
        output_file.write(output_data)

    print(f"处理完成，结果已保存到 {output_file.name}")


if __name__ == "__main__":
    main()
