import Prompt from '@system.prompt'
import {
  ALL_PERCENT,
  COMMON_NUM_DOUBLE,
  COMMON_NUM_DURATION,
  COMMON_NUM_MINUTE,
  MESSAGE,
  SPLIT,
  START_TIME,
  STRING_PERCENT,
  ZERO_STR
} from '../common/constants/BACommonConstants'
import { changeSliderTime } from '../model/BAVideoControll'
import { BAVideoPlaySlider } from './BAVideoPlaySlider'

@Component
export struct BAVideoPlayer {
  private source: string | Resource = ''
  private controller: VideoController = new VideoController()
  private previewUri: Resource = $r('app.media.preview')
  @Provide currentTime: number = 0
  @Provide durationTime: number = 0
  @Provide currentStringTime: string = START_TIME
  @Provide durationStringTime: string = START_TIME
  @Consume flag: boolean
  @Consume isPlay: boolean
  @Consume isOpacity: boolean

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
          if (event) {
            this.currentTime = event.time
            this.currentStringTime = changeSliderTime(event.time)
          }
        })
        .onPrepared((event) => {
          this.prepared(event?.duration)
        })
        .onFinish(() => {
          this.finish()
        })
        .onError(() => {
          Prompt.showToast({
            duration: COMMON_NUM_DURATION,
            message: MESSAGE
          })
        })
      BAVideoPlaySlider({
        controller: this.controller
      })
    }
  }

  finish() {
    this.isPlay = false
    this.isOpacity = false
  }

  prepared(duration: number) {
    this.durationTime = duration
    let second: number = duration % COMMON_NUM_MINUTE
    let min: number = Number.parseInt((duration / COMMON_NUM_MINUTE).toString())
    let head = min < COMMON_NUM_DOUBLE ? `${ZERO_STR}${min}` : min
    let end = second < COMMON_NUM_DOUBLE ? `${ZERO_STR}${second}` : second
    this.durationStringTime = `${head}${SPLIT}${end}`
    this.flag = true
  }
}