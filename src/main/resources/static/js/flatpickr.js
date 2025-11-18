// 予約最大日の計算 (今日から3ヶ月後までを予約可能にする)
let maxDate = new Date(); 
// setMonth() を使って3ヶ月後の日付を設定
maxDate = maxDate.setMonth(maxDate.getMonth() + 3); 


document.addEventListener('DOMContentLoaded', function() {
    
    // 適用対象の入力欄（IDが 'reservation-datetime'）を取得します。
    const reservationInput = document.getElementById('reservation-datetime');

    if (reservationInput) {
        // Flatpickrを適用
        flatpickr(reservationInput, {
            
            // 【言語設定】
            locale: 'ja',           // カレンダーを日本語で表示
            
            // 【機能設定：日時選択】
            enableTime: true,       // 時刻選択を有効化
            time_24hr: true,        // 24時間形式で表示
            
            // 【表示形式】
            // JavaのReservationInputFormのフォーマット (yyyy/MM/dd HH:mm) と一致させる
            dateFormat: "Y/m/d H:i",
            
            // 【時刻の刻み】
            minuteIncrement: 15,    // 15分刻み
            
            // 当日予約不可にするため、明日以降に設定
            minDate: 'today + 1',   
            
            // 【日付の制限（未来）】
            // 事前に計算した3ヶ月後の日付を最大値として設定
            maxDate: maxDate      

        }); 
    }
});