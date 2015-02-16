[![NPM version](https://badge.fury.io/js/order-permutation.svg)](http://badge.fury.io/js/order-permutation)
[![Build Status](https://travis-ci.org/Planeshifter/order.svg)](https://travis-ci.org/Planeshifter/order)
https://david-dm.org/Planeshifter/order.svg
[![Dependencies][dependencies-image]][dependencies-url]


# order
returns a permutation which rearranges input array. Implemented
using merge sort algorithm, yielding average performance of O(n log n).

## Installation

Install from npm:

```
npm install order-permutation
```
Use as follows:

```
var order = require('order-permutation');
```

## order(arr, [compareFunction])

The exported function requires as its first parameter the array for which the indices in specified order should be obtained. The optional parameter `compareFunction` specifies a function defining the sort order. If not supplied, the returned permutation indices of the  array sort its elements in increasing order. To sort more complicated objects than numeric primitives, a custom `compareFunction` has to be supplied. This function compares elements `a` and `b` according to the following rules:
- If `compareFunction(a, b)` is less than 0, a gets a lower index than b
- If `compareFunction(a, b)` is greater than 0, b gets a lower index than a.

Therefore, the standard compare function which sorts the elements in ascending order is equivalent to
```
function(a, b) {
    if (a < b) {
      return -1;
    }
    if (a > b) {
      return 1;
    }
    return 0;
  };
```

### Examples

#### Increasing Sequence:

Code:
```
order([1, 2, 3, 4])
```

Output:
```
[0, 1, 2, 3]
```

#### Decreasing Sequence:

Code:
```
order([4, 3, 2, 1])
```

Output:
```
[3, 2, 1, 0]
```

#### Custom Compare Function:

Code:
```
var arr = [{name:"Tom", age: 28}, {name:"Lisa",age:23},{name:"Bill", age: 65}]
// order decreasing with age:
order(arr, function(a,b){
  return b.age - a.age;
});
```

Output:
```
[2, 0, 1]
```

### Obtaining the Sorted Array

To obtain the actual sorted array, one can use the `at()` function of the *lodash* library, like so:

```
var arr = [5, 1, 3, 2];
var indices = order(arr);
_.at(arr, indices)
```

Output:
```
[ 1, 2, 3, 5 ]
```  

## Unit Tests

Run tests via the command `npm test`

---
## License

[MIT license](http://opensource.org/licenses/MIT). 

[dependencies-image]: http://img.shields.io/david/Planeshifter/order.svg
[dependencies-url]: https://david-dm.org/Planeshifter/order

