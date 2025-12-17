import { HMNavigation, HMPopInfo, HMRouterMgr } from '@hadss/hmrouter';
import { AttributeUpdater } from '@kit.ArkUI';
// import { User } from './type';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  modifier: MyNavModifier = new MyNavModifier();

  build() {
    Column(){
      // 使用HMNavigation容器
      // Button("跳转到 登录页面")
      HMNavigation({
        navigationId: 'MainNavigation',
        // homePageUrl: 'PageA',
        options: {
          // standardAnimator: HMDefaultGlobalAnimator.STANDARD_ANIMATOR,
          // dialogAnimator: HMDefaultGlobalAnimator.DIALOG_ANIMATOR,
          modifier: this.modifier
        }
      }) {
        Column({ space: 10 }) {
          Button("跳转到 登录页面").onClick(() => {
            // const u: User = {
            //   name: 'lisa'
            // }
            HMRouterMgr.push({
              pageUrl: 'PageA',
              param: 1
            }, {
              onResult(popInfo: HMPopInfo) {
                const pageName: string = popInfo.srcPageInfo.name
                // const param: string = popInfo.srcPageInfo.param
                const result = popInfo.result as string
                console.log("popinfo: ", pageName, JSON.stringify(popInfo.srcPageInfo.param), result)
              }
            })
          })
        }
      }
    }
    .height('100%')
    .width('100%')
  }
}

class MyNavModifier extends AttributeUpdater<NavigationAttribute> {
  initializeModifier(instance: NavigationAttribute): void {
    // instance.hideNavBar(true);
  }
}