# 20210312 coding test


## lv1: [링크](https://programmers.co.kr/learn/courses/30/lessons/12910?language=swift)
```
func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    var returnArr: [Int] = [Int]()
    for i in 0..<arr.count {
        if arr[i]%divisor == 0 {
            returnArr.append(arr[i])
        }
    }
    if returnArr.count == 0 {
        returnArr.append(-1)
    }
    return returnArr.sorted(by: {$0 < $1})
}
```

## lv2 [링크](https://programmers.co.kr/learn/courses/30/lessons/42578)

### 시간초과
```
func solution(_ clothes:[[String]]) -> Int {
    var totalCase: Int = 0
    var allItems: [String : [String]] = [String : [String]]()
    for i in 0..<clothes.count { // 아이템 정리하기
        if allItems[clothes[i][1]] == nil {
            allItems[clothes[i][1]] = [String]()
        }
        allItems[clothes[i][1]]?.append(clothes[i][0])
    }
//        print("allItems:\(allItems)")
    
    for i in 0..<allItems.count { //n개를 착용한다.
        wearItem(restItems: allItems, restWearChance: i+1, totalCnt: &totalCase)
    }
    return totalCase
}

func wearItem( restItems: [String : [String]], restWearChance: Int, totalCnt: inout Int) {
    var restItemsCopy = restItems
    if restWearChance == 0 {
        totalCnt += 1
        return
    }
    let allKeys = Array(restItemsCopy.keys)
    for i in 0..<allKeys.count {
        for _ in 0..<restItemsCopy[allKeys[i]]!.count {
            restItemsCopy[allKeys[i]] = nil
            wearItem(restItems: restItemsCopy, restWearChance: restWearChance - 1, totalCnt: &totalCnt)
        }
    }
}
```

### 통과
```
func solution(_ clothes:[[String]]) -> Int {
    var totalCase: Int = 1
    var allItems: [String : [String]] = [String : [String]]()
    for i in 0..<clothes.count { // 아이템 정리하기
        if allItems[clothes[i][1]] == nil {
            allItems[clothes[i][1]] = [String]()
        }
        allItems[clothes[i][1]]?.append(clothes[i][0])
    }
    
    let allKeys = Array(allItems.keys)
    for i in 0..<allKeys.count {
        totalCase = totalCase * (allItems[allKeys[i]]!.count + 1)
    }
    totalCase -= 1
    return totalCase
}
```
