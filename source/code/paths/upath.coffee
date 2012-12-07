_ = require 'lodash'
_.mixin (require 'underscore.string').exports()
_path = require 'path'

###
  upath is a proxy to node's 'path', replacing '\' with '/' for all string results :-)

  And adding some features ?...
###
upath = {}
for fName, fn of _path when _.isFunction fn
  upath[fName] = do (fName)->
    (p...)->
      res = _path[fName] p...
      if _.isString res
        res.replace /\\/g, '/'
      else
        res

## filename related additions
###
  @return file + ext, if it doesnt have it
  eg to add .js to output .js file
###
upath.addExt = (file, ext)->
  file + if _(file).endsWith(ext) then '' else ext

upath.trimExt = (file)->
  file[0..(file.length - @extname(file).length)-1]

upath.changeExt = (file, ext)->
  upath.trimExt(file) + if ext[0] is '.' then ext else '.'+ext

module.exports = upath

## inline tests @todo specs!
#console.log upath.trimExt 'myfile/trimedExt.txt'
#
#console.log upath.changeExt 'myfile/changedToPDF.txt', 'pdf'
#console.log upath.changeExt 'myfile/changedToDotPDF.txt', '.pdf'
#
#console.log upath.addExt 'myfile/addedTxt.txt', 'txt'
#console.log upath.addExt 'myfile/addedDotTxt.txt', '.txt'