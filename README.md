# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| name      | string | not: null   |
| email     | string | not: null   |
| password  | string | not: null   |
| profile   | text   | not: null   |
| occupation| text   | not: null   |
| position  | text   | not: null   |

### Association

- has_many :comments
- has_many :comments
- has_many :prototypes


## prototypes テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| title     | string | not: null   |
| catch_copy| text   | not: null   |
| concept   | text   | not: null   |
| image     | ActiveStorageで実装   | not: null   |
| user      | references   | not: null   |

### Association
- has_many : comment
- belongs_to : users

## comments テーブル

| Column    | Type         | Options     |
| --------  | ------       | ----------- |
| text      | text         | not: null   |
| user      | references   | not: null   |
| prototype | references   | not: null   |

### Association
- belongs_to : users
- belongs_to : prototypes

###formの見本###

   <% if current_user %>
      <%= form_with(model: [@prototype, @comment], local: true) do |form| %>
       <div class="form__btn">
        <%= form.text_area :text, placeholder: "コメントする", rows: "2" %>
        <%= form.submit "SEND" %>
      <% end %>
    <% else %>
      <strong><p>※※※ コメントの投稿には新規登録/ログインが必要です ※※※</p></strong>
    <% end %>
       <div class="comments">
      <h4>＜コメント一覧＞</h4>
      <% if @comments %>
        <% @comments.each do |comment| %>
          <p>
            <strong><%= link_to comment.user.name, "/users/#{comment.user_id}" %>：</strong>
            <%= comment.text %>
          </p>
        <% end %>
      <% end %>