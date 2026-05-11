# SQL SERVER

## Họ & tên: Nguyễn Đăng Thịnh
## Lớp: K59KMT.K01  
## MSSV: K235480106069
## Bài số 3
# Nhiệm vụ 1: Tạo cơ sở dữ liệu quản lý cầm đồ
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/d603665e-d7ac-42be-b02e-8efbe3d84331" />
Trong bước này, hệ quản trị cơ sở dữ liệu PawnShopDB được khởi tạo trên SQL Server để phục vụ cho bài toán quản lý cầm đồ. Sau khi thực thi lệnh CREATE DATABASE và USE, hệ thống đã tạo thành công database mới và chuyển sang chế độ làm việc với database này.

# Nhiệm vụ 2: Thiết kế bảng Customer quản lý khách hàng
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/060e8184-3f8b-4f7a-868f-e30f0e5a24ee" />
Ảnh trên thể hiện quá trình tạo bảng Customer dùng để lưu trữ thông tin khách hàng trong hệ thống quản lý cầm đồ. Bảng bao gồm các thuộc tính như họ tên, số điện thoại, CCCD và địa chỉ. Thuộc tính CustomerID được thiết lập làm khóa chính với cơ chế tự động tăng nhằm đảm bảo mỗi khách hàng có một mã định danh duy nhất.

# Nhiệm vụ 3: Thiết kế bảng Contract quản lý hợp đồng vay
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/d61ffd56-923f-460a-be41-04e9f440cbf7" />
Trong bước này, bảng Contract được tạo để quản lý thông tin các hợp đồng cầm đồ của khách hàng. Bảng lưu số tiền vay, thời gian vay, các mốc thời hạn thanh toán và trạng thái hiện tại của hợp đồng. Thuộc tính CustomerID được sử dụng làm khóa ngoại để liên kết dữ liệu với bảng Customer.

# Nhiệm vụ 4: Thiết kế bảng Asset quản lý tài sản thế chấp
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/f34fadd6-6d80-4ad1-8457-985d92454772" />
Ảnh trên minh họa quá trình tạo bảng Asset nhằm quản lý các tài sản được khách hàng mang đi thế chấp trong hệ thống cầm đồ. Bảng lưu thông tin tên tài sản, giá trị định giá và trạng thái hiện tại của tài sản để phục vụ việc quản lý và xử lý tài sản sau này.

# Nhiệm vụ 5: Thiết kế bảng ContractAsset liên kết hợp đồng và tài sản
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/d931e905-45c3-41f8-bb52-1bd5fb175cd6" />
Ảnh trên thể hiện quá trình tạo bảng ContractAsset dùng để liên kết giữa hợp đồng cầm đồ và các tài sản thế chấp. Bảng này hỗ trợ quản lý mối quan hệ nhiều-nhiều giữa bảng Contract và bảng Asset trong hệ thống.

# Nhiệm vụ 6: Thiết kế bảng PaymentLog lưu lịch sử thanh toán
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/b3a71c45-c641-40c0-8dbe-8f685016cffa" />
Ảnh trên minh họa quá trình tạo bảng PaymentLog nhằm lưu lịch sử thanh toán của khách hàng trong hệ thống cầm đồ. Bảng này giúp theo dõi các lần trả nợ, số tiền đã thanh toán và nhân viên thực hiện giao dịch để đảm bảo khả năng quản lý và truy vết dữ liệu.

# Nhiệm vụ 7: Thêm dữ liệu mẫu vào hệ thống
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/786d6d48-efb3-4089-a95a-fa2b34389e7f" />
Ảnh trên thể hiện quá trình thêm dữ liệu mẫu vào hệ thống quản lý cầm đồ bằng các câu lệnh INSERT INTO trong SQL Server. Dữ liệu được thêm bao gồm thông tin khách hàng, hợp đồng vay và tài sản thế chấp nhằm phục vụ việc kiểm thử và đánh giá các chức năng của cơ sở dữ liệu sau khi thiết kế.

# Nhiệm vụ 8: Kiểm tra dữ liệu sau khi thêm vào cơ sở dữ liệu
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/cb898904-e672-4a0e-9481-048a4cadf9a2" />
Ảnh trên thể hiện kết quả kiểm tra dữ liệu sau khi thêm dữ liệu mẫu vào hệ thống quản lý cầm đồ. Các câu lệnh SELECT đã truy xuất thành công thông tin từ các bảng Customer, Contract, Asset và ContractAsset, cho thấy dữ liệu khách hàng, hợp đồng vay và tài sản thế chấp đã được lưu chính xác trong cơ sở dữ liệu.

# Nhiệm vụ 9: Xây dựng function tính tiền hợp đồng
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/28ebfc7f-6454-4080-b398-3fc8322210f4" />
Ảnh trên thể hiện quá trình xây dựng hàm fn_CalcMoneyContract dùng để tính tổng số tiền khách hàng phải thanh toán theo thời gian. Hàm thực hiện tính toán tiền gốc, lãi đơn trước thời hạn Deadline1 và lãi kép sau khi hợp đồng quá hạn nhằm mô phỏng đúng cơ chế tính lãi của hệ thống cầm đồ.

# Nhiệm vụ 10: Kiểm thử function tính lãi
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/8f70b6aa-5f9c-49da-a005-68f7ab286423" />
Ảnh trên minh họa quá trình kiểm thử hàm fn_CalcMoneyContract bằng cách truyền vào mã hợp đồng và ngày cần tính toán. Kết quả trả về cho thấy hệ thống đã tính thành công tổng số tiền khách hàng cần thanh toán dựa trên tiền gốc và lãi phát sinh theo thời gian vay.

# Nhiệm vụ 11: Xây dựng stored procedure thanh toán khoản vay
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/d51c03f7-1584-4fcb-a9e2-6879cbbb12d2" />
Ảnh trên thể hiện quá trình xây dựng stored procedure sp_PayDebt dùng để xử lý việc khách hàng thanh toán khoản vay trong hệ thống cầm đồ. Procedure thực hiện tính toán số tiền cần thanh toán, ghi nhận lịch sử trả nợ vào bảng PaymentLog và cập nhật trạng thái hợp đồng cũng như tài sản tương ứng.

# Nhiệm vụ 12: Kiểm thử stored procedure thanh toán
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/889c29a9-9c5b-4626-9928-eaaeff8a8ba8" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/03ccfcbf-2949-4c35-9909-9b01c9501b0d" />
Ảnh trên minh họa quá trình kiểm thử stored procedure sp_PayDebt bằng cách mô phỏng việc khách hàng thực hiện thanh toán khoản vay trong hệ thống cầm đồ. Sau khi procedure được thực thi, hệ thống đã ghi nhận lịch sử thanh toán vào bảng PaymentLog đồng thời cập nhật trạng thái hợp đồng sang “Đã thanh toán” và trạng thái tài sản sang “Đã trả khách”.

# Nhiệm vụ 13: Truy vấn danh sách khách hàng quá hạn thanh toán
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/64633061-cd3a-4eaf-adba-99927cf0e346" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/7e5f1e64-7255-4d1b-8c9a-7263b1ca2fd2" />
Ảnh trên thể hiện kết quả truy vấn danh sách khách hàng quá hạn thanh toán trong hệ thống cầm đồ. Truy vấn đã sử dụng hàm fn_CalcMoneyContract để tính toán tổng số tiền nợ hiện tại đồng thời xác định số ngày quá hạn của hợp đồng dựa trên thời gian thực tế.

# Nhiệm vụ 14: Xây dựng trigger xử lý nợ quá hạn
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/7e2e3b7b-d26e-4187-a117-a8c77cb84adc" />
Ảnh trên thể hiện quá trình tạo trigger trg_BadDebt dùng để tự động cập nhật trạng thái hợp đồng sang “Quá hạn” khi ngày hiện tại vượt quá thời hạn Deadline1 nhưng hợp đồng vẫn chưa được thanh toán. Trigger giúp hệ thống tự động hóa việc quản lý các khoản nợ quá hạn trong cơ sở dữ liệu.

# Nhiệm vụ 15: Thiết kế sơ đồ ERD của hệ thống
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e8f1ae4c-342a-47fa-8485-bd9d6218de0e" />
Ảnh trên thể hiện sơ đồ ERD của hệ thống quản lý cầm đồ được thiết kế trên SQL Server. Sơ đồ mô tả các bảng dữ liệu chính gồm Customer, Contract, Asset, ContractAsset và PaymentLog cùng mối quan hệ giữa chúng thông qua các khóa chính và khóa ngoại nhằm đảm bảo tính liên kết và toàn vẹn dữ liệu trong cơ sở dữ liệu.

# Nhiệm vụ 16: Giải thích thuật toán tính lãi
Hệ thống sử dụng hai cơ chế tính lãi gồm lãi đơn và lãi kép. Trước thời hạn Deadline1, tiền lãi được tính theo công thức lãi đơn với mức 5.000 đồng trên mỗi 1.000.000 đồng tiền gốc mỗi ngày. Sau khi vượt quá Deadline1, hệ thống chuyển sang tính lãi kép dựa trên tổng tiền gốc và lãi đơn đã tích lũy trước đó bằng hàm POWER trong SQL Server. Việc tính toán được thực hiện thông qua hàm fn_CalcMoneyContract nhằm hỗ trợ xác định chính xác số tiền khách hàng cần thanh toán theo từng thời điểm.

## Kết Luận 
Sau khi hoàn thành bài tập, hệ thống quản lý cầm đồ đã được xây dựng thành công trên SQL Server với đầy đủ các chức năng cơ bản như quản lý khách hàng, hợp đồng vay, tài sản thế chấp, lịch sử thanh toán, tính lãi và xử lý nợ quá hạn. Các đối tượng SQL như function, stored procedure và trigger đã hỗ trợ hệ thống hoạt động tự động và đảm bảo tính toàn vẹn dữ liệu.
