# 20210306 coding test



## lv1 ( warming-up ): [링크](https://programmers.co.kr/learn/courses/30/lessons/12903) 

```
func solution(_ s:String) -> String {
    var returnStr: String = ""
    if s.count%2 == 1{
        let startIndex: Int = s.count/2
        let endIndex: Int = s.count/2
        returnStr = cutString(originString: s, fromIndex: startIndex, toIndex: endIndex)
    }
    else {
        let startIndex: Int = s.count/2 - 1
        let endIndex: Int = s.count/2
        returnStr = cutString(originString: s, fromIndex: startIndex, toIndex: endIndex)
    }
    
    return returnStr
}

func cutString(originString: String, fromIndex: Int, toIndex: Int) -> String {
    let firstIndex = originString.index(originString.startIndex, offsetBy: fromIndex)
    let lastIndex = originString.index(originString.startIndex, offsetBy: toIndex)
    return String(originString[firstIndex...lastIndex])
}
```
## lv2: [링크]()
