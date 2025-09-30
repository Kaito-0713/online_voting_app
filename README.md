# README

# オンライン投票アプリ

## 1. サービス概要
安全・簡単・確実に投票できるオンライン選挙システムです。  

---

## 2. サービス画像
![サービス画像](app/assets/images/online_voting.png)

---

## 3. サービスURL
🔗 [本番環境はこちら](https://online-voting-app-kaito-new-07e23065ff59.herokuapp.com)

---

## 4. サービスの概要
本サービスは、オンラインで投票が完結するシステムを目指して開発されました。  
ユーザーはログイン後、選挙の一覧や候補者の情報を確認し、簡単に投票することができます。  
有権者はWeb上から候補者情報を確認し、投票を行うことができます。  
管理者は選挙や候補者を作成・編集・削除し、投票結果を確認することができます。

---

## 5. 開発背景
- オフライン投票では時間や場所の制約が大きく、投票率が下がる課題がある
- オンライン投票を導入することで、より多くの人が簡単に投票に参加できるようにしたい
- 学習目的でRailsを使ったWebアプリ開発を経験するために作成

---

## 6. 機能一覧

### 👤 ユーザー機能
- ホーム画面（お知らせ表示、投票開始ボタン）
- ログイン / ログアウト（Devise）
- 選挙一覧ページ（選挙スケジュール確認）
- 候補者ページ（候補者情報表示）
- 投票ページ（投票の実行）

### 🛠 管理者機能
- 選挙作成 / 編集 / 削除
- 候補者作成 / 編集 / 削除
- 投票結果の集計・確認

---

## 7. 主な使用技術
- **言語**: Ruby 3.1.5
- **フレームワーク**: Ruby on Rails 6.1.7
- **フロントエンド**: ERB, SCSS, JavaScript, Bootstrap 5
- **認証**: Devise
- **データベース**: PostgreSQL
- **デプロイ**: Heroku
- **その他**: ActiveStorage（画像アップロード）

---

## 8. ER図
┌──────────────────────────┐
│          User            │
├──────────────────────────┤
│ id: integer              │
│ email: string (unique)   │
│ encrypted_password: string│
│ reset_password_token: string (unique)│
│ reset_password_sent_at: datetime│
│ remember_created_at: datetime│
│ name: string             │
│ verification_id: string (unique)│
│ identification_number: string (unique)│
│ voted: boolean (default: false)│
│ admin: boolean (default: false)│
│ role: string             │
│ created_at: datetime     │
│ updated_at: datetime     │
└───────────┬──────────────┘
            │ has_many :votes
            │
            ▼
┌──────────────────────────┐
│          Vote            │
├──────────────────────────┤
│ id: integer              │
│ user_id: integer (FK)    │
│ candidate_id: integer (FK)│
│ election_id: integer (FK)│
│ created_at: datetime     │
│ updated_at: datetime     │
└──────┬──────────┬────────┘
       │          │
belongs_to    belongs_to
       │          │
       ▼          ▼
┌──────────────────────────┐      ┌──────────────────────────┐
│       Candidate          │      │        Election          │
├──────────────────────────┤      ├──────────────────────────┤
│ id: integer              │      │ id: integer              │
│ name: string             │      │ title: string            │
│ party: string            │      │ description: text        │
│ policy: text             │      │ start_at: datetime       │
│ election_id: integer (FK)│      │ end_at: datetime         │
│ created_at: datetime     │      │ created_at: datetime     │
│ updated_at: datetime     │      │ updated_at: datetime     │
└──────────────┬───────────┘      └──────────────┬───────────┘
               │ belongs_to                       │ has_many :candidates
               └──────────────────────────────────┘

---

## 9. 今後の展望
- **直近の修正予定**
  - UI改善（レスポンシブ対応、デザイン調整）
  - バリデーションエラーメッセージの見やすさ改善

- **短期的な目標**
  - 投票結果のグラフ表示
  - 候補者検索機能の強化

- **中期的な目標**
  - 多言語対応
  - 投票認証の強化（2段階認証）
  - 大規模利用を想定したパフォーマンス改善
