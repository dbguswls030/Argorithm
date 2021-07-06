/*func slow_power(_ x: Double, _ n: Int) -> Double{
    var result = 1.0
        for i in 0..<n{
            result = result * x 
        }
    return result 
}*/


func fast_power(_ x: Double, _ n: Int) -> Double{
    
    if n == 0{
        return 1.0
    }
    else if n%2 == 0 { //n이 짝수
        return fast_power(x*x, n/2)
    }
    else{ //n이 홀수
        return x*fast_power(x*x, (n-1)/2)
    }
}

print(fast_power(5,3))