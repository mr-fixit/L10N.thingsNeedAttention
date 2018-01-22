//: Playground - noun: a place where people can play

import Cocoa

func tr(_ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
}


func needsString(_ args:[String]) -> String {
    switch args.count {
    case 0:
        return tr("needs.0")
    case 1:
        return tr("needs.1", args[0])
    case 2:
        return tr("needs.2", args[0], args[1])
    default:
        return tr("needs.3", args.count-1, args[0])
    }
}

let tests = [[],
             ["Thing1", ],
             ["Thing1", "Thing2"],
             ["Thing1", "Thing2", "Thing3"],
             ["Thing1", "Thing2", "Thing3", "Thing4"],
             ["Thing1", "Thing2", "Thing3", "Thing4", "Thing5"],
]

for test in tests {
    print("\(test.count) - \(needsString(test))")
}

// these are error cases, "needs.3" shouldn't be used with 0 & 1
print(tr("needs.3", 0, "Thing1") )
print(tr("needs.3", 1, "Thing1") )

