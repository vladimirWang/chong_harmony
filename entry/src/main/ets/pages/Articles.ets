import { HMNavigation, HMPopInfo, HMRouter, HMRouterMgr } from '@hadss/hmrouter';
import { AttributeUpdater } from '@kit.ArkUI';
// import { User } from './type';
import { FormItem, FormType } from 'module_form';
import { ArticleItem } from '../components/ArticleItem';
import { Article, Author } from '../include/Article';
import { articles } from '../mock/articleData';


@HMRouter({
  pageUrl: 'Articles'
})
@ComponentV2
export struct Articles {
  @Local articles: Article[] =[]

  loadArticles():void {
    this.articles = articles
  }
  aboutToAppear(): void {
    this.loadArticles();
  }

  build() {
    Column() {
      List({space: px2vp(20)}) {
        Repeat<Article>(this.articles).each((obj:RepeatItem<Article>) => {
          ListItem(){
            ArticleItem({
              data: obj.item
            }).onClick(() => {
              HMRouterMgr.push({
                pageUrl: 'ArticleDetail',
                param: obj.item.id
              })
            })
          }
        }).key((item:Article, index:number) => item.id +'')
      }
      .backgroundColor($r('app.color.shallow_gray'))
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