import { Index_Contents } from '../components/index_contents';
import prompt from '@ohos.prompt';
import { Index_Tabs } from '../components/index_tabs';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State currentIndex: number = 0 //全局选项卡下标，默认为0
  @State Build: Array<Object> = [
    {
      icon: $r('app.media.icon'),
      icon_after: $r("app.media.cola"),
      text: '首页',
      num: 0
    },
    {
      icon: $r('app.media.icon'),
      icon_after: $r("app.media.cola"),
      text: '学习',
      num: 1
    },
    {
      icon: $r('app.media.icon'),
      icon_after: $r("app.media.cola"),
      text: '圈子',
      num: 2
    },
    {
      icon: $r('app.media.icon'),
      icon_after: $r("app.media.cola"),
      text: '我的',
      num: 3
    }
  ]

  @Builder NavigationMenu() {
    if (this.currentIndex == 0) {
      Row({ space: 10 }) {
        Search({ placeholder: '搜索' })
          .layoutWeight(2)
          .textFont({ size: 50 })
          .placeholderFont({ size: 26, weight: 10, family: 'serif', style: FontStyle.Normal })
        Image($r('app.media.icon'))
          .width(25)
          .height(25).margin({ right: 30 })
      }
    }
  }

  @Builder NavigationToolbar() {
    Row() {
      ForEach(this.Build, (item) => {
        Column() {
          Image(this.currentIndex == item.num ? item.icon : item.icon_after)
            .width(25)
            .height(25)
          Text(item.text)
            .fontColor(this.currentIndex == item.num ? '#ff7500' : '#000000')
        }
        .onClick(() => {
          this.currentIndex = item.num
          prompt.showToast({ message: item.text })
        })
        //          .margin({left:70})
        .layoutWeight(1)
      })
    }
  }

  build() {
    //    Column() {
    Navigation() {
      if (this.currentIndex == 0) {
        Index_Contents();
      }
      else if (this.currentIndex == 1) {
        Text('学习')
          .width('100%')
          .height(200)
          .fontSize(40)
      }
      else if (this.currentIndex == 2) {
        Text('圈子')
          .width('100%')
          .height(200)
          .fontSize(40)
      }
      else {
        Text('我的')
          .width('100%')
          .height(200)
          .fontSize(40)
      }
    }
    .hideBackButton(true)
    .toolBar(this.NavigationToolbar())
    .menus(this.NavigationMenu())
    .width('100%')
    //    }
  }
}