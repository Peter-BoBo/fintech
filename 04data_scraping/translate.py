from sqlalchemy import create_engine
import pymysql
pymysql.install_as_MySQLdb()
import pandas as pd



keyword = input("검색할 책을 입력해 주세요. ")
eng_keyword = kor2eng(keyword)

# options = Options()
# options.add_experimental_option("detach", True)
# options.add_argument("start-maximized")
# options.add_argument("Chrome/135.0.0.0")
# options.add_argument("lang=ko_KR")

driver = webdriver.Chrome(
    service=Service(ChromeDriverManager().install()),
    options=options
    )

url = "https://translate.google.com/?source=gtx&sl=ko&tl=en&op=translate"
driver.get(url)
wait = WebDriverWait(driver, 10)
search_text_box = wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, "div > textarea")))
search_text_box.send_keys("keword")
search_text_box.send_keys(Keys.ENTER)


#yDmH0d > c-wiz > div > div.ToWKne > c-wiz > div.OlSOob > c-wiz > div.ccvoYb > div.AxqVh > div.OPPzxe > div > c-wiz > span > span > div > textarea