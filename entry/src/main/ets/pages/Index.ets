import { HMLifecycleState, HMNavigation, HMPopInfo, HMRouterMgr } from '@hadss/hmrouter';
import { AttributeUpdater } from '@kit.ArkUI';
// import { User } from './type';
import { FormItem, FormType } from 'module_form';
import { rcp } from '@kit.RemoteCommunicationKit';


@Entry
@ComponentV2
struct Index {
  @Local message: string = 'Hello World';
  modifier: MyNavModifier = new MyNavModifier();
  @Local username: string = '';
  @Local password: string = '';
  private lifecycleOwner = HMRouterMgr.getCurrentLifecycleOwner();

  aboutToAppear(): void {
    console.log("aboutToAppear owner: ", this.lifecycleOwner)
    this.lifecycleOwner?.addObserver(HMLifecycleState.onShown, () => {
      AlertDialog.show({
        message: 'back'
      })
    });
// try {
//   HMRouterMgr.push({
//     pageUrl:"Articles"
//   })
// }catch (e) {
//   AlertDialog.show({
//     message: e.message
//   })
// }
  }

  build() {
    Column() {
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
        Column({ space: px2vp(80) }) {
          Button('test').onClick(() => {
            const session = rcp.createSession();
            const ip = '172.18.224.1'
            const ip2= 'localhost'
            let req = new rcp.Request(`http://${ip}:3000/api/status`, "GET");
            session.fetch(req).then((response) => {
              AlertDialog.show({
                message: 'success' + response.body
              })
              // console.info(`Succeeded in getting the response ${response}`);
            }).catch((err: BusinessError) => {
              AlertDialog.show({
                message: err.message
              })
              console.error(`err: err code is ${err.code}, err message is ${JSON.stringify(err)}`);
            });
          })
          Image($rawfile("logo.webp")).width(px2vp(300))
          // 登录表单，包括登录按钮
          Column({space: px2vp(150)}) {
            Column(){
              FormItem({
                param: {
                  type: FormType.INPUT,
                  inputType: InputType.USER_NAME,
                  label: '用户名'
                },
                value: this.username!!,
              })
              FormItem({
                param: {
                  type: FormType.INPUT,
                  inputType: InputType.Password,
                  label: '密码'
                },
                value: this.password!!,
              })
            }
            Button('to detail').onClick(() => {
              HMRouterMgr.push({
                pageUrl: 'ArticleDetail'
              })
            })
            Button("articles").width('100%').onClick(() => {
              // const u: User = {
              //   name: 'lisa'
              // }
              HMRouterMgr.push({
                pageUrl: 'Articles',
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
            Button("登录").width('100%').onClick(() => {
              // const u: User = {
              //   name: 'lisa'
              // }
              HMRouterMgr.push({
                pageUrl: 'Mine',
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
          }.padding({
            left: px2vp(40),
            right: px2vp(40),
          })
          .backgroundColor(Color.White)
          .borderRadius(4)
        }
        .justifyContent(FlexAlign.Center)
        .height('100%')
        .width('100%')
        .backgroundColor($r("app.color.login_bg_color"))
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