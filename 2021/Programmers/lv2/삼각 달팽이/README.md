# 20210712 lv2 삼각 달팽이
[Link](https://programmers.co.kr/learn/courses/30/lessons/68645)  

문제 설명
정수 n이 매개변수로 주어집니다. 다음 그림과 같이 밑변의 길이와 높이가 n인 삼각형에서 맨 위 꼭짓점부터 반시계 방향으로 달팽이 채우기를 진행한 후, 첫 행부터 마지막 행까지 모두 순서대로 합친 새로운 배열을 return 하도록 solution 함수를 완성해주세요.

examples.png

제한사항
n은 1 이상 1,000 이하입니다.
입출력 예
n    result
4    [1,2,9,3,10,8,4,5,6,7]
5    [1,2,12,3,13,11,4,14,15,10,5,6,7,8,9]
6    [1,2,15,3,16,14,4,17,21,13,5,18,19,20,12,6,7,8,9,10,11]
입출력 예 설명
입출력 예 #1

문제 예시와 같습니다.
입출력 예 #2

문제 예시와 같습니다.
입출력 예 #3

문제 예시와 같습니다.
```
enum Direction {
    case up
    case down
    case left
    case right
}

struct Point {
    var x: Int
    var y: Int
}

func solution(_ n:Int) -> [Int] {
    if n == 0 {
        return []
    }
    var arr: [[Int]] = []
    var arrTotalCnt: Int = 0
    for i in 0..<n {
        var item: [Int] = []
        for _ in 0..<i+1 {
            item.append(-1)
            arrTotalCnt += 1
        }
        arr.append(item)
    }
    
    var dir: Direction = .down
    var currentIndex: Point = Point(x: 0, y: 0)
    var setCnt: Int = 1
    while true {
        if setCnt > arrTotalCnt {
            break
        }
        if arr[currentIndex.y][currentIndex.x] == -1 {
            arr[currentIndex.y][currentIndex.x] = setCnt
            setCnt += 1
        } else {
            switch dir {
            case .up:
                dir = .left
                currentIndex.x += 2
                currentIndex.y += 2
            case .down:
                currentIndex.y -= 1
                dir = .right
                break
            case .left:
                dir = .down
                currentIndex.x += 1
            case .right:
                currentIndex.x -= 1
                dir = .up
                
                break
            }
        }
        
        switch dir {
        case .up:
            currentIndex.y -= 1
            currentIndex.x -= 1
        case .down:
            currentIndex.y += 1
        case .left:
            currentIndex.x -= 1
        case .right:
            currentIndex.x += 1
        }
        
        if currentIndex.y >= arr.count || currentIndex.x >= arr[currentIndex.y].count {
            switch dir {
            case .up:
                dir = .left
                currentIndex.y += 1
                currentIndex.x -= 1
                currentIndex.x += 1
            case .down:
                dir = .right
                currentIndex.y -= 1
                currentIndex.x += 1
            case .left:
                dir = .down
                currentIndex.x += 2
//                    currentIndex.x += 1
                currentIndex.y += 1
            case .right:
                dir = .up
                currentIndex.x -= 2
//                    currentIndex.x -= 1
                currentIndex.y -= 1
            }
        }
        
    }
    
    var resultArr: [Int] = []
    for i in 0..<arr.count {
        let elementArr = arr[i]
        for j in 0..<elementArr.count {
            resultArr.append(elementArr[j])
        }
    }
    
    return resultArr
}
```
