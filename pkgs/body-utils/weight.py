#!/usr/bin/env python3
import sys, re
from datetime import datetime


weight_file = "/doc/body/weight" # file that should be used to save/read data.
height_file = "/doc/body/height" # file containing height in cm, e.g. '193'
dob_file = "/doc/body/dob" # file containing the date of birth in %Y-%m-%d, eg '1923-03-25'

def read_all(file):
    with open(file) as f: return f.read()


def get_age(dob, time):
    today = time
    age = today.year - dob.year
    if(today.month, today.day) < (dob.month, dob.day):
        age -= 1
    return age

def calc_bmi(weight_in_kg, height_in_m):
    round(float(weight_in_kg) / height_in_m**2, 2)

def calc_bfp(bmi, age):
    round(1.2 * bmi + 0.23 * age - 16.2, 2)

def main():
    if(len(sys.argv) < 2):
        with open(weight_file) as f:
            for line in f:
                pass
            last_entry = line
        print(last_entry.split('|', 1)[1][:-1])
        return
    arg = sys.argv[1]
    match arg:
        case "list":
            height_in_m = float(read_all(height_file)) / 100
            import csv
            date_of_birth = datetime.strptime(read_all(dob_file).strip(), "%Y-%m-%d")
            with open(weight_file, newline='') as csvfile:
                dataset = csv.reader(csvfile, delimiter='|')
                next(dataset, None) # ignore header
                print("Date\t\tWeight\t\tBMI\t\t~BFP")
                print("------------------------------------------------------")
                for row in dataset:
                    time = row[0][0:10]
                    weight = row[1]
                    bmi = calc_bmi(weight, height_in_m)
                    age = get_age(date_of_birth, datetime.strptime(time, "%Y-%m-%d"))
                    est_bfp = calc_bfp(bmi, age)
                    print(f"{time}\t{weight}kg\t\t{bmi}\t\t{est_bfp}"  )
        case "edit":
            import subprocess,os
            editor = os.environ['EDITOR']
            subprocess.run([editor, weight_file])
        case weight if re.match(r"\d+\.*d*|.\d+", weight):
            file = open(weight_file, 'a')
            date = datetime.now().strftime("%Y-%m-%dT%H:%M:%S")
            file.write(f'{date}|{weight}\n')
        case _:
            print("Invalid parameter")

if __name__ == "__main__":
   main()