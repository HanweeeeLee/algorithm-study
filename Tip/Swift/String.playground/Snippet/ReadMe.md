# Snippet

## QuickSort
[명쾌한 해설](https://coderkoo.tistory.com/7)
> Swift 코드 구현
```
func quickSort(sorted: [Int]) -> [Int] {
    if sorted.count == 0 {
        return []
    }
    
    var copySorted = sorted
    let pivot = sorted[0]
    var pivotIndex: Int = 0
    var checkedIndex: Int = 1
    
    for _ in 1..<copySorted.count {
        if pivot > copySorted[checkedIndex] {
            let tmp: Int = copySorted[checkedIndex]
            copySorted.remove(at: checkedIndex)
            copySorted.insert(tmp, at: pivotIndex)
            checkedIndex += 1
            pivotIndex += 1
        }
        else if pivot == copySorted[checkedIndex] {
            checkedIndex += 1
        }
        else {
            // 원래 오른쪽에 있었으니 냅둔다.
            checkedIndex += 1
        }
    }
    let leftRange = 0..<pivotIndex
    let rightRange = pivotIndex+1..<copySorted.count
    let leftArr: [Int] = Array(copySorted[leftRange])
    copySorted.removeSubrange(leftRange)
    copySorted.insert(contentsOf: quickSort(sorted: leftArr), at: 0)
    let rightArr: [Int] = Array(copySorted[rightRange])
    copySorted.removeSubrange(rightRange)
    copySorted.append(contentsOf: quickSort(sorted: rightArr))
    
    return copySorted
}
```

