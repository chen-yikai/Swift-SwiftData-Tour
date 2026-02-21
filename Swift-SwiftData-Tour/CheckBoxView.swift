import SwiftUI

struct CheckBoxView: View {
    @Binding var isCheck: Bool

    var body: some View {
        Button {
            isCheck.toggle()
        } label: {
            Image(systemName: isCheck ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundStyle(isCheck ? .blue : .gray)
                .contentTransition(.symbolEffect(.replace))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    @Previewable @State var on = false
    CheckBoxView(isCheck: $on)
}
