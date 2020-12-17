import strutils, sets

let passports = readFile("passports").split("\n\n")
var validPasswords: int

proc grabValue(s: string, v: string): string =
    var i = s.find(v) + v.len + 1
    while s[i] != ' ' and i < s.len:
        result.add(s[i])
        inc i

proc heightIsValid(p: string): bool =
    var height = grabValue(p, "hgt")
    if height.len < 3:
        return false
    var measurement = height[height.len-2..height.high]
    var heightInt = parseInt(height[0..height.high-2])
    return ((measurement == "cm" and 150 <= heightInt and heightInt <= 193) or
            (measurement == "in" and 59 <= heightInt and heightInt <= 76))

proc hairIsValid(p: string): bool =
    var hair = grabValue(p, "hcl")
    hair = hair[1..hair.high]
    if hair.len != 6:
        return false
    for c in hair:
        if c notin "1234567890abcdef":
            return false
    return true

for passport in passports:
    var p = passport.replace("\n", " ")
    p.add(" ")
    if (p.count(" ") == 7 and not p.contains("cid")) or (p.count(" ") == 8):
        if (parseInt(grabValue(p, "byr")) in 1920..2002 and 
            parseInt(grabValue(p, "iyr")) in 2010..2020 and 
            parseInt(grabValue(p, "eyr")) in 2020..2030 and
            heightIsValid(p) and 
            hairIsValid(p) and
            grabValue(p, "ecl") in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"] and
            grabValue(p, "pid").len == 9):
            inc validPasswords

echo validPasswords