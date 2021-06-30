var map = [
["1","1","1","1","1","1"],
["e","0","1","0","0","1"],
["1","0","0","0","1","1"],
["1","0","1","0","1","1"],
["1","0","1","0","0","x"],
["1","1","1","1","1","1"]]

struct Location {
    var x: Int
    var y: Int
    
    init(_ x : Int, _ y : Int) {
        self.x = x
        self.y = y
    }
}



func searchPath(){
    
    print(cur.y, cur.x)

    map[cur.y][cur.x] = "e"

    //search left
    if cur.x-1>=0{
        if map[cur.y][cur.x-1] == "0" || map[cur.y][cur.x-1] == "x"{
            stack.append(Location(cur.x-1, cur.y))
        }
    }

    //search down
    if cur.y-1>=0{
        if map[cur.y-1][cur.x] == "0" || map[cur.y-1][cur.x] == "x"{
            stack.append(Location(cur.x, cur.y-1))
        }
    }

    //search right
    if cur.x+1 <= map.count-1{
        if map[cur.y][cur.x+1] == "0" || map[cur.y][cur.x+1] == "x"{
            stack.append(Location(cur.x+1, cur.y))
        }
    }

    //search up
    if cur.y+1 <= map.count-1{
        if map[cur.y+1][cur.x] == "0" || map[cur.y+1][cur.x] == "x"{
            stack.append(Location(cur.x, cur.y+1))
        }
    }
}

func readQueue(){
    if stack.count != 0{
        cur.x = stack[0].x
        cur.y = stack[0].y
        stack.removeFirst()
    }
}


var stack: [Location] = []

var cur = Location(0, 1)


while map[cur.y][cur.x] != "x"{    
    searchPath()
    readQueue()    
}

print(map[cur.y][cur.x])