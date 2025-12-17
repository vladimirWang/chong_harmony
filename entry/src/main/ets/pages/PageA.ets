import { HMRouter, HMRouterMgr } from "@hadss/hmrouter"
// import { User } from "./type"

@HMRouter({
  pageUrl: 'PageA'
})
@ComponentV2
export struct PageA {
  @Local names: string[] = []
  aboutToAppear(): void {
    const u: number = HMRouterMgr.getCurrentParam() as number
    console.log('param: ', u)

    for(let i =0;i<3; i++) {
      this.names.push(`name ${i}`)
    }
  }

  egLanes: LengthConstrain = {
    maxLength: 300,
    minLength: 200
  }

  build() {
    Column() {
      // Text("page a")
      // Button("to page b").onClick(() => {
      //   HMRouterMgr.push({
      //     pageUrl: 'PageB'
      //   })
      // })
      // Button("back").onClick(() => {
      //   HMRouterMgr.pop({
      //     param: 'julia'
      //   })
      // })
      Column(){
        List() {
          ForEach(this.names, (item: string) => {
            ListItem() {
              Row({space:10}) {
                // Image($r('app.media.lisaann'))
                //   .width(30).borderRadius('50%')
                Text(item)
                  .layoutWeight(1)
              }
              // .borderRadius(8)
              .width('100%').padding({left: 10, right: 10})
              .backgroundColor(Color.White)
              .height(80)
            }
          }, (item: string, index: number) => index + '')
        }
        .edgeEffect(EdgeEffect.None)
        .divider({color: Color.Gray, strokeWidth: 1, startMargin: 10}).backgroundColor(Color.Red)
        // .lanes(this.egLanes)
        // .width(410)
      }.backgroundColor(Color.Pink)
      .height('100%').width("100%")
    }
  }
}