# test_api

# Задача

- Написать функцию *my_func* которая получала число и выполняза GET запросы в  *test_api* диапазоне "test_api/{number}" - "test_api/{number+50}" и возвращал ответ 
{
  "number": response,
  "number+1": response,
  "number+2": response,
  "number+1": response,
  ...
  "number+50": response,
}

- Сделать лучшим, на ваш взгляд способом

Пример функции:
```python
import requests


def my_func(number):
    url = "http://127.0.0.1:8000/"
    result = {}
    for i in range(number, number + 50):
        r = requests.get(url)
        result[i] = r.text
    return result
```
