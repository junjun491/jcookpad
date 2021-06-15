// jQuery無しでナビゲーションを開閉する関数
function navToggle() {

  // 開閉ボタンを取得
  var toggleBtn = document.getElementById('nav-toggle');

  // 開閉するナビゲーション本体を取得
  var navView = document.getElementById('nav-list');

  // 開閉ボタンの現在のクラスを取得
  var toggleBtnClass = toggleBtn.getAttribute('class');

  // 開閉ボタンのクラスで条件分岐
  // 1. 開閉ボタンのクラスが「close」だったら
  if(toggleBtnClass == 'nav-toggle-button close') {

    // 閉じている状態のクラスを削除
    toggleBtn.classList.remove('close');
    navView.classList.remove('close');

    // 開いている状態のクラスを付与
    toggleBtn.classList.add('open');
    navView.classList.add('open');

  }

  // 2. 開閉ボタンのクラスが「open」だったら
  else {

    // 開いている状態のクラスを削除
    toggleBtn.classList.remove('open');
    navView.classList.remove('open');

    // 閉じている状態のクラスを付与
    toggleBtn.classList.add('close');
    navView.classList.add('close');
  }

}

// 指定IDをクリックした際に関数を実行
document.getElementById('nav-toggle').onclick = navToggle;


