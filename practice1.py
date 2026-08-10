def add_numbers(a,b):
    return a+b
result=add_numbers(5,3)
print(result)
def subtract_numbers(a,b):
    return a-b
result=subtract_numbers(5,3)
print(result)



def greet_person(name):
    print(f"hello,{name}!")
greet_person("Alice");


#String
name="Alice"
print(f"String:{name}")
#Integer
age=25
print(f"Integer:{age}")
#Float
price=19.99
print(f"float:{price}")
#Boolean
is_active=True
print(f"Boolean:{is_active}")
#List(Mutuable,Ordered)
fruits = ["apple","banana","Cherry"]
print(f"List:{fruits}")


#Tuple(Inmutable,ordered)
coordinates={10,20}
print(f"tuple: {coordinates}")

#Dictionary(Key Value Pairs)
person={"name": "Alice","age":30}
print(f"dictionary: {person}")

#Set(Unique values,unordered)
uniq_numbers={1,3,4,5,6}
print(f"set:{uniq_numbers}")


import pandas as pd
df=pd.read_csv('/Users/hanoknaidu/cleaned_titanic (1).csv')
print(df)

import csv

from io import StringIO
data = "name,age\nEmil,14\nTobias,12"
r = csv.reader(StringIO(data))
for row in r:
  print(row)