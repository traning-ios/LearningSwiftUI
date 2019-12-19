Để chạy project bạn phải:

- Vào file base tạo 1 project với bunndle id của bạn

- Vào phần Authentication và bật authen với mail/password

- Vào phần Database, tạo database. Ở mục realtime database, chọn rules và add rule với truyền truy cập khi đăng nhập như sau:

{
  "rules": {
    "$uid": {
      ".write": "$uid === auth.uid",
      ".read": "$uid === auth.uid"
   }
 }
}


