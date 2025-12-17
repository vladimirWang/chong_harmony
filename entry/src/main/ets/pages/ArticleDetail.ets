import { HMRouter, HMRouterMgr } from "@hadss/hmrouter"
import { AuthorRow } from "../components/AuthorRow";
import { Article } from "../include/Article"
import {articles} from '../mock/articleData'
import dayjs from 'dayjs'

console.log('dayjs format: ', dayjs(new Date(2025, 11, 1)).format("YYYY-MM-DD"))

@HMRouter({
  pageUrl: 'ArticleDetail'
})
@ComponentV2
export struct ArticleDetail{
  uiContext: UIContext = this.getUIContext();
  @Local detailData: Article | undefined = undefined;

  aboutToAppear(): void {
    const articleId: number = HMRouterMgr.getCurrentParam() as number
    this.loadDetail(articleId)
  }
  loadDetail = (id: number) => {
    const article = articles.find((item: Article) => item.id === id)
    if (article === undefined) {
      this.uiContext.getPromptAction().showToast({
        message: '没有找到对应文章',
        duration: 1000
      })
      return;
    }
    this.detailData = article;
  }
  build() {
    Column() {
      if (this.detailData === undefined) {

      } else {
        Text(this.detailData.title).fontSize(20).fontWeight(600)
        AuthorRow({data: this.detailData.author})
        Text(dayjs(this.detailData.publishAt).format("YYYY-MM-DD"))
          .width('100%').textAlign(TextAlign.Start)
        Text(this.detailData.content)
      }
    }.padding(px2vp(50))
  }
}