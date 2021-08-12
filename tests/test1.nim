#[
  Created at: 08/12/2021 15:00:22 Thursday
  Modified at: 08/12/2021 07:28:19 PM Thursday
]#

import std/unittest
import numWord

suite "Number to words":
  test "0-9":
    check 0.toWords == "zero"
    check 1.toWords == "one"
    check 2.toWords == "two"
    check 3.toWords == "three"
    check 4.toWords == "four"
    check 5.toWords == "five"
    check 6.toWords == "six"
    check 7.toWords == "seven"
    check 8.toWords == "eight"
    check 9.toWords == "nine"
  test "10-19":
    check 10.toWords == "ten"
    check 11.toWords == "eleven"
    check 12.toWords == "twelve"
    check 13.toWords == "thirteen"
    check 14.toWords == "fourteen"
    check 15.toWords == "fifteen"
    check 16.toWords == "sixteen"
    check 17.toWords == "seventeen"
    check 18.toWords == "eighteen"
    check 19.toWords == "nineteen"
  test "20-29":
    check 20.toWords == "twenty"
    check 21.toWords == "twenty one"
    check 22.toWords == "twenty two"
    check 23.toWords == "twenty three"
    check 24.toWords == "twenty four"
    check 25.toWords == "twenty five"
    check 26.toWords == "twenty six"
    check 27.toWords == "twenty seven"
    check 28.toWords == "twenty eight"
    check 29.toWords == "twenty nine"
