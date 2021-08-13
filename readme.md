<!--
  Created at: 08/13/2021 02:13:50 Friday
  Modified at: 08/13/2021 02:42:17 AM Friday
-->

# numToWord

This lib converts the number (currently just `int`) to words (one, two...)

The implementation is currently just in english, but more will be added
(need refactor a little bit)

---

## Usage

```nim
import numToWord

doAssert 1.toWord == "one"
doAssert 123_456.toWord == "one hundred, twenty three thousand, four hundred, fifty six"
```

---

## Installation

Minimum [Nim](https://nim-lang.org) version is `1.2.2`

Please choice one installation method:

- Automatically with nimble
  <!-- ```bash
  nimble install numToWord
  ```
  or -->
  ```bash
  nimble install https://github.com/thisago/numToWord
  ```
Or
- Manually
  ```bash
  git clone https://github.com/thisago/numToWord
  cd numToWord/
  nimble install
  ```

## Docs

A online docs is hosted in [Github Pages](https://thisago.github.io/numToWord/numToWord.html)

---

## License

MIT
