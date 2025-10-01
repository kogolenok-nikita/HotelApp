import Foundation

struct BodyModel {
    let icon: String
    let title: String
    let detail: String
    
    static func mockData() -> [BodyModel] {
        [
            BodyModel(icon: "happyIcon", title: "Убодства", detail: "Самое необходимое"),
            BodyModel(icon: "tickIcon", title: "Что включено", detail: "Самое необходимое"),
            BodyModel(icon: "closeIcon", title: "Что не включено", detail: "Самое необходимое"),
        ]
    }
}
