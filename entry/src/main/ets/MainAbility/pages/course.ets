import  {VideoCreateComponent}  from '../components/video'
@Entry
@Component
struct Course {
  build() {
    Navigation() {
      Scroll() {
        Column() {
            Row(){
                VideoCreateComponent();
            }
          .width('100%')
          .layoutWeight(1)
          Column() {

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