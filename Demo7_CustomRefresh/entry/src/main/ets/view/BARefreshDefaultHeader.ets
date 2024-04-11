import BAConstants from '../common/constants/BAConstants'
import { BARefreshConstants, BARefreshState } from '../common/constants/BARefreshConstants'
import BADimensionUtil from '../common/utils/BADimensionUtil'

@Component
export default struct BARefreshDefaultHeader {
  @State refreshTitle: Resource = $r('app.string.refresh_default_header_hint')
  @Consume(BARefreshConstants.REFRESH_STATE_TAG) @Watch('onStateCheck') state: number

  private onStateCheck() {
    switch (this.state) {
      case BARefreshState.IDLE:
        this.refreshTitle = $r('app.string.refresh_default_header_hint')
        break;
      case BARefreshState.DRAGGING_REFRESHABLE:
        this.refreshTitle = $r('app.string.refresh_default_header_load')
        break;
      case BARefreshState.REFRESHING:
        this.refreshTitle = $r('app.string.refresh_default_header_loading')
        break;

      default:
        break;
    }
  }

  build() {
    if (this.state !== BARefreshState.IDLE) {
      Text(this.refreshTitle)
        .height(BAConstants.Full_Length)
        .width(BAConstants.Full_Length)
        .textAlign(TextAlign.Center)
        .fontSize(BADimensionUtil.getFp($r('app.float.default_header_font_size')))
        .onAppear(() => {
          this.onStateCheck()
        })
    }
  }
}