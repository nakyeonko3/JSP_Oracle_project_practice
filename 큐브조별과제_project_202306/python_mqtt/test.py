import re

stringa = "28 C:51 %"

# 숫자 데이터 추출을 위한 정규식 패턴
pattern = r"\d+(\.\d+)?"

# 정규식 패턴과 일치하는 숫자 데이터 추출
numbers = re.findall(pattern, stringa)

# 추출된 숫자 데이터 출력
for number in numbers:
    print(number)
