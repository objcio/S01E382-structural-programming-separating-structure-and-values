//

import Foundation
import Structural

struct Simple: Structural {
    var foo: String
    var bar: Date

    typealias Structure = Struct<List<Property<String>, List<Property<Date>, Empty>>>

    static var structure: Structure {
        Struct(name: "Simple", properties: List(head: Property(name: "foo"), tail: List(head: Property(name: "bar"), tail: Empty())))
    }

    var to: Structure.Value {
        (foo, (bar, ()))
    }

    static func from(_ s: Structure.Value) -> Self {
        .init(foo: s.0, bar: s.1.0)
    }
}


//@Structural
//struct Book {
//    var title: String
//    var published: Date
//    var authors: String
//    var updated: Bool
//    var description: String = "My book description"
//    var lastUpdate: Date = .distantPast
//}
//
//@Structural
//struct BookUpdate {
//    var description: String
//    var date: Date
//}
//
//@Structural
//enum Test {
//    case one
//    case two(String, label: Int)
//    case three
//}
//
//@Structural
//enum BookType {
//    case paperback
//    case hardcover(title: String, published: Date)
//}
