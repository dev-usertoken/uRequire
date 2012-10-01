myPackage =
  name: "urequire"

  description: "Automatically UMDify your AMD code, to make it run on both the browser & nodejs"

  version: "0.0.8"

  homepage: "https://github.com/anodynos/urequire"

  author:
    name: "Agelos Pikoulas"
    email: "agelos.pikoulas@gmail.com"

  licenses: [
    type: "MIT"
    url: "http://www.opensource.org/licenses/mit-license.php"
  ]

  keywords: ["AMD", "UMD", "UMDjs", "requirejs", "require", "define", "modules", "modular", "converter", "umdify", "dependency", "dependencies", "bundle"]

  repository:
    type: "git"
    url: "git://github.com/anodynos/urequire"

  bugs:
    url: ""

  bin:
    urequire: "./build/code/urequireCmd.js"

  main: "./build/code/urequire.js"

  test: "mocha build/spec --recursive --bail --reporter spec"

  directories:
    doc: "./doc"
    dist: "./build"

  engines:
    "node": "*"

  dependencies:
    "lodash": "*"
    "commander": "*"
    "wrench" : "*"
    "uglify-js": "1.3.x"

  devDependencies:
    "coffee-script": ">=1.3.3"
    "mocha": "*"
    "chai": "*"
    "grunt": "*"
    "grunt-shell": "*"  # mocha
    "grunt-contrib": "*" # using clean, copy

require('fs').writeFileSync('./package.json', JSON.stringify(myPackage), 'utf-8')