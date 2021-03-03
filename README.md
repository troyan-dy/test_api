# test_api

# Задача

- Написать сервис с ручкой test_api/{number} который при запросе в эту ручку долбился бы в *test_api* GET запросами в диапазоне "test_api/{number}" - "test_api/{number+50}" и возвращал ответ 
{
  "number": response,
  "number+1": response,
  "number+2": response,
  "number+1": response,
  ...
  "number+50": response,
}

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
