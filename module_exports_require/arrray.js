module.exports.unique = (arr) => [...new Set(arr)]

module.exports.flatten = (arr) => arr.reduce((res, a) => [...res, ...a], [])

module.exports.subtract = (arr1, arr2) => arr1.filter(x => arr2.indexOf(x) < 0)
