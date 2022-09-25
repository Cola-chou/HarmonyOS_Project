// xxx.ets
@Component
export struct VideoCreateComponent {
  @State srcs: Resource = $rawfile('bf.mp4');
  @State previewUris: Resource = $r('app.media.j20');
  @State currentProgressRates: number = 1;
  @State autoPlays: boolean = false;
  @State controlsss: boolean = true;
  controller: VideoController = new VideoController();

  build() {
    Column() {
      Video({
        src: this.srcs,
        previewUri: this.previewUris,
        currentProgressRate: this.currentProgressRates,
        controller: this.controller
      }).width('100%').layoutWeight(1)
        .autoPlay(this.autoPlays)
        .objectFit(ImageFit.None)
        .controls(this.controlsss)
        .onStart(() => {
          console.error('onStart');
        })
        .onPause(() => {
          console.error('onPause');
        })
        .onFinish(() => {
          console.error('onFinish');
        })
        .onError(() => {
          console.error('onFinish');
        })
        .onPrepared((e) => {
          console.error('onPrepared is ' + e.duration);
        })
        .onSeeking((e) => {
          console.error('onSeeking is ' + e.time);
        })
        .onSeeked((e) => {
          console.error('onSeekedis ' + e.time);
        })
        .onUpdate((e) => {
          console.error('onUpdateis ' + e.time);
        })
    }
  }
}
