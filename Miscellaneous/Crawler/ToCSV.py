#%%
from bs4 import BeautifulSoup
import requests
import re
import sys
import os
import calendar
import time


def main(path, sample_num):
    def cut(obj, sec):
        return [obj[i : i + sec] for i in range(0, len(obj), sec)]

    htmlfile = open(path, "r", encoding="utf-8")
    htmlhandle = htmlfile.read()
    soup = BeautifulSoup(htmlhandle, "lxml")
    name = soup.find_all(name="a", attrs={"target": "_blank"})
    tar_soup = soup.find_all(name="div", attrs={"id": "jsFixedHeaderTop"})

    # 车辆名称及型号
    temp_name = ""
    for item in name:
        temp_name += item.get_text()
    temp_name = temp_name.replace("\r", "$")
    temp_name = temp_name.replace("\n", "#")
    names = []
    initial_coordinate = temp_name.find("#") + 2
    last_coordinate = temp_name.find("#") + 2
    flag = True

    while flag == True:
        if len(names) >= sample_num or len(names) + 1 == sample_num:
            # 添加最后一个名字
            holder = ""
            for i in range(len(names)):
                if i == 0:
                    holder = temp_name[: temp_name.find("#")].replace(names[i], "")
                elif i > 0:
                    holder = holder.replace(names[i], "")
            names.append(holder)
            # names.insert(0,'#车辆名称及型号#')
            # print(names)
            flag = False
        if len(names) == 0:
            names.append(
                temp_name[
                    initial_coordinate : initial_coordinate
                    + temp_name[initial_coordinate:].find("#")
                ]
            )
            last_coordinate = (
                initial_coordinate + temp_name[initial_coordinate:].find("#") + 2
            )

        elif len(names) >= 1 and flag != False:
            names.append(
                temp_name[
                    last_coordinate : last_coordinate
                    + temp_name[last_coordinate:].find("#")
                ]
            )
            last_coordinate = (
                last_coordinate + temp_name[last_coordinate:].find("#") + 2
            )
    # 抓取车辆名称及型号

    # 抓取车辆属性
    temp = ""
    for item in tar_soup:
        temp += item.get_text()
    temp = temp.replace("\r", "")
    temp = temp.replace("\n", "#")
    # print(temp)
    attributess = ["厂商指导价(元)", "进气形式", "排量(L)", "驱动方式", "最大功率(kW)", "发动机", "巡航系统"]
    a, b, c, d, e, f, g = [], [], [], [], [], [], []
    
    for j in range(len(attributess)):
        start_point = int(temp.find(attributess[j]) + len(attributess[j]))
        counter = 0
        laststr = ""
        holder = ""
        starcounter = 0
        data = []
        if attributess[j] == "巡航系统":
            for i in temp[start_point:]:
                if counter >= sample_num + 1:
                    del data[-1]
                    g = data
                    # print(g)
                    break
                if holder != "" and starcounter >= 5:
                    counter += 1
                    data.append(holder)
                    holder = ""
                    starcounter = 0
                if i != "#" and laststr == "#":
                    holder += i
                    laststr = i
                    starcounter = 0
                elif i != "#":
                    holder += i
                if i == "#" and laststr == "":
                    laststr = i
                    starcounter += 1
                elif i == "#" and laststr == "#":
                    starcounter += 1
                elif i == "#" and laststr != "#":
                    laststr = i
                    starcounter += 1
        for i in temp[start_point:]:
            if counter >= sample_num + 1:
                if j == 0:
                    a = data
                elif j == 1:
                    b = data
                elif j == 2:
                    c = data
                elif j == 3:
                    d = data
                elif j == 4:
                    e = data
                elif j == 5:
                    f = data
                # elif j == 6:
                #     g = data
                break
            if i != "#" and laststr == "#":
                holder += i
                counter += 1
                laststr = i
            elif i != "#":
                holder += i
            if i == "#" and laststr == "":
                laststr = i
            elif i == "#" and laststr != "#":
                data.append(holder)
                holder = ""
                laststr = i
    # 抓取车辆属性

    # # 写入CSV
    from pandas import DataFrame

    car_attributes = {
        "车辆名称及型号": names,
        "厂商指导价(元)": a,
        "进气形式": b,
        "排量(L)": c,
        "驱动方式": d,
        "最大功率(kW)": e,
        "发动机": f,
        "巡航系统": g,
    }
    print(len(names), len(a), len(b), len(c), len(d), len(e), len(f), len(g))
    df = DataFrame(car_attributes, columns=attributess.insert(0, "车辆名称及型号"))
    export_csv = df.to_csv(
        "C:/Users/Administrator/Desktop/Car/" + "XX" + ".csv",
        index=None,
        header=True,
        encoding="utf-8-sig",
    )

name = 'car_transfer'
path = "C:/Users/Administrator/Desktop/Car/" + name + ".html"
sample_num = 6
main(path, sample_num)


# %%
