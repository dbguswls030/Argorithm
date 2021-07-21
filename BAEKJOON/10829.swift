import Foundation
func binary(_ n : Int, _ i : Int){
    if i < 0{
        return
    }
    var n = n
    let pow = Int(pow(2.0, Double(i)))

    if n >= pow{
        n -= pow
        s+="1"
    }else{
        s+="0"
    }
    binary(n, i-1)
}

var N = Int(readLine()!)!
var s : String = ""
var i = 0

while true{
    let pow = Int(pow(2.0,Double(i)))

    if pow>N{
        i -= 1
        break
    }

    i+=1
}


binary(N, i)

print(s)
