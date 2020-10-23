"""
Factorial calculation program
"""
n = 0                      # n to calculate the n!
counter = 0                # counter = 1..n
result = 1                 # result = n!

def text_prompt(msg):      # function used for interactive data input
  try:
    return raw_input(msg)  # this one is for python 2
  except NameError:
    return input(msg)      # this one is for python 3

n = int(text_prompt('input N: '))          # input n
if n < 0:                                  # if n<0 then n! is undefined
  print('N should not be less than zero')
else:                                      # if n>=0 then calculate it
  for counter in range(n):                 # repeat n times
    result = result * (counter + 1)
  print(str(n) + '! = ' + str(result))     # print the result
