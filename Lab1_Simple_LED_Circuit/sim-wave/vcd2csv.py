import csv
from vcdvcd import VCDVCD
import argparse

def vcd_to_csv(vcd_filename, csv_filename):
    """
    Convert VCD to CSV 
    
    Parameters:
        vcd_filename: Input path of vcd file
        csv_filename: Output path of csv file
    """
    # Read VCD
    vcd = VCDVCD(vcd_filename)
    
    # Get signal labels
    signals = vcd.signals
    
    # Get all time points
    all_times = set()
    for signal_id in signals:
        signal = vcd[signal_id]
        for time_val in signal.tv:
            all_times.add(time_val[0])
    
    sorted_times = sorted(all_times)
    
    # Write to csv file
    with open(csv_filename, 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)
        
        # table head
        header = ['Time']
        for signal_id in signals:
            signal = vcd[signal_id]
            header.append(f"{signal_id}")
        writer.writerow(header)
        
        # data row
        for timestamp in sorted_times:
            row = [timestamp]
            
            for signal_id in signals:
                signal = vcd[signal_id]
                # based on time, find the data
                current_value = None
                for time_val in signal.tv:
                    if time_val[0] <= timestamp:
                        current_value = time_val[1]
                    else:
                        break
                
                row.append(current_value or 'x')  # 'x' denotes unknow
            
            writer.writerow(row)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Convert VCD to CSV"
    )
    parser.add_argument("-i", "--input", required=True, type=str, help="Path of vcd file")
    parser.add_argument("-o", "--output", required=True, type=str, help="Path of csv file")
    args = parser.parse_args()

    vcd_path = args.input
    csv_path = args.output

    vcd_to_csv(vcd_path, csv_path)
    print("Successful")