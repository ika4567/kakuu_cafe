# KakuuCafe

## サイト概要
お店のホームページで商品の取り置き・テイクアウトの予約受付ができるサイトです。  
このサイトでは、焼き菓子などの事前に在庫数が分かっている商品の取り置き予約をSNSにて個々に対応している  
個人経営のお店をモデルに想定しており、このサイトを使うことでオペレーションの効率化に繋げることを目的としています。

#### 利用方法  
- お店（管理者）  
ログインをするとトップページにて、現在の予約受付中の商品と残りの在庫数、その日の予約一覧（予約者名と商品名、個数、  
来店予定時間、予約形態（取り置き又はテイクアウト）を確認できます。  
また、商品一覧から商品の新規登録、任意の商品を予約受付中の状態にできます。  
- お客さん（利用者）  
新規登録をすると商品の予約ができ、商品の残りが0になった場合は売り切れ表示となって予約できないことが  
一目で確認できます。  
マイページからは予約履歴が見られる他、当日の予約受付時間内（10時~17時）であれば変更・キャンセルを行えます。

### サイトテーマ
商品の予約サイト

### テーマを選んだ理由
個人経営のカフェが好きでよく行くのですが、焼き菓子などの取り置きを電話やSNSのメッセージで対応しているお店を度々見かけます。  
その際に、接客しながら対応するのが大変そうであることや、お客さんがお店からの返事があるまで取り置きが出来たか分からないといった　　
状態が気になっており、お店とお客さんの両者がやりとりをしやすい機能を作りたいと思ってこのテーマを選びました。

### ターゲットユーザ
SNSなどで個別に予約対応をしているカフェの店主とお客さん

### 主な利用シーン
##### お店側
- 商品の登録と登録情報（商品名、在庫数、金額）の変更、予約受付状態を変更する時  
- 予約情報の確認  
- 有事の際に予約者と連絡を取るために登録された連絡先を確認  
- 主にタブレット、PCでの利用を想定  
##### お客さん側
- 商品の予約と、予約履歴の確認と変更をしたい時  
- スマートフォン、タブレット、PCでの利用を想定

## 設計書
- ER図（https://drive.google.com/file/d/1YDpFaHUIfjFJZgzb7QjOFY1eVhHC_w7R/view?usp=sharing）  
- 詳細設計（https://docs.google.com/spreadsheets/d/10dwjo2iedZkkcS5pvrhK5YKagzLHB1zZ/edit?usp=sharing&ouid=100218744179510469030&rtpof=true&sd=true）  
- テーブル定義書（https://docs.google.com/spreadsheets/d/1CYLkT9-uA1frpf16-sDxiRpexHRB3MOA4vBMMroEwZc/edit?usp=sharing）

## チャレンジ要素一覧
https://docs.google.com/spreadsheets/d/14wHK9J2mg0Eumyfoxvs9ONKEIP2c2rOXY5ZJbpi3HVA/edit?usp=sharing

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
- Free Logo Maker, Create Custom Logo Designs Online – DesignEvo（https://www.designevo.com/）
