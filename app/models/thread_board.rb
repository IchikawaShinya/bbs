class ThreadBoard < ActiveRecord::Base
  validates :category_id, presence: { message: "カテゴリが選択されていません。" }
  validates :thread_name, presence: { message: "スレッド名が入力されていません。" }
  validates :delete_pass, presence: { message: "削除用パスワードが入力されていません。" }
end
