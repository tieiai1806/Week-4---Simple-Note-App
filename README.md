Week 4 - Simple Note App
1. Giới thiệu dự án
Dự án Simple Note App là một ứng dụng ghi chú cá nhân được xây dựng trên nền tảng Flutter. Ứng dụng cho phép người dùng thực hiện đầy đủ các thao tác quản lý dữ liệu (CRUD) và lưu trữ bền vững dưới bộ nhớ cục bộ của thiết bị.

2. Cấu trúc dự án (Folder Structure)
Dự án tuân thủ mô hình phân lớp chuẩn để tách biệt logic và giao diện:

lib/models/: Định nghĩa lớp dữ liệu Note và các hàm chuyển đổi Map-Object.
lib/database/: Quản lý kết nối SQLite và thực hiện các câu lệnh truy vấn dữ liệu.
lib/providers/: Sử dụng thư viện Provider để quản lý trạng thái và chia sẻ dữ liệu toàn ứng dụng.
lib/screens/: Chứa các màn hình giao diện chính (HomePage, NoteEditorScreen).
lib/widgets/: Chứa các thành phần giao diện có thể tái sử dụng (NoteCard).

3. Thư viện sử dụng (Dependencies)
Ứng dụng sử dụng các package quan trọng sau:

sqflite: Hệ quản trị cơ sở dữ liệu SQLite cho di động.
path_provider: Giúp xác định đường dẫn lưu trữ file trên thiết bị.
provider: Giải pháp quản lý trạng thái để cập nhật giao diện tự động.
intl: Hỗ trợ định dạng thời gian hiển thị cho ghi chú.

4. Các chức năng chính và Vị trí Code
Dưới đây là danh sách các chức năng thực hiện trong ứng dụng và các file code tương ứng:
Khởi tạo CSDL	|database/db_helper.dart	        | Sử dụng Singleton Pattern để tạo kết nối SQLite.
Thêm ghi chú  |providers/note_provider.dart     | Hàm addNote gọi câu lệnh insert của database.
Xem danh sách	|screens/home_page.dart           | Sử dụng Consumer để hiển thị dữ liệu từ NoteProvider.
Sửa ghi chú	  |screens/note_editor_screen.dart	| Xử lý logic cập nhật dữ liệu khi người dùng chỉnh sửa.
Xóa ghi chú   |screens/note_editor_screen.dart	| Hiển thị hộp thoại xác nhận trước khi thực hiện xóa.

5. Các bước thực hiện demo
5.1 Ghi chú
<img width="368" height="841" alt="image" src="https://github.com/user-attachments/assets/b6c15a90-ec3b-40d2-a7df-4d3bc4af64b6" />
5.2 Hiển thị ghi chú
<img width="370" height="849" alt="image" src="https://github.com/user-attachments/assets/3f9391a5-410d-472a-92a6-51db3e80cc52" />
5.3 Xóa ghi chú
<img width="365" height="844" alt="image" src="https://github.com/user-attachments/assets/0e29387e-fd74-463e-9ddf-9ead59b62a1b" />
5.4 Kết quả sau khi xóa
<img width="365" height="844" alt="image" src="https://github.com/user-attachments/assets/891e1546-d209-4973-a62b-7efe6cef9d69" />

