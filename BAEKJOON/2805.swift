import Foundation

func solution(){
    let input = readLine()!.components(separatedBy: " ").map() {Int($0)!}
    let N = input[0]
    let M = input[1]
    let t = readLine()!.components(separatedBy: " ").map() {Int($0)!}


    var top = Int(t.max()!)
    //binarySearch(self.height)
    binarySearch(0, top)
    func binarySearch(_ low: Int, _ high: Int){
        var result = 0
        for i in t{
            if i > (low+high)/2{
                result += (i - (low+high)/2)
            }
        }
        if result >= M{
            if result < (low+high)/2{
                print(high)
                return
            }
            binarySearch((low+high)/2, high)        
        }else{
            binarySearch(low, (low+high)/2-1)
        }
    }
}





solution()
