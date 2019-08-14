import UIKit

func timeElapsedCode(title: String, operation: ()->()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    print("Time taken By \(title): \(timeElapsed) .")
}

func recursive(str: String) -> String {
    
    let st = str
    let arr = st.filter{$0 == st.first!}
    let arrNot = st.filter{$0 != st.first!}
    var resArr = String()
    if arrNot.count > 0 {
        if arr.count > 1 {
            resArr.append(arr.first!)
        }
        let c = recursive(str: arrNot)
        if c.count > 0 {
            resArr.append(c)
        }
    }
    //print("my duplicates \(resArr)")
    return resArr
    
}
func iteration(str: String) -> String {
    
    let st = str
    var arr = st.filter{$0 == st.first!}
    var arrNot = st.filter{$0 != st.first!}
    var resArr = String()
    if arr.count > 1 {
        resArr.append(arr.first!)
    }
    while(arrNot.count > 0) {
        arr = arrNot.filter{$0 == arrNot.first!}
        arrNot = arrNot.filter{$0 != arrNot.first!}
        if arr.count > 1 {
            resArr.append(arr.first!)
        }
    }
    //print("my duplicates \(resArr)")
    return resArr
    
}

var testString = "chandan kumar dwivedi"

timeElapsedCode(title: "iteration", operation: {_ = iteration(str: testString)})
timeElapsedCode(title: "recursive", operation: {_ = recursive(str: testString)})

