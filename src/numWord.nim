#[
  Created at: 08/12/2021 15:04:05 Thursday
  Modified at: 08/12/2021 07:27:59 PM Thursday
]#

##[
  num Word
  --------

  Converts numbers to words

  Implementation of https://github.com/marlun78/number-to-words/blob/master/src/toWords.js
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

proc toWords*(number: int; asOrdinal = false): string =
  var words: seq[string]

  if number > max:
    return $number

  result = generateWords(number)
  # return asOrdinal ? makeOrdinal(words) : words

proc generateWords(number: int; words = newSeq[string]()): string =
  var
    remainder: int
    word: string
    number = number
    words = words

  if number == 0:
    result = if words.len == 0: "zero" else: words.join(" ")
    if result[^1] == ',':
      result = result[0..^1]
    return result
  if number < 0:
    words.add("minus")
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
        word = generateWords(floor(number / value).int) & " " & moreThanTenths[i + 1] & ","
        break

  words.add word
  return generateWords(remainder, words)


when isMainModule:
  echo 1.toWords
  echo 10.toWords
  echo 14.toWords
  echo 21.toWords
  echo 51.toWords
  echo 58.toWords
  echo 101.toWords
  echo 131.toWords
  echo 1131.toWords
