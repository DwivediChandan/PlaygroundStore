import Foundation

func timeElapsedCode(title: String, operation: ()->()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    print("Time taken By \(title): \(timeElapsed) .")
}

func recursive(str: String) -> String
{
    var remStr = str
    if str.count == 1 {
        return str
    }
    var reverseString = String(remStr.remove(at: remStr.startIndex))
    reverseString = recursive(str: remStr) + reverseString
    return reverseString
}

func iteration(str: String) -> String
{
    var remStr = str
    var reverseString = String(remStr.remove(at: remStr.startIndex))
    while remStr.count >= 1 {
        let fetch = String(remStr.remove(at: remStr.startIndex))
        reverseString = fetch + reverseString
    }
    return reverseString
}

var testString = "chandan kumar dwivedi"
timeElapsedCode(title: "iteration", operation: {_ = iteration(str: testString)})
timeElapsedCode(title: "recursive", operation: {_ = recursive(str: testString)})

