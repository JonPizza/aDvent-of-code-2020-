import sequtils, strutils, strscans

let passwords = toSeq(lines("pp"))

proc solve_one(password: string): bool =
    var min, max: int
    var c, goal: string
    if scanf(password, "$i-$i $*: $w", min, max, c, goal):
        return (goal[min - 1] == c[0]) xor (goal[max - 1] == c[0])

var pwCount = 0
for p in passwords:
    if solve_one(p):
        inc pwCount

echo pwCount