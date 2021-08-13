#[
  Created at: 08/12/2021 15:04:05 Thursday
  Modified at: 08/13/2021 02:41:05 AM Friday
]#

##[
  num Word
  --------

  Converts numbers to words

  Improved implementation of https://github.com/marlun78/number-to-words/blob/master/src/toWords.js
]##

{.experimental: "codeReordering".}

from std/strutils import repeat, strip, parseInt, join, replace
from std/math import floor

type
  Values = enum
    Hundred, Thousand, Million, Billion, Trillion, Quadrillion

const
  ten = 10
  max = 9999999999999999.int
  values = [
    100,
    1000,
    1000000,
    1000000000,
    1000000000000.int,
    1000000000000000.int,
  ]

const
  # lessThanTwenty = ["zero", "um", "dois", "tres", "quatro", "cinco", "seis", "sete", "oito", "nove", "dez","onze", "doze", "treze", "quatorze", "quinze", "dezesseis", "dezessete", "dezoito", "dezenove"]
  # tenthsLessThanHundred = ["zero", "dez", "vinte", "trinta", "quarenta", "cinquenta", "sessenta", "setenta", "oitenta", "noventa"]
  lessThanTwenty = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten","eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
  tenthsLessThanHundred = ["zero", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
  moreThanTenths = ["hundred", "thousand", "million", "billion", "trillion", "quadrillion"]
  minus = "minus"

proc toWord*(number: int): string =
  ## Converts the given `number` to string
  ## TODO: Ordinal implementation like JS one
  if number > max:
    return $number
  result = generateWords(number)

proc generateWords(number: int; words = newSeq[string]()): string =
  var
    remainder: int
    word: string
    number = number
    words = words
  if number == 0:
    result = if words.len == 0: lessThanTwenty[0] else: words.join(" ")
    if result[^1] == ',':
      result = result[0..^1]
    return result
  if number < 0:
    words.add minus
    number = abs(number)
  if number < 20:
    remainder = 0
    word = lessThanTwenty[number]
  elif number < values[ord(Hundred)]:
    remainder = number mod ten
    word = tenthsLessThanHundred[floor(number / ten).int]
    if remainder != 0:
      word.add " " & lessThanTwenty[remainder]
      remainder = 0
  else:
    for i in 0..<values.len:
      let value = values[i]
      if number < values[i + 1]:
        remainder = number mod value
        word = generateWords(floor(number / value).int) & " " & moreThanTenths[i] & ","
        break

  words.add word
  return generateWords(remainder, words)


when isMainModule:
  echo 0.toWord
  echo 1.toWord
  echo 10.toWord
  echo 14.toWord
  echo 21.toWord
  echo 51.toWord
  echo 58.toWord
  echo 101.toWord
  echo 131.toWord
  echo 1131.toWord
  echo 123456.toWord
  echo 114564531.toWord
