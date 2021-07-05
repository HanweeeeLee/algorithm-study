# 20210705 lv2 타겟 넘버

[Link](https://programmers.co.kr/learn/courses/30/lessons/43165?language=swift)
문제 설명
n개의 음이 아닌 정수가 있습니다. 이 수를 적절히 더하거나 빼서 타겟 넘버를 만들려고 합니다. 예를 들어 [1, 1, 1, 1, 1]로 숫자 3을 만들려면 다음 다섯 방법을 쓸 수 있습니다.

-1+1+1+1+1 = 3
+1-1+1+1+1 = 3
+1+1-1+1+1 = 3
+1+1+1-1+1 = 3
+1+1+1+1-1 = 3
사용할 수 있는 숫자가 담긴 배열 numbers, 타겟 넘버 target이 매개변수로 주어질 때 숫자를 적절히 더하고 빼서 타겟 넘버를 만드는 방법의 수를 return 하도록 solution 함수를 작성해주세요.

제한사항
주어지는 숫자의 개수는 2개 이상 20개 이하입니다.
각 숫자는 1 이상 50 이하인 자연수입니다.
타겟 넘버는 1 이상 1000 이하인 자연수입니다.
입출력 예
numbers    target    return
[1, 1, 1, 1, 1]    3    5
입출력 예 설명
문제에 나온 예와 같습니다.

```
var gTarget: Int = 0
    var totalCnt: Int = 0
    func solution(_ numbers: [Int], _ target: Int) -> Int {
        gTarget = target
        
        search(currentArr: numbers, plusFlag: true, sum: 0)
        search(currentArr: numbers, plusFlag: false, sum: 0)
        
        return totalCnt
    }
    
    func search(currentArr: [Int], plusFlag: Bool, sum: Int) {
        
        let first: Int = currentArr[0]
        var newCurrentArr = currentArr
        newCurrentArr.removeFirst()
        var newSum: Int = sum
        if plusFlag {
            newSum = newSum + first
        } else {
            newSum = newSum - first
        }
        if newCurrentArr.count == 0 {
            if newSum == gTarget {
                totalCnt += 1
            }
            return
        }
        search(currentArr: newCurrentArr, plusFlag: true, sum: newSum)
        search(currentArr: newCurrentArr, plusFlag: false, sum: newSum)
    }
```
