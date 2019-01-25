#!/usr/bin/env python
import subprocess
import os


def main():
    f = open("./post-list.txt")

    for i in f:
        num = i.replace('\n', '')
        print(num)
        #result = subprocess.getoutput("python3 " + os.environ.get("INSERT_DEVELOPMENT_DATA") + " " + num)
        result = subprocess.getoutput("python3 " + os.environ.get("INSERT_PRODUCTION_DATA") + " " + num)
        print(result)


if __name__ == "__main__":
    main()
