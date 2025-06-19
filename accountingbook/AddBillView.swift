import SwiftUI

// 添加账单页面
struct AddBillView: View {
    // 账单数据管理对象，负责账单的增删查存储
    @ObservedObject var store: BillStore
    // 控制弹窗显示的绑定变量
    @Binding var showAdd: Bool

    // 输入的金额（字符串，便于输入）
    @State private var amount: String = ""
    // 输入的备注
    @State private var note: String = ""
    // 选择的日期
    @State private var date = Date()

    var body: some View {
        NavigationView {
            Form {
                // 金额输入框
                TextField("金额", text: $amount)
                    .keyboardType(.decimalPad)
                // 备注输入框
                TextField("备注", text: $note)
                // 日期选择器
                DatePicker("日期", selection: $date, displayedComponents: .date)
            }
            .navigationTitle("添加账单") // 设置导航栏标题
            .toolbar {
                // 左上角取消按钮
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("取消") { showAdd = false }
                }
                // 右上角保存按钮
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("保存") {
                        // 金额转为Double，校验合法性
                        if let amt = Double(amount) {
                            // 创建账单并添加到数据管理器
                            let bill = Bill(date: date, amount: amt, note: note)
                            store.add(bill)
                            // 关闭弹窗
                            showAdd = false
                        }
                    }
                }
            }
        }
    }
}
