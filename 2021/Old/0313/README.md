# 20210313 coding test


## lv1: [링크](https://programmers.co.kr/learn/courses/30/lessons/12930)
```
func solution(_ s:String) -> String {
    var wordArr = s.split(separator:" ")
    for i in 0..<wordArr.count {
        var newWordArr = Array(wordArr[i])
        for j in 0..<newWordArr.count {
            if j%2 == 0 {
                newWordArr[j] = Substring.Element(String(newWordArr[j]).uppercased())
            }
            else {
                newWordArr[j] = Substring.Element(String(newWordArr[j]).lowercased())
            }
        }
        wordArr[i] = String.SubSequence(newWordArr)
    }
    return wordArr.joined(separator:" ")
}
```
