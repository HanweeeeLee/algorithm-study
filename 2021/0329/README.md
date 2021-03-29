# 20210329 coding test


## lv1: [링크](https://programmers.co.kr/learn/courses/30/lessons/12922)
```
func solution(_ n:Int) -> String {
    var returnStr: String = ""
    for i in 0..<n {
        if i%2 == 0 {
            returnStr = returnStr + "수"
        }
        else {
            returnStr = returnStr + "박"
        }
    }
    return returnStr
}
// ㅡㅡ???????????????????
```
