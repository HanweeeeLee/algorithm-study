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
```

## lv2:[링크](https://programmers.co.kr/learn/courses/30/lessons/72411)
