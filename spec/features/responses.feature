Feature: スレッド表示・コメント投稿

  Scenario: スレッドの表示
    前提 "スレッド1"リンクをクリックする
    ならば "投稿がありません。"と表示されている

  Scenario: コメント投稿
    前提 "スレッド2"リンクをクリックする
    かつ "response[user_name]"に"user2"を設定する
	かつ "response[user_email]"に"test@test.com"を設定する
    かつ "response[comment]"に"投稿テスト"を設定する
    かつ "書き込む"ボタンをクリックする
	ならば "投稿に成功しました。"と表示されている
