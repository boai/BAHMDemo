import display from '@ohos.display';
import BAConstants from '../common/constants/BAConstants';
import BARefreshComponent from '../view/BARefreshComponent';
import { BARefreshHeaderStyle, BARefreshState, BARefreshConstants } from '../common/constants/BARefreshConstants';
import BADimensionUtil from '../common/utils/BADimensionUtil';
import { BAGlobalContext } from '../common/utils/BAGlobalContext';

@Component
export default struct BAFileManagerIndex {
  @Provide(BARefreshConstants.REFRESH_STATE_TAG) state: number = BARefreshState.REFRESHING;
  private deviceDisplay: display.Display = BAGlobalContext.getContext().getObject('display') as display.Display;

  @Builder
  ContentBody() {
    Image($r('app.media.bg_content'))
      .width(BAConstants.Full_Length)
      .height(BADimensionUtil.getVp($r('app.float.content_height')))
      .objectFit(ImageFit.Fill)
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Text($r('app.string.file_index_title'))
        .backgroundColor(Color.White)
        .width(BAConstants.Full_Length)
        .height(BADimensionUtil.getVp($r('app.float.file_index_title_height')))
        .fontSize(BADimensionUtil.getFp($r('app.float.file_index_title_size')))
        .fontWeight(FontWeight.Regular)
        .padding({ left: BADimensionUtil.getVp($r('app.float.file_index_title_padding')) })
        .zIndex(BAConstants.FILE_MANAGER_Z_INDEX)

      BARefreshComponent({
        headerStyle: BARefreshHeaderStyle.CLOUD,
        itemLayout: (): void => this.ContentBody(),
        displayHeight: (px2vp(this.deviceDisplay.height) - BADimensionUtil.getVp($r('app.float.file_index_title_height'))),
        onRefresh: () => {
          setTimeout(() => {
            this.state = BARefreshState.COMPLETE
          }, BAConstants.REFRESH_DEFAULT_TIMEOUT)
        }
      })
        .width(BAConstants.Full_Length)
        .margin({
          top: BADimensionUtil.getVp($r('app.float.file_index_title_height'))
        })
    }
    .height(BAConstants.Full_Length)
  }
}