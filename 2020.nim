import sequtils, strutils
import timeit

let nums = toSeq(lines("numbers")).map(parseInt)

proc solve(nums: seq[int]): int =
  for n1 in nums:
    for n2 in nums:
        if n1 + n2 == 2020:
          return n1 * n2

echo timeGo do:
  discard solve nums