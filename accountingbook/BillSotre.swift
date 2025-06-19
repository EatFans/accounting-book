import Foundation

// 账单数据管理类，负责账单的增删查存储
class BillStore: ObservableObject {
    // 所有账单的数组，@Published修饰以便界面自动刷新
    @Published var bills: [Bill] = []
    // 本地存储文件的URL
    let fileURL: URL

    // 初始化方法，设置文件路径并加载本地数据
    init() {
        let manager = FileManager.default
        // 获取App沙盒下的Documents目录
        let doc = manager.urls(for: .documentDirectory, in: .userDomainMask).first!
        // 拼接出账单数据的json文件路径
        fileURL = doc.appendingPathComponent("bills.json")
        load() // 启动时加载本地数据
    }

    // 从本地文件加载账单数据
    func load() {
        // 尝试读取文件内容并解码为账单数组
        if let data = try? Data(contentsOf: fileURL),
           let decoded = try? JSONDecoder().decode([Bill].self, from: data) {
            bills = decoded
        }
    }

    // 保存账单数据到本地文件
    func save() {
        // 尝试将账单数组编码为JSON并写入文件
        if let data = try? JSONEncoder().encode(bills) {
            try? data.write(to: fileURL)
        }
    }

    // 添加一条账单并保存
    func add(_ bill: Bill) {
        bills.append(bill)
        save()
    }

    // 删除指定位置的账单并保存
    func delete(at offsets: IndexSet) {
        bills.remove(atOffsets: offsets)
        save()
    }
}
