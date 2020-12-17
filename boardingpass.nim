import strutils, sequtils, algorithm

var idSeq: seq[int] = newSeq[int]()

for line in lines("passes"):
    var row = line[0..line.high - 3]
    var col = line[line.high - 2..line.high]

    row = row.replace('B', '1')
    row = row.replace('F', '0')

    col = col.replace('R', '1')
    col = col.replace('L', '0')

    var passId = parseBinInt(row) * 8 + parseBinInt(col)
    idSeq.add(passId)

idSeq.sort()

for i in 1..idSeq.high - 1:
    if idSeq[i + 1] != idSeq[i] + 1:
        echo idSeq[i]
        
    