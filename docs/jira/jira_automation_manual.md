# JIRA Automation 設定マニュアル
## JIRA SoftwareとGithubの連携
Atlassianの下記公式サイトの[GitHub Cloud または GitHub Enterprise Cloud アカウントを Jira Software に接続する]の章を参考にJIRA SoftwareとGithubを連携する<br>
https://support.atlassian.com/ja/jira-cloud-administration/docs/integrate-with-github/<br>
## JIRA Automationの自動化ルール作成
1. JIRAのホーム画面のサイドバー内の「プロジェクト設定」をクリック<br>
![スクリーンショット 2022-11-24 3 38 51](https://user-images.githubusercontent.com/49933865/203623401-035f4498-0148-4558-bc12-c598dfdd4c5f.png)<br>

2. プロジェクト設定内の「自動化」をクリック<br>
![スクリーンショット 2022-11-24 3 26 39](https://user-images.githubusercontent.com/49933865/203621483-63e4fa47-ebd3-4239-beef-01fab9569a6b.png)<br>

3. 自動化画面の「ルールを作成」をクリック
![スクリーンショット 2022-11-24 3 27 53](https://user-images.githubusercontent.com/49933865/203621702-7c0f8631-928f-467d-be61-e695e3d4cb10.png)<br>

4. 本プロジェクトでは下記3つのルールを作成
  * 課題キーを含むブランチが作成されたら、課題を「進行中」に遷移
  ![スクリーンショット 2022-11-24 3 31 29](https://user-images.githubusercontent.com/49933865/203622221-44fda89b-f806-4214-abef-ecca00f26e50.png)<br>

  * プルリクが作成されたら、課題を「レビュー中」に遷移
  ![スクリーンショット 2022-11-24 3 32 27](https://user-images.githubusercontent.com/49933865/203622370-9792fe91-35cd-4803-a63f-a5ee73450640.png)<br>

  * プルリクがマージされたら、課題を「完了」に遷移
  ![スクリーンショット 2022-11-24 3 34 26](https://user-images.githubusercontent.com/49933865/203622922-e8c73488-b881-4b62-b55d-225bbba3885b.png)<br>
  
5. ルール作成後に「保存」および「公開」をクリックし、有効化する<br><br>
  

## ブランチ作成〜プルリク承認までの流れ
* JIRA課題の課題キー（本プロジェクトでは「FC-◯◯（◯◯は数字）」）を含むブランチ名でブランチを切り、リモートリポジトリにプッシュする（ブランチ名の例： FC-10-feature/add-talk-page）<br><br>
→該当タスクが「To Do」から「進行中」に遷移する<br><br>
* プルリクを作成する<br><br>
→該当タスクが「進行中」から「レビュー中」に遷移する<br><br>
* プルリクが承認されマージされる<br><br>
→該当タスクが「レビュー中」から「完了」に遷移する<br><br>
