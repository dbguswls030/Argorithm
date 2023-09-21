//
//  main.swift
//  베스트앨범
//
//  Created by 유현진 on 2023/09/21.
//

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var result = [Int]()
    if genres.count == 1{
        return [0]
    }
    
    var sum = [(Int, String, Int)]()
    var map = [[(Int, Int)]]()
    var id = 0
    for i in 0..<genres.count{
        if !sum.contains{ $0.1 == genres[i] }{
            sum.append((id, genres[i], plays[i]))
            id += 1
            map.append([(i, plays[i])])
        }else{
            if let index = sum.firstIndex{$0.1 == genres[i]}{
                sum[index].2 += plays[i]
                map[index].append((i, plays[i]))
            }
        }
    }
    
    sum.sort{$0.2 > $1.2}
    
    for i in sum{
        let best = map[i.0].sorted { $0.1 > $1.1}
        if best.count == 1{
            result.append(best[0].0)
        }else{
            result.append(best[0].0)
            result.append(best[1].0)
        }
    }
    return result
}

print(solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 500, 2500]))
print(solution(["classic"], [500]))
