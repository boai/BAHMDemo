import { ALL_PERCENT, STRING_PERCENT } from '../common/constants/BACommonConstants'
import { BAVideoPlaySlider } from './BAVideoPlaySlider'

@Component
export struct BAVideoPlayer {

  private source: string | Resource = ''
  private controller: VideoController = new VideoController()
  private previewUri: Resource = $r('app.media.preview')


  build() {
    Column() {
      Video({
        src: this.source,
        previewUri: this.previewUri,
        controller: this.controller
      })
        .width(ALL_PERCENT)
        .height(STRING_PERCENT.NINETY_PERCENT)
        .controls(false)
        .autoPlay(false)
        .objectFit(ImageFit.Contain)
        .loop(false)
        .onUpdate((event) => {

        })
        .onPrepared((event) => {

        })
        .onFinish(() => {

        })
        .onError(() => {

        })
      BAVideoPlaySlider({
        controller: this.controller
      })
    }
  }
}