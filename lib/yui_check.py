#!/usr/bin/env python
# coding: utf-8
from selenium import webdriver
from pyvirtualdisplay import Display
import re
import sys
from urllib.parse import urlparse


def yui_check():
    num = sys.argv[1]
    flag = False

    display = Display(visible=0, size=(1024, 768))
    display.start()

    browser = webdriver.Firefox()
    url = "https://koe-koe.com/detail.php?n=" + num
    browser.get(url)

    try:
        contents = browser.find_elements_by_css_selector(".clearfix .user_name a")
        user_name = contents[0].text

        contents = browser.find_elements_by_css_selector(".desc p")
        trip_text = contents[0].text

        if user_name == "ゆい" and "IfaHFZO/O6" in trip_text:
            flag = True

    except Exception as e:
        browser.close()
        browser.quit()
        display.stop()
        print(e)
        return

    browser.close()
    browser.quit()
    display.stop()

    return flag


def main():
    print(yui_check())


if __name__ == "__main__":
    main()
