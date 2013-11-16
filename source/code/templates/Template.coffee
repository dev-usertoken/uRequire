module.exports =
  class Template

    # Create the tamplate for "Immediately Invoked Function Expression", i.e :
    #   Declare a Function, given its codeBody, and invoke it with given param + value pairs
    #
    # @param {String} codeBody the code to invoke with IIFE
    # @param {String...} paramValuePairs pairs of param + value with which to invoke
    # @example
    #   _functionIIFE 'var a = root;', 'root', 'window', '$', 'jQuery'
    #     ---> (function (root, $) {
    #            var a = root;
    #           })(window, jQuery)
    _functionIIFE: (codeBody, paramValuePairs...)-> """
      (function (#{(param for param, i in paramValuePairs when i%2 is 0).join(', ')}) {
        #{codeBody}
      }).call(this#{if paramValuePairs.length>0 then ', ' else ''}#{
        (value for value, i in paramValuePairs when i%2 isnt 0).join(', ')
      })
    """

    # Declare a Function
    #
    # @param {String} codeBody the code to invoke with IIFE
    # @param {String...} params of param + value with which to invoke
    # @example
    #   _function "var a = root;", "root", "factory"
    #     ---> function (root, factory) {
    #            var a = root;
    #           }
    _function: (codeBody, params...)-> """
      function (#{(param for param, i in params).join(', ')}) {
        #{codeBody}
      }
    """

    runtimeInfo: """
      var __isAMD = (typeof define === 'function' && define.amd),
          __isNode = (typeof exports === 'object'),
          __isWeb = !__isNode;

    """