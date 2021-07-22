func binary(_ n : Int){
    let nn = n % 2
    if(n == 0){
        return
    }
    if nn == 1{
        s+="1"
        
    }
    if nn == 0{
        s+="0"
    }
    
    binary(n/2)
}

var N = Int(readLine()!)!
var s : String = ""


binary(N)
print(String(s.reversed()))

