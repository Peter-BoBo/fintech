import requests
import pandas as pd
from bs4 import BeautifulSoup as bs
from sqlalchemy import create_engine

def collect_data():
    company_infos = []
    page = 1
    while True:
        url = "https://kind.krx.co.kr/corpgeneral/corpList.do"
        payload = dict(method="searchCorpList", pageIndex=page, currentPageSize=100, orderMode=3, orderStat="D", 
                       searchType=13, fiscalYearEnd="all", location="all")
        r = requests.post(url, params=payload)
        soup = bs(r.content, "lxml")

        total_page = int(soup.select_one(".info.type-00 > em").text.replace(",", "")) // 100 + 1
        for tr in soup.select("tbody > tr"):
            stock_type = tr.select_one("td:nth-child(1) > img")['alt']
            company_name = tr.select_one("td:nth-child(1) > a")["title"]
            stock_code = tr.select_one("td:nth-child(1) > a")["onclick"].split("'")[1]
            business_type = tr.select_one("td:nth-child(2)").text
            product = tr.select_one("td:nth-child(3)").text
            resi_date = tr.select_one("td:nth-child(4)").text
            settlement = tr.select_one("td:nth-child(5)").text
            ceo = tr.select_one("td:nth-child(6)").text
            homepage = tr.select_one("td:nth-child(7) > a")['href'] if tr.select_one("td:nth-child(7) > a") else ""
            region = tr.select_one("td:nth-child(8)").text
            company_infos.append((stock_type, company_name, stock_code, business_type, product, resi_date, settlement, ceo, homepage, region))

        if page < total_page:
            page += 1
        else:
            break

    columns = soup.select_one("table")["summary"].split(", ")
    columns.insert(0, "증권종류")
    columns.insert(2, "종목코드")
    df = pd.DataFrame(company_infos, columns=columns)
    return df

def save_to_mysql(df):
    db_url = 'mysql+pymysql://root:1234@127.0.0.1:3306/korean_stock'
    engine = create_engine(db_url, echo=False)
    df.to_sql(name='company_info', con=engine, if_exists='replace', index=False)

if __name__ == '__main__':
    df = collect_data()
    save_to_mysql(df)