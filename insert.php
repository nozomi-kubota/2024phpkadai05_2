<?php

session_start();
//   関数群の読み込み


//1. POSTつぶやき取得
$content = $_POST['content'];


//2. DB接続します
require_once 'functions.php';
loginCheck();
$pdo = db_conn();

$stmt = $pdo->prepare('INSERT INTO contents(user_id, content, created_at) VALUES(:user_id, :content, NOW());');
$stmt->bindValue(':content', $content, PDO::PARAM_STR);
$stmt->bindValue(':user_id', $user_id, PDO::PARAM_INT);
// セッションからユーザーIDを取得
$user_id = $_SESSION['user_id'];

// 画像アップロードの処理:画像パスを保存する用の変数を用意。
$image_path = '';

//isset⇒該当するデータが存在するかをチェックする関数//ファイルデータ有りの場合のみ、画像保存処理を行う
if (isset($_FILES['image'])) {

    //imageの部分はinputtupe＝"file"のname属性に相当します
    //必要に応じて書き換えるべき"場所"
    //tmp_nameは固定
    $upload_file = $_FILES['image']['tmp_name'];


    //画像の拡張子を取得。
    $extension = pathinfo($_FILES["image"]['name'], PATHINFO_EXTENSION);

    //画像名を取得。uniqid（）を使って独自のIDを付与。
    $file_name = uniqid() . '.' . $extension;

    //フォルダ名を取得。今回は直書き。
    $dir_name = 'img/';

    //画像の保存場所を設定
    $image_path = $dir_name . $file_name;

    //move_uploaded_file()で、一時的に保管されているファイルをimage_pathに移動させる。
    if (!move_uploaded_file($upload_file, $image_path)) {
        exit('ファイルの移動に失敗しました');
    }
}


//３．つぶやき登録SQL作成
$stmt = $pdo->prepare('INSERT INTO contents(user_id, content, image, created_at) VALUES(:user_id, :content, :image, NOW());');
$stmt->bindValue(':content', $content, PDO::PARAM_STR);
$stmt->bindValue(':image', $image_path, PDO::PARAM_STR);
$stmt->bindValue(':user_id', $user_id, PDO::PARAM_INT);
$status = $stmt->execute(); //実行

//４．つぶやき登録処理後
if (!$status) {
    sql_error($stmt);
} else {
    redirect('select.php');
}
