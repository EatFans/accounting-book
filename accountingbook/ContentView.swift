import SwiftUI

struct ContentView: View {
    // 账单数据管理对象，负责账单的增删查存储
    @StateObject var store = BillStore()
    // 控制是否弹出添加账单页面
    @State private var showAdd = false

    var body: some View {
        NavigationView {
            // 列表展示所有账单
            List {
                ForEach(store.bills) { bill in
                    // 每条账单的展示内容
                    VStack(alignment: .leading) {
                        Text("金额：\(bill.amount, specifier: "%.2f") 元")
                        Text("备注：\(bill.note)")
                        Text("日期：\(bill.date, formatter: dateFormatter)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                // 支持左滑删除账单
                .onDelete(perform: store.delete)
            }
            .navigationTitle("记账本") // 设置导航栏标题
            .toolbar {
                // 右上角添加按钮，点击弹出添加账单页面
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showAdd = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            // 弹出添加账单页面
            .sheet(isPresented: $showAdd) {
                AddBillView(store: store, showAdd: $showAdd)
            }
        }
    }
}

// 日期格式化器，用于将日期对象转为字符串显示
private let dateFormatter: DateFormatter = {
    let f = DateFormatter()
    f.dateStyle = .short
    f.timeStyle = .short
    return f
}()
