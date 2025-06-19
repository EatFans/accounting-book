import Foundation

// 账单数据结构，遵循Identifiable和Codable协议，方便列表展示和本地存储
struct Bill: Identifiable, Codable {
    // 每条账单的唯一标识
    var id = UUID()
    // 账单日期
    var date: Date
    // 账单金额
    var amount: Double
    // 账单备注
    var note: String
}
