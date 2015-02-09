merge = (left, right) ->
  result = []
  li = 0
  ri = 0
  while li < left.length and ri < right.length
    if merge.comparator(left[li], right[ri]) < 0
      result.push left[li++]
    else
      result.push right[ri++]
  return result.concat( left.slice(li) ).concat( right.slice(ri) )

merge.comparator = (a, b) ->
  if a < b then return -1
  if a > b then return 1
  return 0

mergeSort = (items) ->
  if items.length < 2 then return items # no sort necessary
  middle = Math.floor(items.length / 2)
  left    = items.slice(0, middle)
  right   = items.slice(middle)
  return merge(mergeSort(left), mergeSort(right))

order = (arr, compareFunction) ->
  if typeof(compareFunction) == "function"
    merge.comparator = compareFunction

  arr = arr.map( (e, i) ->
    e = Object(e) # convert elements from primitive to objects if not already
    e.index = i
    return e
  )
  arr = mergeSort(arr)
  return arr.map( (e) -> e.index )

module.exports = exports = order
