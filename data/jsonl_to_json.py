import json
import os

def jsonl_to_json(jsonl_filepath):
    # 获取原始文件的目录和文件名，以生成新的JSON文件的路径
    directory, filename = os.path.split(jsonl_filepath)
    basename, _ = os.path.splitext(filename)
    json_filepath = os.path.join(directory, f"{basename}.json")
    
    data = []

    # 读取JSONL文件，并将每行的数据添加到列表中
    with open(jsonl_filepath, 'r', encoding='utf-8') as file:
        for line in file:
            data.append(json.loads(line))

    # 将列表写入到JSON文件中
    with open(json_filepath, 'w', encoding='utf-8') as file:
        json.dump(data, file, ensure_ascii=False, indent=4)

    print(f"Data saved to: {json_filepath}")

# 使用
jsonl_filepath = input("Enter the path to the JSONL file: ")
jsonl_to_json(jsonl_filepath)
