
@Component
struct Index_Tabs{
  private tabController: TabsController = new TabsController();
  build(){
    Scroll(){
        Tabs({
          barPosition: BarPosition.Start,
          controller: this.tabController
        }) {
          TabContent() {
            Column()
              .width('100%')
              .height('100%')
              .backgroundColor("#aabbcc")
          }
          .size({ width: "100%", height: "100%" })
          .tabBar("推荐")

          TabContent() {
            Column()
              .width('100%')
              .height('100%')
              .backgroundColor("#bbccaa")
          }
          .size({ width: "100%", height: "100%" })
          .tabBar("外语")

          TabContent() {
            Column()
              .width('100%')
              .height('100%')
              .backgroundColor("#ccaabb")
          }
          .size({ width: "100%", height: "100%" })
          .tabBar("考研")

          TabContent() {
            Column()
              .width('100%')
              .height('100%')
              .backgroundColor("#ccaabb")
          }
          .size({ width: "100%", height: "100%" })
          .tabBar("计算机")

          TabContent() {
            Column()
              .width('100%')
              .height('100%')
              .backgroundColor("#ccaabb")
          }
          .size({ width: "100%", height: "100%" })
          .tabBar("心理学")

          TabContent() {
            Column()
              .width('100%')
              .height('100%')
              .backgroundColor("#ccaabb")
          }
          .size({ width: "100%", height: "100%" })
          .tabBar("音乐与艺术")
        }
      .width('100%')
    }
    .width('100%')
    .scrollBar(BarState.On)
    .scrollable(ScrollDirection.Horizontal)

//    .border({width:5})
  }
}
export {Index_Tabs}