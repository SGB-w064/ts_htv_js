*start

[cm]
[clearfix]
[start_keyconfig]

[bg storage="pictoroom.jpg" time="100"]

;メニューボタンの表示
@showmenubutton

;メッセージウィンドウの設定
[position layer="message0" left=160 top=500 width=1000 height=200 page=fore visible=true]

;文字が表示される領域を調整
[position layer=message0 page=fore margint="45" marginl="50" marginr="70" marginb="60"]


;メッセージウィンドウの表示
@layopt layer=message0 visible=true

;キャラクターの名前が表示される文字領域
[ptext name="chara_name_area" layer="message0" color="white" size=28 bold=true x=180 y=510]

;上記で定義した領域がキャラクターの名前表示であることを宣言（これがないと#の部分でエラーになります）
[chara_config ptext="chara_name_area"]

;このゲームで登場するキャラクターを宣言
;picto
[chara_new  name="picto" storage="chara/picto/normal.png" jname="picto"  ]
;キャラクターの表情登録
[chara_face name="picto" face="angry" storage="chara/picto/angry.png"]
[chara_face name="picto" face="doki" storage="chara/picto/doki.png"]
[chara_face name="picto" face="happy" storage="chara/picto/happy.png"]
[chara_face name="picto" face="sad" storage="chara/picto/sad.png"]

;クイックセーブボタン
[button name="role_button" role="quicksave" graphic="button/qsave.png" enterimg="button/qsave2.png" x="40" y="690"]

;クイックロードボタン
[button name="role_button" role="quickload" graphic="button/qload.png" enterimg="button/qload2.png" x="140" y="690"]

;セーブボタン
[button name="role_button" role="save" graphic="button/save.png" enterimg="button/save2.png" x="240" y="690"]

;ロードボタン
[button name="role_button" role="load" graphic="button/load.png" enterimg="button/load2.png" x="340" y="690"]

;オートボタン
[button name="role_button" role="auto" graphic="button/auto.png" enterimg="button/auto2.png" x="440" y="690"]

;スキップボタン
[button name="role_button" role="skip" graphic="button/skip.png" enterimg="button/skip2.png" x="540" y="690"]

;バックログボタン
[button name="role_button" role="backlog" graphic="button/log.png" enterimg="button/log2.png" x="640" y="690"]

;フルスクリーン切替ボタン
[button name="role_button" role="fullscreen" graphic="button/screen.png" enterimg="button/screen2.png" x="740" y="690"]

;コンフィグボタン（※sleepgame を使用して config.ks を呼び出しています）
[button name="role_button" role="sleepgame" graphic="button/sleep.png" enterimg="button/sleep2.png" storage="config.ks" x="840" y="690"]

;メニュー呼び出しボタン（※ロールボタンを使うなら不要）
[button name="role_button" role="menu" graphic="button/menu.png" enterimg="button/menu2.png" x="940" y="690"]

;メッセージウィンドウ非表示ボタン
[button name="role_button" role="window" graphic="button/close.png" enterimg="button/close2.png" x="1040" y="690"]

;タイトルに戻るボタン
[button name="role_button" role="title" graphic="button/title.png" enterimg="button/title2.png" x="1140" y="690"]

;;ロールボタン追加終わり

;キャラクター登場
[chara_show  name="picto"  ]
#
こんにちは。[l][r]

[chara_mod name="picto" face="happy"]
#
今回はティラノスクリプトでJavaScriptを動かす方法について解説していきます。[p]

[chara_mod name="picto" face="default"]
#
[text val="基本となるタグは[iscript]/[endscript]と[loadjs]です。"][l][r]
このタグを使うとJavaScriptを書き込んだり読み込んだり出来ます。[p]

#
その前に、ティラノスクリプトでJavaScriptを動かす時に大事なことがあります。[p]

#
それはゲーム内で呼び出す変数名は必ず「f.変数名」「sf.変数名」「tf.変数名」というものにするということです。[l][r]
また、変数名の部分は数字で始まってはいけないです。[p]

#
「f.変数名」はセーブデータに関わる変数、「sf.変数名」はシステム全体で共有する変数
「tf.変数名」はゲームを終了すると消える変数となっています。[p]

#
[text val="変数は[emb]のタグを使えばシーンファイル内で使えます。"]

#
[text val="まず、[iscript]/[endscript]でJavaScriptを書いていきます。"][l][r]
最初にゲーム内で適当な変数を入力。[p]

*input_start

;指定したレイヤーを非表示にする
[layopt layer="message0" visible="false"]

;入力欄の画像ファイルを別のレイヤーに呼び出す
[image layer="1" storage="input_menu.png" x="0" y="0" visible="true"]

;入力場所の指定
[edit name="f.input" left="300" top="300" width="660" height="100" size="90" maxchars="10" initial="10"]

[button graphic="config/arrow_next.png" target="commit_start" x="600" y="450"]
[s]

;input to var
*commit_start

;このタグでnameで指定された変数に入力した数値が入る
[commit]

;画面の状態を開放する。(レイヤーを消し飛ばす)
[cm]

;入力欄を入れたレイヤーの中身を消し飛ばす
[freeimage layer="1"]

;デフォルトのテキスト欄を表示する
[layopt layer="message0" visible="true"]

;変数の表示
#
入力したのは[emb exp="f.input"]。[p]

#
[text val="今から入力した文字を[iscript]/[endscript]で操作します。"][l][r]

この画像のようにスクリプトを書きます。
[chara_move name="picto" left="720"]
[image storage="iscript.png" layer="1" visible="true" x="325" y="215"]
[p]

;inputをJavaScriptで色々いじる
[iscript]

// 入力された変数が文字か数字かを判別
if(Number(f.input)){
    f.var_type = typeof(Number(f.input))
} else {
    f.var_type = typeof(f.input)   
}

[endscript]

#
このように変数内の文字を操作したり、変数を新しく定義したり出来ます。[p]

[freeimage layer="1"]
[chara_move name="picto" left="380"]

#
なお、先程の結果は[emb exp="f.var_type"]となります。[p]

#
このタグはシーンファイルの中に書き込むため、JavaScriptの行数が長くなると見辛いという点があります。[l][r]
[chara_mod name="picto" face="happy"]
[text val="そのような時に使えるのが[loadjs]です。"][p]

[chara_mod name="picto" face="default"]
#
[text val="[loadjs]はJavaScriptのファイルを別に作り、それを読み込むような形になっています。"][l][r]
実際にこの画像のように書いていきます。[p]

[chara_move name="picto" left="720"]
[image storage="loadjs.png" layer="1" visible="true" x="85" y="200"]
[p]

[loadjs storage="weather.js"]

#
今回は京都府の今日の天気を取得するコードを書きました。[l][r]
現在地を取得するようなコードと組み合わせると面白くなると思います。[p]

#
結果は[emb exp="f.weather"]です。[p]

[freeimage layer="1"]
[chara_move name="picto" left="380"]

#
基本的なJavaScriptの動かし方はこのようになっています。[l][r]
[chara_mod name="picto" face="happy"]
これを参考にすれば、皆さんも色々と実装していけると思います。[p]

[chara_mod name="picto" face="default"]
#
最後に、先程の天気を取得するJavaScriptを拡張して新しいタグを作成しました。[p]
[text val="新しく作ったタグは[weather]で、他の都道府県の天気も取得できるようにしました。"][l][r]
実際に使用していきたいと思います。[p]

;タグを登録する
[loadjs storage="weather/weather.js"]

;メッセージボックスを非表示
@layopt layer=message0 visible=false

;ボタン配置座標の変数(最大10個の前提)
[iscript]
f.button_width = 400;
f.pos_x = [320-f.button_width/2, 960-f.button_width/2];
f.pos_y = [144*0+30, 144*1+30, 144*2+30, 144*3+30, 144*4+30];
[endscript]

*select_regions

;地方を選択するボタンを配置していく
[cm]
[freeimage layer="1"]

;背景
[image storage="weather/japan_back.png" layer="1"]
;それぞれの地方の画像(ボタン)
;北海道
[glink text="北海道" exp="f.area = '北海道'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[0]" width="&f.button_width"]
;東北
[glink text="東北" exp="f.area = '東北'" target="*select_prefecture" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[1]" width="&f.button_width"]
;関東
[glink text="関東" exp="f.area = '関東'" target="*select_prefecture" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[2]" width="&f.button_width"]
;中部
[glink text="中部" exp="f.area = '中部'" target="*select_prefecture" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[3]" width="&f.button_width"]
;近畿
[glink text="近畿" exp="f.area = '近畿'" target="*select_prefecture" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[4]" width="&f.button_width"]
;中国
[glink text="中国" exp="f.area = '中国'" target="*select_prefecture" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[1]" width="&f.button_width"]
;四国
[glink text="四国" exp="f.area = '四国'" target="*select_prefecture" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[2]" width="&f.button_width"]
;九州
[glink text="九州" exp="f.area = '九州'" target="*select_prefecture" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[3]" width="&f.button_width"]
;沖縄
[glink text="沖縄" exp="f.area = '沖縄'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[4]" width="&f.button_width"]

[s]

*select_prefecture
;都道府県を選択するが、先にf.areaに地方を代入して条件分岐させて表示させる
[cm]
[freeimage layer="1"]

;背景を表示
[image storage="weather/prefecture_back.png" layer="1"]

[if exp="f.area == '東北'"]

;青森
[glink text="青森" exp="f.area = '青森'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[1]" width="&f.button_width"]
;岩手
[glink text="岩手" exp="f.area = '岩手'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[2]" width="&f.button_width"]
;宮城
[glink text="宮城" exp="f.area = '宮城'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[3]" width="&f.button_width"]
;秋田
[glink text="秋田" exp="f.area = '秋田'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[1]" width="&f.button_width"]
;山形
[glink text="山形" exp="f.area = '山形'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[2]" width="&f.button_width"]
;福島
[glink text="福島" exp="f.area = '福島'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[3]" width="&f.button_width"]

[elsif exp="f.area == '関東'"]

;茨城
[glink text="茨城" exp="f.area = '茨城'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[1]" width="&f.button_width"]
;栃木
[glink text="栃木" exp="f.area = '栃木'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[2]" width="&f.button_width"]
;群馬
[glink text="群馬" exp="f.area = '群馬'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[3]" width="&f.button_width"]
;埼玉
[glink text="埼玉" exp="f.area = '埼玉'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[4]" width="&f.button_width"]
;千葉
[glink text="千葉" exp="f.area = '千葉'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[1]" width="&f.button_width"]
;東京
[glink text="東京" exp="f.area = '東京'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[2]" width="&f.button_width"]
;神奈川
[glink text="神奈川" exp="f.area = '神奈川'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[3]" width="&f.button_width"]

[elsif exp="f.area == '中部'"]

;新潟
[glink text="新潟" exp="f.area = '新潟'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[0]" width="&f.button_width"]
;富山
[glink text="富山" exp="f.area = '富山'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[1]" width="&f.button_width"]
;石川
[glink text="石川" exp="f.area = '石川'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[2]" width="&f.button_width"]
;福井
[glink text="福井" exp="f.area = '福井'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[3]" width="&f.button_width"]
;山梨
[glink text="山梨" exp="f.area = '山梨'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[4]" width="&f.button_width"]
;長野
[glink text="長野" exp="f.area = '長野'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[1]" width="&f.button_width"]
;岐阜
[glink text="岐阜" exp="f.area = '岐阜'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[2]" width="&f.button_width"]
;静岡
[glink text="静岡" exp="f.area = '静岡'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[3]" width="&f.button_width"]
;愛知
[glink text="愛知" exp="f.area = '愛知'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[4]" width="&f.button_width"]

[elsif exp="f.area == '近畿'"]

;三重
[glink text="三重" exp="f.area = '三重'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[1]" width="&f.button_width"]
;滋賀
[glink text="滋賀" exp="f.area = '滋賀'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[2]" width="&f.button_width"]
;京都
[glink text="京都" exp="f.area = '京都'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[3]" width="&f.button_width"]
;大阪
[glink text="大阪" exp="f.area = '大阪'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[4]" width="&f.button_width"]
;兵庫
[glink text="兵庫" exp="f.area = '兵庫'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[1]" width="&f.button_width"]
;奈良
[glink text="奈良" exp="f.area = '奈良'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[2]" width="&f.button_width"]
;和歌山
[glink text="和歌山" exp="f.area = '和歌山'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[3]" width="&f.button_width"]

[elsif exp="f.area == '中国'"]

;鳥取
[glink text="鳥取" exp="f.area = '鳥取'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[1]" width="&f.button_width"]
;島根
[glink text="島根" exp="f.area = '島根'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[2]" width="&f.button_width"]
;岡山
[glink text="岡山" exp="f.area = '岡山'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[3]" width="&f.button_width"]
;広島
[glink text="広島" exp="f.area = '広島'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[1]" width="&f.button_width"]
;山口
[glink text="山口" exp="f.area = '山口'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[2]" width="&f.button_width"]

[elsif exp="f.area == '四国'"]

;徳島
[glink text="徳島" exp="f.area = '徳島'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[1]" width="&f.button_width"]
;香川
[glink text="香川" exp="f.area = '香川'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[2]" width="&f.button_width"]
;愛媛
[glink text="愛媛" exp="f.area = '愛媛'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[1]" width="&f.button_width"]
;高知
[glink text="高知" exp="f.area = '高知'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[2]" width="&f.button_width"]

[elsif exp="f.area == '九州'"]

;福岡
[glink text="福岡" exp="f.area = '福岡'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[1]" width="&f.button_width"]
;佐賀
[glink text="佐賀" exp="f.area = '佐賀'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[2]" width="&f.button_width"]
;長崎
[glink text="長崎" exp="f.area = '長崎'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[3]" width="&f.button_width"]
;熊本
[glink text="熊本" exp="f.area = '熊本'" target="*return_weather" color="btn_21_black" x="&f.pos_x[1]" y="&f.pos_y[4]" width="&f.button_width"]
;大分
[glink text="大分" exp="f.area = '大分'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[1]" width="&f.button_width"]
;宮崎
[glink text="宮崎" exp="f.area = '宮崎'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[2]" width="&f.button_width"]
;鹿児島
[glink text="鹿児島" exp="f.area = '鹿児島'" target="*return_weather" color="btn_21_black" x="&f.pos_x[0]" y="&f.pos_y[3]" width="&f.button_width"]

[endif]

[s]

*return_weather
[cm]
[freeimage layer="1"]

;メッセージボックスを表示
@layopt layer=message0 visible=true

;メニュー再表示
[showmenubutton]

選択した地域は[emb exp="f.area"]、天気は[weather area="&f.area"]。[l][r]
このように拡張もできます。[p]

;暗転
;メッセージボックスを非表示
@layopt layer=message0 visible=false

;メニュー非表示
[hidemenubutton]

;キャラクター非表示
[chara_hide_all]

;暗転
[bg storage="black.png" time="2000"]

[wait time="2000"]

;メッセージボックスの再表示
@layopt layer=message0 visible=true

;メニュー再表示
[showmenubutton]

#
[link target="*start"]解説を始めから行う[r]
[link storage="title.ks"]タイトルへ戻る[r]
[s]
