import sequtils

let map = toSeq(lines("map"))

proc solve(map: seq[string], right: int, down: int): int =
    for i in 1..(map.len div down) - 1:    
        result += int(map[i * down][i * right mod map[0].len] == '#')

echo solve(map, 1, 1)