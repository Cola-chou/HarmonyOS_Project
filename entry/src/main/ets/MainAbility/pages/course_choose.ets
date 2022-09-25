@Entry
@Component
struct Course_Choose {
  private controller: TabsController = new TabsController();
  @State index: number = 0; // 选项卡下标，默认为第一个
  build() {
    Navigation() {
      Scroll() {
        Column() {
          Column() {
            Blank()
              .layoutWeight(2)
            Text('数据结构')
              .fontSize(50)
              .layoutWeight(1)
          }
          .padding({ bottom: 10, left: 10 })
          .width('100%')
          .layoutWeight(1)
          .backgroundColor(Color.Green)
          .alignItems(HorizontalAlign.Start)

          Column() {
            Tabs({ barPosition: BarPosition.Start }) {
              TabContent() {
                Column() {

                }
                .width('100%')
                .height('100%')
                .backgroundColor(Color.Grey)
              }
              .tabBar('公告')

              TabContent() {
                Column() {

                }
                .width('100%')
                .height('100%')
                .backgroundColor(Color.Blue)
              }
              .tabBar('课件')

              TabContent() {
                Column() {

                }
                .width('100%')
                .height('100%')
                .backgroundColor(Color.Black)
              }
              .tabBar('考核')

              TabContent() {
                Column() {

                }
                .width('100%')
                .height('100%')
                .backgroundColor(Color.Red)
              }
              .tabBar('讨论')
            }
          }
          .width('100%')
          .layoutWeight(7)
        }
        .backgroundColor(Color.Pink)
        .width('100%')
        .height('200%')
      }
    }
  }
}