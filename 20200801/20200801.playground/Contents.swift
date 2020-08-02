/**
 1부터 차례대로 다음과 같이 정렬했을 때, 숫자 N(1 <= N <= 109)을 입력받아서 1부터 N까지 가는 최단거리를 계산하는 프로그램을 작성하세요. (상, 하, 좌, 우로만 움직일 수 있고 대각선으로는 움직일 수 없다.)

 17 16 15 14 13
 18  5  4  3 12
 19  6  1  2 11
 20  7  8  9 10
 21 22 23 24 ...

 Input 예시
 1
 3
 17
 19
 26
 2550
 2573
 Output 예시
 0
 2
 4
 2
 5
 49
 28
 */

func solution(input:UInt) -> UInt { //안될듯 ㅡ,.ㅡ
    
    var result:UInt = 0
    if input != 1 {
        print("--------")
        print("input:\(input)")
        let line:UInt = ((input - 1)/8) + 1
        
        var lineStart:UInt = 2
        for i in 1...line {
            lineStart = lineStart + ((i - 1)*8)
        }
        let lineEnd:UInt = (lineStart + 8 * line) - 1
        let rangeValue:UInt = (lineEnd - lineStart)/4
        print("line:\(line)")
        let point1:UInt = lineEnd
        let point2:UInt = lineStart - 1 + 2*line
        let point3:UInt = point2 + 2*line
        let point4:UInt = point3 + 2*line
        print("point1:\(point1) point2:\(point2) point3:\(point3) point4:\(point4)")

        let point1Center:UInt = point2 - rangeValue/2 - 1
        let point2Center:UInt = point3 - rangeValue/2 - 1
        let point3Center:UInt = point4 - rangeValue/2 - 1
        let point4Center:UInt = point1 - rangeValue/2 - 1
        print("point1center: \(point1Center) point2Center: \(point2Center) point3Center: \(point3Center) point4Center: \(point4Center)")
        
        var plus:UInt = 0
        if input >= lineStart && input <= point2 {
            print("1")
            if input == point2 {
                plus = line
            }
            else if input > point1Center {
                plus = input - point1Center
            }
            else if input < point1Center {
                plus = point1Center - input
            }
        }
        else if input > point2 && input <= point3 {
            print("2")
            if input == point3 {
                plus = line
            }
            else if input > point2Center {
                plus = input - point2Center
            }
            else if input < point2Center {
                plus = point2Center - input
            }
        }
        else if input > point3 && input <= point4 {
            print("3")
            if input == point3 {
                plus = line
            }
            else if input > point3Center {
                plus = input - point3Center
            }
            else if input < point3Center {
                plus = point3Center - input
            }
        }
        else {
            print("4")
            if input == point4 {
                plus = line
            }
            else if input > point4Center {
                plus = input - point4Center
            }
            else if input < point4Center {
                plus = point4Center - input
            }
        }
        print("plus:\(plus)")
        result = line + plus
        print("------")
    }
    
    return result
}

func pow(value:UInt) -> UInt {
    var result:UInt = value
    for i in 1...value {
        value
    }
    return result
}

print("\(solution(input: 1))")
print("\(solution(input: 3))")
print("\(solution(input: 4))")
print("\(solution(input: 17))")
print("\(solution(input: 19))")
print("\(solution(input: 26))")
print("\(solution(input: 2550))")
print("\(solution(input: 2573))")

