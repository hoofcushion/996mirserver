import os
import re
import shutil
import io
import sys

# 设置 stdout 的编码为 UTF-8
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

# 匹配文件名模式
pattern = re.compile(r'^([a-z]+)_(\d+)_.+\.(plist|png)$')

# 获取起始ID和输出文件夹路径
start_id = 10173
input_folder = os.getcwd() + "\\input"
output_folder = os.getcwd() + "\\output"

# 清空输出文件夹
if os.path.exists(output_folder):
    shutil.rmtree(output_folder)
os.makedirs(output_folder)

# 初始化目标ID
target_id = start_id

# 初始化映射字典
orig_to_target_id = {}

files = [f for f in os.listdir(input_folder) if pattern.match(f)]
file_count = 0
total_files = len(files)

for filename in files:
    file_count += 1
    print(f"Processing file {file_count}/{total_files}: {filename}")

    match = pattern.match(filename)
    if not match:
        continue

    prefix, orig_id, ext = match.group(1), match.group(2), match.group(3)

    # 如果 orig_id 还没有映射到 target_id，则创建映射并递增 target_id
    if orig_id not in orig_to_target_id:
        orig_to_target_id[orig_id] = target_id
        target_id += 1

    # 获取当前 orig_id 对应的 target_id
    current_target_id = orig_to_target_id[orig_id]

    # 构造新文件名
    new_name = f"{prefix}_{current_target_id}_{filename.split('_', 2)[2]}"

    # 构造新路径
    new_path = os.path.join(output_folder, new_name)

    # 执行重命名并移动到输出文件夹
    shutil.copy(os.path.join(input_folder, filename), new_path)

    # 替换 plist 内容
    if ext == "plist":
        with open(new_path, 'r+', encoding='utf-8') as f:
            content = f.read()
            # 替换 _{orig_id}_ 为 _{target_id}_
            content = re.sub(rf'{prefix}_{orig_id}_',
                             f'{prefix}_{current_target_id}_', content)
            f.seek(0)
            f.write(content)
            f.truncate()

# 将映射关系输出到 map.txt 文件
map_file_path = os.path.join(output_folder, "map.txt")
with open(map_file_path, 'w', encoding='utf-8') as map_file:
    for orig_id, target_id in orig_to_target_id.items():
        map_file.write(f"{orig_id},{target_id}\n")

print("Processing completed. Mapping written to map.txt.")
