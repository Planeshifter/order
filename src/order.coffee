###
merge: combine the two input arrays @left and @right and return
newly created result array containing all their elements in sorted order
###
merge = (left, right) ->
  result = []
  li = 0
  ri = 0
  while li < left.length and ri < right.length
    if merge.comparator(left[li].data, right[ri].data) < 0
      result.push left[li++]
    else
      result.push right[ri++]
  return result.concat( left.slice(li) ).concat( right.slice(ri) )

###
standard compare function, attached as property to prevent passing it around
all the time.
###

defaultComparator = (a, b) ->
  if a < b then return -1
  if a > b then return 1
  return 0
merge.comparator = defaultComparator

###
mergeSort: main merge sort function which splits arrays into one-element
arrays and recursively merges them.
###
mergeSort = (items) ->
  if items.length < 2 then return items # no sort necessary
  middle = Math.floor(items.length / 2)
  left    = items.slice(0, middle)
  right   = items.slice(middle)
  return merge(mergeSort(left), mergeSort(right))

###
exported order function: returns a permutation which rearranges input array
Parameters:
@arr: input array
@compareFunction: optional comparator function, standard is to sort elements
in increasing order
###
order = (inputArr, compareFunction) ->
  if typeof(compareFunction) == "function"
    merge.comparator = compareFunction

  arr = []
  arr = inputArr.map( (e, i) ->
    o = {}
    o.data = Object(e) # convert elements from primitive to objects if not already
    o.index = i
    return o
  )
  arr = mergeSort(arr)
  # reset comparator function
  merge.comparator = defaultComparator
  return arr.map( (e) -> e.index )

module.exports = exports = order
