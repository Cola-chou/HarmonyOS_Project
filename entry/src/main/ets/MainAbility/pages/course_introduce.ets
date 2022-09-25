import router from '@ohos.router';
@Entry
@Component
struct Course_Introduce {
  private introduce:any = router.getParams()['value']
  private tabController: TabsController = new TabsController();
  @State couresState: boolean = true

  @Builder Navigation_Titlebar() {
    Row() {

    }
  }

  @Builder Navigation_Toolbar() {
    Row() {
      Button(this.couresState == false ? '立即参加' : '已参加，进入学习')
        .width('100%')
        .height('100%')
        .backgroundColor('#ff6cdd43')
      //        .margin({top:-20})
    }
    //      .backgroundColor(Color.Green)
    .width('100%')
    .height(30)
    .padding({ left: 10, right: 10 })
    //    .margin({ bottom: -40 })
  }

  build() {
    Navigation(){
            Scroll(){
              Tabs({
                barPosition: BarPosition.Start,
                controller: this.tabController
              }) {
                TabContent() {
                  Column(){
                    Image(this.introduce.imageUrl)
                      .width(200)
                      .height(200)
                    Text(this.introduce.title)
                      .fontSize(20)
                      .backgroundColor(Color.Pink)
                  }
                    .width('100%')
                    .height('100%')
                    .backgroundColor("#aabbcc")
                }
                .size({ width: "100%", height: "100%" })
                .tabBar("课程介绍")

                TabContent() {
                  Column(){
                    Text(this.introduce.outline)
                      .fontSize(20)
                      .backgroundColor(Color.Pink)
                  }
                  .width('100%')
                  .height('100%')
                  .backgroundColor("#ccaabb")
                }
                .size({ width: "100%", height: "100%" })
                .tabBar("课程大纲")

                TabContent() {
                  Column(){
                    Text(this.introduce.title)
                      .fontSize(20)
                      .backgroundColor(Color.Pink)
                  }
                    .width('100%')
                    .height('100%')
                    .backgroundColor("#ccaabb")
                }
                .size({ width: "100%", height: "100%" })
                .tabBar("评价")

              }
              .width('100%')
              .height('200%')
            }
            .width('100%')
            .scrollBar(BarState.On)
            .scrollable(ScrollDirection.Vertical)
    }
    .width('100%')
    .height('100%')
    .title(this.introduce.title)
//    .subTitle('王道')
    .toolBar(this.Navigation_Toolbar())
    // @ts-ignore
    .onTitleModeChange((titleModel: NavigationTitleMode) => {
      titleModel = NavigationTitleMode.Free
    })

  }
}