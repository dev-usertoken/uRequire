// Generated by CoffeeScript 1.6.3
var AlmondOptimizationTemplate, assert, chai, deepEqual, equal, expect, like, likeBA, notEqual, ok, _, _ref;

_ = require('lodash');

chai = require('chai');

assert = chai.assert;

expect = chai.expect;

_ref = require('../spec-helpers'), deepEqual = _ref.deepEqual, like = _ref.like, likeBA = _ref.likeBA, ok = _ref.ok, equal = _ref.equal, notEqual = _ref.notEqual;

AlmondOptimizationTemplate = require("../../code/templates/AlmondOptimizationTemplate");

describe("AlmondOptimizationTemplate:", function() {
  it("handles *empty* globals & exports.bundle", function() {
    var bundle;
    bundle = {
      globalDepsVars: {},
      nodeOnlyDepsVars: {},
      exportsBundleDepsVars: {}
    };
    return deepEqual(new AlmondOptimizationTemplate(bundle), {
      bundle: bundle,
      exportsBundleGlobalParams: [],
      exportsBundleGlobalDeps: [],
      exportsBundleNonGlobalsDepsVars: {},
      globalNonExportsBundleDepsVars: {},
      defineAMDDeps: []
    });
  });
  return describe("handling of globals & exports.bundle & nodeonly deps.", function() {
    var ao, bundle;
    bundle = {
      globalDepsVars: {
        lodash: ['_'],
        jquery: ['$', 'jQuery']
      },
      exportsBundleDepsVars: {
        lodash: ['_', '_lodash_'],
        'agreement/isAgree': ['isAgree', 'isAgree2']
      },
      nodeOnlyDepsVars: {
        util: [],
        fs: []
      }
    };
    ao = new AlmondOptimizationTemplate(bundle);
    it("identifies what deps and vars are", function() {
      return deepEqual(ao, {
        bundle: bundle,
        exportsBundleGlobalParams: ['_', '_lodash_'],
        exportsBundleGlobalDeps: ['lodash', 'lodash'],
        exportsBundleNonGlobalsDepsVars: {
          'agreement/isAgree': ['isAgree', 'isAgree2']
        },
        globalNonExportsBundleDepsVars: {
          jquery: ['$', 'jQuery']
        },
        defineAMDDeps: ['lodash', 'lodash', 'jquery']
      });
    });
    it("creates stubs for grabbing global deps from global or node", function() {
      return ok(_B.isEqualArraySet(_.keys(ao.dependencyFiles), ['getGlobal_lodash', 'getGlobal_jquery', 'getNodeOnly_util', 'getNodeOnly_fs']));
    });
    return it("creates corresponding paths for stubs", function() {
      return deepEqual(ao.paths, {
        lodash: 'getGlobal_lodash',
        jquery: 'getGlobal_jquery',
        util: 'getNodeOnly_util',
        fs: 'getNodeOnly_fs'
      });
    });
  });
});
