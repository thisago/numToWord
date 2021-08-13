# Package

version       = "0.1.0"
author        = "Thiago Navarro"
description   = "Convert numbers to words"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.2.2"

task genDocs, "Generate the docs for project":
  exec "nim doc --project --out:docs ./src/numToWord.nim"
