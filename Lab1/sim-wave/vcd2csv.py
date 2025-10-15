import csv
from vcdvcd import VCDVCD

def vcd_to_csv(vcd_filename, csv_filename):
    """
    将 VCD 文件转换为 CSV 格式
    
    参数:
        vcd_filename: 输入的 VCD 文件路径
        csv_filename: 输出的 CSV 文件路径
    """
    # 读取 VCD 文件
    vcd = VCDVCD(vcd_filename)
    
    # 获取所有信号标识符
    signals = vcd.signals
    
    # 获取所有时间点并排序
    all_times = set()
    for signal_id in signals:
        signal = vcd[signal_id]
        for time_val in signal.tv:
            all_times.add(time_val[0])
    
    sorted_times = sorted(all_times)
    
    # 写入 CSV 文件
    with open(csv_filename, 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)
        
        # 写入表头
        header = ['Time']
        for signal_id in signals:
            signal = vcd[signal_id]
            header.append(f"{signal_id}")
        writer.writerow(header)
        
        # 写入数据行
        for timestamp in sorted_times:
            row = [timestamp]
            
            for signal_id in signals:
                signal = vcd[signal_id]
                # 查找当前时间点的信号值
                current_value = None
                for time_val in signal.tv:
                    if time_val[0] <= timestamp:
                        current_value = time_val[1]
                    else:
                        break
                
                row.append(current_value or 'x')  # 'x' 表示未知值
            
            writer.writerow(row)

# 使用示例
if __name__ == "__main__":
    vcd_to_csv('signals_tb_led.vcd', 'output.csv')
    print("VCD 文件已成功转换为 CSV 格式")