import { HMNavigation, HMPopInfo, HMRouter, HMRouterMgr } from '@hadss/hmrouter';
import { AttributeUpdater } from '@kit.ArkUI';
// import { User } from './type';
import { FormItem, FormType } from 'module_form';


@HMRouter({
  pageUrl: 'Mine'
})
@ComponentV2
export struct Mine {
  @Local message: string = 'Hello World';
  modifier: MyNavModifier = new MyNavModifier();
  @Local avatarUrl: string = '';
  @Local name: string = '';
  @Local gender: number = 0;
  @Local phone: string = '';
  @Local birthDate: Date | null = null;
  @Local addr: string = '';

  build() {
    Column() {
      Column({ space: 10 }) {
        Column
        () {
          FormItem
          ({
            param
            : {
              type
              : FormType.AVATAR,
              label: '头像'
            ,
            },
            value: this.avatarUrl!!,
          })
          FormItem
          ({
            param: {
              type: FormType.INPUT,
              label: '昵称'
            },
            value: this.name!!,
          })
          FormItem
          ({
            param: {
              type: FormType.GENDER,
              label: '性别'
            },
            numberV: this.gender!!,
          })
          FormItem({
            param: {
              type: FormType.INPUT,
              inputType: InputType.PhoneNumber,
              label: '手机号'
            },
            value: this.phone!!,
          })
          FormItem({
            param: {
              type: FormType.DATE,
              label: '生日',
            },
            dateV: this.birthDate!!,
          })
          FormItem
          ({
            param: {
              type: FormType.ADDRESS,
              label: '所在地区',
              last: true,
            },
            value: this.addr!!,
          })
        }.padding(10)
        .backgroundColor(Color.White)
        .borderRadius(4)

        Button("跳转到 登录页面111").onClick(() => {
          // const u: User = {
          //   name: 'lisa'
          // }
          HMRouterMgr.push({
            pageUrl: 'User',
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
    .height('100%')
    .width('100%')
  }
}

class MyNavModifier extends AttributeUpdater<NavigationAttribute> {
  initializeModifier(instance: NavigationAttribute): void {
    // instance.hideNavBar(true);
  }
}