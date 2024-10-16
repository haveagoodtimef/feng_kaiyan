import { router } from '@kit.ArkUI';
import { RoutePath } from '../router/RoutePath';

/**
 * 欢迎页
 */
@Entry
@Component
struct SplashPage {

  aboutToAppear(): void {
    setTimeout(() => {
      //业务跳转
      router.replaceUrl({ url: RoutePath.MainPage })
    },2000)
  }

  //index 完成
  build() {
    Stack(){
      Image($r('app.media.landing_image')).objectFit(ImageFit.ScaleDown)
    }.width("100%").height("100%").backgroundColor($r("app.color.color_white")).alignContent(Alignment.Center)
  }
}