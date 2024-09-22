<?php
//コード記述/修正の流れ
//1. insert.phpの処理をコピー。
//  1)POSTデータ取得 2)DB接続 3)UPDATE SQL準備・バインド処理・実行 4)結果確認⇒前ページへ戻る
//2. $id = POST["id"]を追加
//3.画像処理確認・修正：
//   １）画像処理へ既存画像の保持処理を追加
//4. SQL修正
//   "UPDATE テーブル名 SET 変更カラム WHERE 条件"
//   bindValueに「id」,[image]追加
//５. header関数"Location"を「select.php」に変更

session_start();

//1. POST取得
$content = $_POST['content'];
$id     = $_POST['id'];

//2. DB接続
require_once 'functions.php';
loginCheck();
$pdo = db_conn();

//3. 画像アップロードの処理
$image_path = '';
//isset⇒フォームから送信されたファイルが存在するか//is_uploaded_file：アップロードファイルが”tmp_name”に存在するか
//”image”はinputtype＝"file"のname属性に相当⇒適宜書き換える"場所"、tmp_nameは固定
if (isset($_FILES['image'])&& is_uploaded_file($_FILES['image']['tmp_name'])) {

    //アップロードファイルの一時ファイル名を変数 $upload_file に格納
    $upload_file = $_FILES['image']['tmp_name'];
    //画像を保存するディレクトリ名(img)を $dir_name に設定
    $dir_name = 'img/';
    //アップロードファイルの拡張子を取得し、変数 $extensionに格納
    $extension = pathinfo($_FILES["image"]['name'], PATHINFO_EXTENSION);
    //uniqid（）を使ってUniqファイル名を生成、$extensionで拡張子を付けて $file_name に格納。
    $file_name = uniqid() . '.' . $extension;
    //保存先のパス( $dir_name）を $image_path に設定
    $image_path = $dir_name . $file_name;
    //move_uploaded_file()で、一時保管ファイルをimage_pathに移動(！でfalseの場合→移動に失敗した場合)
    if (!move_uploaded_file($upload_file, $image_path)) {
        exit('ファイルの保存に失敗しました');
    }
} else {
    // 新しい画像がアップロードされていない場合、既存の画像パスを保持
    $stmt = $pdo->prepare("SELECT image FROM contents WHERE id=:id");
    $stmt->bindValue(':id', $id, PDO::PARAM_INT);
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    $image_path = $row['image']; // 既存の画像パスをセット
}

//３．登録SQL作成

$stmt = $pdo->prepare('UPDATE contents SET content=:content, updated_at=sysdate(),image=:image WHERE id=:id;');
$stmt->bindValue(':content', $content, PDO::PARAM_STR);
$stmt->bindValue(':id', $id, PDO::PARAM_INT);
$stmt->bindValue(':image', $image_path, PDO::PARAM_STR);
$status = $stmt->execute(); //実行

//４．登録後の処理後：SQL実行エラー時
if (!$status) {
    sql_error($stmt);
} else {
//５．select.phpへリダイレクト：SQL実行エラーが無ければ
    redirect('select.php');
}

//４．登録処理後
if ($status === false) {
    sql_error($stmt);
} else {
    redirect('select.php');
}
