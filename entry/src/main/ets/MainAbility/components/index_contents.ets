import router from '@ohos.router';
import { TabItem, CourseItem, getLinkData } from '../models/Model';

@Component
export struct Index_Contents {
  @State index: number = 0 // 一级分类选中索引
  @State requestSuccess: boolean = false // 标识数据是否读取完成
  private scroller: Scroller = new Scroller(); // 滑动套件控制器
  private tabArray: Array<TabItem> = [] // 一级分类数据
  private listArray: Array<CourseItem> = [] // 二级分类数据

  aboutToAppear() {
    //  延时数据加载
    setTimeout(() => {
      // @ts-ignore
      let linkDataItem = getLinkData();
      this.tabArray = linkDataItem.tabArray
      this.listArray = linkDataItem.listArray
//      console.info(JSON.stringify(this.tabArray))
//      console.info(JSON.stringify(this.listArray))
      this.requestSuccess = true;
    }, 2000)
  }

  build() {
    Column() {
      if (this.requestSuccess) {
        Scroll() {
          List({space:1}) {
            ForEach(this.tabArray.map((item1, index1) => {
              return { index: index1, data: item1 };
            }), item => {
              ListItem() {
                Column(){
                  Text(item.data.superName)
                    .fontColor(0x696969)
//                    .backgroundColor(this.index == item.index ? '#ff2eb1ee' : null)
                    .fontSize(this.index == item.index ? 18 : 14)
                    .width('30%')
                    .layoutWeight(9)
                    .textAlign(TextAlign.Center)
                    .onClick(() => {
                      if (this.index != item.index) {
                        this.index = item.index
                        console.warn(JSON.stringify(this.index))
                        this.scroller.scrollToIndex(item.data.position)
                      }
                    })
                    Blank()
                      .width('30%')
                      .layoutWeight(1)
                    .backgroundColor(this.index == item.index?"#ff11ff00":'#fffdfcfd')
                }
                .height('100%')
              }
            }, item => '' + item.data)
          }.width('200%')
          .listDirection(Axis.Horizontal)
        }
        .width('100%')
        .height(30)
        .padding({left:5,right:5})
        .backgroundColor(0xffffff)
        .scrollBar(BarState.On)
        .scrollable(ScrollDirection.Horizontal)

        List({scroller:this.scroller}) {
          ForEach(this.listArray,item=>{
            if(item.tag){
              ListItem(){
                Text(item.courseName)
                  .fontColor(Color.Grey)
                  .fontSize(20)
                  .height(40)
                  .width('100%')
                  .padding({left:10})
                  .backgroundColor('#efefef')
              }.sticky(Sticky.Normal)
            }else{
//              if
              ListItem(){
                Stack({alignContent:Alignment.TopStart}){
                  Image(item.imageUrl)
                    .objectFit(ImageFit.Cover)
                    .width(130)
                    .height(100)
                    .margin({left:10,top:10})
                  Text(item.courseName)
                    .fontColor('#000000')
                    .margin({left:150,top:12})
                    .maxLines(2)
                    .textOverflow({overflow:TextOverflow.Clip})

                  Divider()
                    .margin({ left: 10, right: 10 })
                    .color(0xefefef)
                    .strokeWidth(0.7)
                    .position({ x: 0, y: '100%' })
                    .markAnchor({ x: 0, y: '100%' })
                }
                .height(120)
              }
              .onClick(()=>{
                router.push({
                  url:'pages/course_introduce',
                  params:{value:{
                    title:'课程名称',
                    detail:'课程简介',
                    imageUrl:$r('app.media.cola'),
                    outline:'课程大纲',
                    commnet:'课程评价信息',
                  }}
                })
              })
            }
          },item=>'' + item)
        }
        .layoutWeight(1)
//        .onScrollIndex((firstIndex:number)=>{
//          if (this.index != this.listArray[firstIndex].index){
//            this.index = this.listArray[firstIndex].index
//          }
//        })
      }else{
        Text('数据加载中...')
          .textAlign(TextAlign.Center)
          .width('100%')
          .height('100%')
      }
    }.backgroundColor('#ffffff')
  }
}
