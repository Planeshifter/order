###
standard compare function, attached as property to prevent passing it around
all the time.
###

defaultComparator = (a, b) ->
  if a < b then return -1
  if a > b then return 1
  return 0

###
exported order function: returns a permutation which rearranges input array
Parameters:
@arr: input array
@compareFunction: optional comparator function, standard is to sort elements
in increasing order
###
order = (inputArr, compareFunction) ->
  if typeof(compareFunction) != "function"
    compareFunction = defaultComparator

  arr = [0...inputArr.length]

  return arr.sort( (a, b) -> compareFunction(inputArr[a], inputArr[b]) )

module.exports = order
