# 20210310 coding test


## lv1: [링크](https://programmers.co.kr/learn/courses/30/lessons/12921)
### 시간초과, 오답
```
func solution(_ n:Int) -> Int {
    var primeNumberCnt: Int = 0
    var primeNumbers:[Int] = [Int]()
    for i in 2..<n+1 {
        for j in 2..<i+1 {
            if getSoutionUseUnderPrimeNumbers(checkNumber: i,primeNumbers: primeNumbers) { // 이방법으로 체크 가능
                primeNumberCnt += 1
                primeNumbers.append(i)
                break
            }
            if i == j { //끝까지 도착? 소수다
                primeNumberCnt += 1
                primeNumbers.append(i)
                break
            }
            if i%j == 0 { // 넌 소수가 아니야
                break
            }
        }
    }
    return primeNumberCnt
}

func getSoutionUseUnderPrimeNumbers(checkNumber: Int ,primeNumbers:[Int]) -> Bool {
    var isPrimeNumber: Bool = true
    for i in 0..<primeNumbers.count {
        if (checkNumber % primeNumbers[i]) == 0 {
            isPrimeNumber = false
            break
        }
    }
    return isPrimeNumber
}
```
### 에라토스테네스의 체
```
func solution(_ n:Int) -> Int {
    var arr = [Int].init(repeating: 0, count: n+1)
    var result = 0
    for index in 2...n {
        arr[index] = index
        
    }
    for index in 2...n {
        if arr[index] == 0 {
            continue
        }
        var j = index + index
        while(j <= n) {
            arr[j] = 0
            j += index
        }
    }
    for index in 2...n {
        if arr[index] != 0 {
            result += 1
        }
    }
    return result
}
```
![Sieve_of_Eratosthenes_animation](https://user-images.githubusercontent.com/60125719/110640364-19d00a80-81f4-11eb-8ce8-d08c0b7876e0.gif)
->
1. 2부터 소수를 구하고자 하는 구간의 모든 수를 나열한다. 그림에서 회색 사각형으로 두른 수들이 여기에 해당한다.
2. 2는 소수이므로 오른쪽에 2를 쓴다. (빨간색)
3. 자기 자신을 제외한 2의 배수를 모두 지운다.
4. 남아있는 수 가운데 3은 소수이므로 오른쪽에 3을 쓴다. (초록색)
5. 자기 자신을 제외한 3의 배수를 모두 지운다.
6. 남아있는 수 가운데 5는 소수이므로 오른쪽에 5를 쓴다. (파란색)
7. 자기 자신을 제외한 5의 배수를 모두 지운다.
8. 남아있는 수 가운데 7은 소수이므로 오른쪽에 7을 쓴다. (노란색)
9. 자기 자신을 제외한 7의 배수를 모두 지운다.
10. 위의 과정을 반복하면 구하는 구간의 모든 소수가 남는다.




```
    func solution(_ n:Int) -> Int {
        var primeNumberCnt: Int = 0
        var checkArr: [Int] = [Int]()
        for i in 2...n {
            checkArr.append(i)
        }
        
        while true {
            if checkArr.count == 0 {
                break
            }
            let checkNumber: Int = checkArr.first!
            for i in 0..<checkArr.count {
                var isPrimeChecked: Bool = false
                if checkNumber == checkArr[i] {
                    primeNumberCnt += 1
                    isPrimeChecked = true
                }
                if isPrimeChecked {
                    isPrimeChecked = false
                    //todo 지금 i의 배수를 다 지워버리자.
                    removeDrainage(arr: &checkArr, origin: checkNumber)
                    break
                }
            }
        }
        return primeNumberCnt
    }
    
    func removeDrainage( arr: inout [Int], origin: Int) {
        var willRemoveIndexArr: [Int] = [Int]()
        for i in 0..<arr.count {
            if arr[i] % origin == 0 {
                willRemoveIndexArr.append(i)
            }
        }
        let sortedWillRemoved = willRemoveIndexArr.sorted(by: { $0 > $1 })
        for i in 0..<sortedWillRemoved.count {
            arr.remove(at: sortedWillRemoved[i])
        }
    }
```
