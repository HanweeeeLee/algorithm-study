# 소수 찾기 20210706 lv2
[Link](https://programmers.co.kr/learn/courses/30/lessons/42839)  
문제 설명
한자리 숫자가 적힌 종이 조각이 흩어져있습니다. 흩어진 종이 조각을 붙여 소수를 몇 개 만들 수 있는지 알아내려 합니다.

각 종이 조각에 적힌 숫자가 적힌 문자열 numbers가 주어졌을 때, 종이 조각으로 만들 수 있는 소수가 몇 개인지 return 하도록 solution 함수를 완성해주세요.

제한사항
numbers는 길이 1 이상 7 이하인 문자열입니다.
numbers는 0~9까지 숫자만으로 이루어져 있습니다.
"013"은 0, 1, 3 숫자가 적힌 종이 조각이 흩어져있다는 의미입니다.
입출력 예
numbers    return
"17"    3
"011"    2
입출력 예 설명
예제 #1
[1, 7]으로는 소수 [7, 17, 71]를 만들 수 있습니다.

예제 #2
[0, 1, 1]으로는 소수 [11, 101]를 만들 수 있습니다.

11과 011은 같은 숫자로 취급합니다.
```
var primeNumberCnt: Int = 0
var registedPrimeNumberPool: Set<Int> = []
func solution(_ numbers: String) -> Int {
    let numbersArr = Array(numbers)
    primeNumberCnt = 0
    registedPrimeNumberPool.removeAll()
    
    search(numbersArr, number: "")
    
    return primeNumberCnt
}

func isPrimeNumber(_ numbers: Int) -> Bool {
    if numbers <= 1 {
        return false
    }
    if numbers == 2 || numbers == 3 {
        return true
    }
    for index in 2...(numbers/2) {
        if numbers % index == 0 {
            return false
        }
    }
    return true
}

func search(_ map: [Character], number: String) {
    
    if map.count == 0 {
        return
    }
    for i in 0..<map.count {
        let item = map[i]
        var newNumber: String = number
        newNumber.append(item)
        let newNumberInt: Int = Int(newNumber)!
        if isPrimeNumber(newNumberInt) {
            if !registedPrimeNumberPool.contains(newNumberInt) {
                primeNumberCnt += 1
                registedPrimeNumberPool.insert(newNumberInt)
            }
        }
        var copyMap = map
        copyMap.remove(at: i)
        search(copyMap, number: newNumber)
    }
    
}
```
