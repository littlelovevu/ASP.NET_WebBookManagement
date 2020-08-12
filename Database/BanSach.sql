create database KhoaLuan
use KhoaLuan

create table Loai
(	MaLoai int identity(1,1) primary key,
	TenLoai nvarchar(50)
)

create table ThuongHieu
(	MaThuongHieu int identity(1,1) primary key,
	TenThuongHieu nvarchar(50)
)

create table Hang
(	MaHang int identity(1,1) primary key,
	MaLoai int,
	MaThuongHieu int,
	TenHang nvarchar(200),
	SoLuong int,
	DonGia bigint,
	HinhAnh nvarchar(max),
	MoTa ntext,
	NgayNhap datetime
	constraint fk_h_tt foreign key (MaThuongHieu) references ThuongHieu(MaThuongHieu),
	constraint fk_h_l foreign key (MaLoai) references Loai(MaLoai)
)

create table HoaDon
(	MaHD nvarchar(50) primary key,
	TenNguoiDat nvarchar(100),
	DiaChiNguoiDat nvarchar(200),
	SDTNguoiDat nvarchar(50),
	EmailNguoiDat nvarchar(50),
	TenNguoiNhan nvarchar(100),
	DiaChiNguoiNhan nvarchar(200),
	SDTNguoiNhan nvarchar(50),
	EmailNguoiNhan nvarchar(50),
	NgayDatHang datetime
)

create table CTHoaDon
(	MaCTHD int identity(1,1) primary key,
	MaHD nvarchar(50),
	MaHang int,
	SoLuong int
	constraint fk_cthd_h foreign key (MaHang) references Hang(MaHang),
	constraint fk_cthd_hd foreign key (MaHD) references HoaDon(MaHD)
)

create table Quyen
(	MaQuyen int identity(1,1) primary key,
	TenQuyen nvarchar(max)
)

create table TaiKhoan
(	MaUser int identity(1,1) primary key,
	UserName nvarchar(50),
	Pass nvarchar(50),
	HoTen nvarchar(100),
	Email nvarchar(50),
	SDT nvarchar(50),
	DiaChi nvarchar(200),
	MaQuyen int
	constraint fk_tk_q foreign key (MaQuyen) references Quyen(MaQuyen)
)

---------- NHẬP LIỆU ----------

insert into Quyen
values('Admin')
insert into Quyen
values('User')
insert into Quyen
values('Khóa')

insert into TaiKhoan
values('ledanhvu','123456',N'Lê Danh Vũ','ledanhvu090888@gmail.com','0366396605',N'Ấp 4',1)
insert into TaiKhoan
values('tranngochai','123456',N'Trần Ngọc Hải','tngochai0205@gmail.com','0123456789',N'Xã đoàn chợ mới',2)
insert into TaiKhoan
values('tranphatdat','123456',N'Trần Phát Đạt','tphatdat0123@gmail.com','0112233445',N'Xã đoàn chợ cũ',2)

insert into Loai
values(N'Sách giáo dục')
insert into Loai
values(N'Tiểu thuyết')
insert into Loai
values(N'Truyện tranh')
insert into Loai
values(N'Sách khoa học')
insert into Loai
values(N'Sách y học - sức khỏe')
insert into Loai
values(N'Sách lịch sử')

insert into ThuongHieu
values(N'Nhã Nam')
insert into ThuongHieu
values(N'Thái Hà Books')
insert into ThuongHieu
values(N'Phương Nam Book')
insert into ThuongHieu
values(N'Đông A Book')
insert into ThuongHieu
values(N'Alpha Books')
insert into ThuongHieu
values(N'First News')
insert into ThuongHieu
values(N'Đông Tây')

insert into Hang
values(1,1,N'GIÁO DỤC TRÍ TƯỞNG TƯỢNG CHO TRẺ - CÁI HỐ TO BÍ MẬT',900,16500,'image\hang\642017132724218.jpg',
N'Giáo Dục Trí Tưởng Tượng Cho Trẻ - Cái Hố To Bí Mật<br/><br/>Trí tưởng tượng phong phú giúp trẻ phát huy tính sáng tạo, một giá trị thành công của tương lai. Có nhiều cách để khơi dậy trí tưởng tượng cho trẻ, trong đó đọc sách cho nghe từ khi còn nhỏ một cách thường xuyên cũng là một chất men xúc tác rất hiệu quả cho việc hình thành chuỗi liên kết tưởng tượng trong tư duy của trẻ.<br/><br/>Giáo Dục Trí Tưởng Tượng Cho Trẻ - Cái Hố To Bí Mật với tranh minh họa sinh động, đáng yêu, phần lời thoại ý nghĩa, ngắn gọn, chắc hẳn sẽ là câu chuyện thú vị dành cho con em bạn.<br/><br/>Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...',
'1/1/2019')
insert into Hang
values(1,2,N'GIÁO DỤC TRÍ TƯỞNG TƯỢNG CHO TRẺ - CHƠI TRỐN TÌM',901,16500,'image\hang\642017132820966.jpg',
N'Giáo Dục Trí Tưởng Tượng Cho Trẻ - Chơi Trốn Tìm<br/><br/>Trí tưởng tượng phong phú giúp trẻ phát huy tính sáng tạo, một giá trị thành công của tương lai. Có nhiều cách để khơi dậy trí tưởng tượng cho trẻ, trong đó đọc sách cho nghe từ khi còn nhỏ một cách thường xuyên cũng là một chất men xúc tác rất hiệu quả cho việc hình thành chuỗi liên kết tưởng tượng trong tư duy của trẻ.<br/><br/>Giáo Dục Trí Tưởng Tượng Cho Trẻ - Chơi Trốn Tìm với tranh minh họa sinh động, đáng yêu, phần lời thoại ý nghĩa, ngắn gọn, chắc hẳn sẽ là câu chuyện thú vị dành cho con em bạn.<br/><br/>Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...',
'1/2/2019')
insert into Hang
values(1,3,N'GIÁO DỤC TRÍ TƯỞNG TƯỢNG CHO TRẺ - CON MUỐN CÓ SAO',902,16500,'image\hang\64201713290846.jpg',
N'Giáo Dục Trí Tưởng Tượng Cho Trẻ - Con Muốn Có Sao<br/><br/>Trí tưởng tượng phong phú giúp trẻ phát huy tính sáng tạo, một giá trị thành công của tương lai. Có nhiều cách để khơi dậy trí tưởng tượng cho trẻ, trong đó đọc sách cho nghe từ khi còn nhỏ một cách thường xuyên cũng là một chất men xúc tác rất hiệu quả cho việc hình thành chuỗi liên kết tưởng tượng trong tư duy của trẻ.<br/><br/>Giáo Dục Trí Tưởng Tượng Cho Trẻ - Con Muốn Có Sao với tranh minh họa sinh động, đáng yêu, phần lời thoại ý nghĩa, ngắn gọn, chắc hẳn sẽ là câu chuyện thú vị dành cho con em bạn.<br/><br/>Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...',
'1/3/2019')
insert into Hang
values(1,4,N'GIÁO DỤC TRÍ TƯỞNG TƯỢNG CHO TRẺ - CON THUYỀN GIẤY',903,22000,'image\hang\642017132932833.jpg',
N'Giáo Dục Trí Tưởng Tượng Cho Trẻ - Con Thuyền Giấy<br/><br/>Trí tưởng tượng phong phú giúp trẻ phát huy tính sáng tạo, một giá trị thành công của tương lai. Có nhiều cách để khơi dậy trí tưởng tượng cho trẻ, trong đó đọc sách cho nghe từ khi còn nhỏ một cách thường xuyên cũng là một chất men xúc tác rất hiệu quả cho việc hình thành chuỗi liên kết tưởng tượng trong tư duy của trẻ.<br/><br/>Giáo Dục Trí Tưởng Tượng Cho Trẻ - Con Thuyền Giấy với tranh minh họa sinh động, đáng yêu, phần lời thoại ý nghĩa, ngắn gọn, chắc hẳn sẽ là câu chuyện thú vị dành cho con em bạn.<br/><br/>Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...',
'1/4/2019')
insert into Hang
values(1,5,N'GIÁO DỤC TRÍ TƯỞNG TƯỢNG CHO TRẺ - NGƯỜI BẠN BIỂN',904,16500,'image\hang\64201713301430.jpg',
N'Giáo Dục Trí Tưởng Tượng Cho Trẻ - Người Bạn Biển<br/><br/>Trí tưởng tượng phong phú giúp trẻ phát huy tính sáng tạo. Tưởng tượng được hình thành trong suốt những năm đầu đời của trẻ thông qua các hoạt động tư duy và quan sát những sự vật, sự việc xung quanh. Khi đọc cho trẻ nghe một cuốn truyện phù hợp, phụ huynh sẽ khơi dậy tính hiếu kỳ, khám phá. Trẻ sẽ lắng nghe và mường tượng trong đầu về hình ảnh nhân vật xuất hiện, hình ảnh những nơi đang diễn tiến câu chuyện.<br/><br/>Người bạn biển với tranh minh họa sinh động, đáng yêu, phần lời thoại ý nghĩa, ngắn gọn, chắc hẳn sẽ là câu chuyện thú vị dành cho con em bạn.<br/><br/>Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...',
'1/5/2019')
insert into Hang
values(5,6,N'BÁC SĨ RIÊNG CỦA BÉ YÊU - BƯỚC ĐỆM VỮNG CHẮC VÀO ĐỜI',905,86000,'image\hang\642017133145814.jpg',
N'Bác Sĩ Riêng Của Bé Yêu - Bước Đệm Vững Chắc Vào Đời<br/><br/>Như tên gọi, đây là quyển sách giúp các bậc cha mẹ, ông bà có con, cháu trong độ tuổi từ 6 đến 12 tháng (hoặc lớn hơn) có thể cung cấp những chăm sóc khoa học cập nhật nhất, để thời điểm này thật sự là một bàn đệm vững chắc cho những thói quen khỏe mạnh cơ bản của trẻ về lâu dài. Điều này rất quan trọng, vì sẽ giúp được việc chăm sóc trẻ trong những năm về sau đơn giản hơn, vui vẻ hơn, khỏe mạnh hơn.<br/><br/>Sách gồm có các phần chính:<br/><br/>1. Các vấn đề cơ bản: các bước phát triển, tăng cân của trẻ; vấn đề chích ngừa; giãi mã các hiện tượng thường gặp ở trẻ trong độ tuổi này như: thói quen cắn, nhéo, cơn nín thở, hội chứng lo lắng vì bị cách xa....<br/><br/>2. Các vấn đề về giấc ngủ: những phương pháp giúp phụ huynh hỗ trợ, tập cho trẻ có giấc ngủ khỏe mạnh, xuyên đêm, đồng thời giúp chất lượng giấc ngủ của cả gia đình được đảm bảo.<br/><br/>3. Các vấn đề về răng miệng: giúp chăm sóc răng miệng, phòng ngừa sâu răng sớm.<br/><br/>4. Các vấn đề về ăn dặm: những kiến thức ăn dặm để phụ huynh có thể tự tin, nhanh chóng tập ăn dặm cho con mình một cách an toàn, khoa học.<br/><br/>5. Các vấn đề sức khỏe thường gặp: giải mã những hiểu lầm thường gặp trong cách tiếp cận sốt, sốt co giật, rửa mũi... Đồng thời cung cấp thông tin về những bệnh đơn giản nhưng quan trọng như: viêm tai giữa cấp, nấm miệng, hay lồng ruột.<br/><br/>6. Các vấn đề gia đình, cộng đồng, và xã hội.',
'1/6/2019')
insert into Hang
values(5,7,N'HỎI ĐÁP CƠ XƯƠNG KHỚP',906,37000,'image\hang\642017133248526.jpg',
N'Hỏi Đáp Cơ Xương Khớp<br/><br/>Các bệnh về cơ xương khớp là gánh nặng cho nhiều bệnh nhân dù còn tuổi trẻ. Chấn thương phát sinh từ thể thao, sinh hoạt hàng ngày hay sự suy thoái khớp theo tuổi tác tuy không thể tránh hoàn toàn nhưng vẫn có thể cải thiện nếu ta hiểu biết đúng về dinh dưỡng, điều trị, phục hồi.<br/><br/>HỎI ĐÁP CƠ XƯƠNG KHỚP là cuốn sách được viết bởi Tiến sĩ, Bác sĩ Tăng Hà Nam Anh, người có nhiều năm kinh nghiệm trong ngành, hiện là Trưởng khoa Ngoại Chấn thương chỉnh hình, bệnh viện Nguyễn Tri Phương; Phó Giám đốc Trung tâm phẫu thuật thực nghiệm Đại học Y dược TP.HCM; Phó chủ tịch Hội Y học Thể thao và Nội soi khớp Đông Nam Á. Cuốn sách được trình bày dưới dạng hỏi đáp về các vấn đề liên quan đến xương khớp thường gặp ở Việt Nam một cách ngắn gọn, thiết thực và hữu ích: thoái hóa khớp gối, gai xương gót, giãn dây chằng khớp, thoái vị đĩa đệm…<br/><br/>Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...',
'1/7/2019')
insert into Hang
values(5,1,N'NẤU ĂN BẰNG CẢ TRÁI TIM',907,69000,'image\hang\642017133514172.jpg',
N'Nấu Ăn Bằng Cả Trái Tim<br/><br/>- Sách của tác giả nổi tiếng: Christine Hà – cô gái khiếm thị gốc Việt đạt danh hiệu MasterChef USA mùa thứ 3. Hiện Ms Hà đang là giám khảo cuộc thi Vua đầu bếp Việt 2015. Cô hiện có hơn 240.000 lượt like trên fanpage chính thức.<br/><br/>- Nấu ăn bằng cả trái tim, bên cạnh những công thức nửa lạ nửa quen, Ms Hà còn chia sẻ những câu chuyện, những trải nghiệm của chính bản thân cô trong quá trình hoàn thiện bản thân, trở thành siêu đầu bếp giàu nghị lực như ngày nay.<br/><br/>- Cuốn sách được đón nhận nồng nhiệt của hàng triệu fan MasterChef trên thế giới và fan MasterChef ở VN, là cuốn sách best seller trên Amazon tháng 7/2013.<br/><br/>Trong bộ sưu tập hơn 75 công thức này, cô ấy đã biến những tài nghệ đáng nể của mình thành những món ăn thân thuộc mang hơi hướng Á Đông kết hợp với nền giáo dưỡng Hoa Kì để cho ra những món ăn ngon đặc biệt, dễ làm và đáng thèm. Nấu ăn bằng cả trái tim, là một bộ sưu tập đậm chất cá nhân, được dệt lên từ câu chuyện ấn tượng của Hà và tài nghệ cũng ấn tượng không kém để tạo nên những câu chuyện ẩm thực luôn đầy ắp hứng khởi.<br/><br/>',
'1/8/2019')
insert into Hang
values(5,2,N'LỊCH SỬ Y HỌC',908,70000,'image\hang\64201713370636.jpg',
N'Lịch Sử Y Học<br/><br/>Cuốn Lịch Sử Y Học viết về sự phát triển của ngành nghề chăm sóc sức khỏe con người qua các thời đại và ở các nền văn hóa khác nhau. Khác một chút với việc đọc các bài viết về Lịch sử, hoặc lịch sử các ngành khoa học như Vật lý, Toán học hay Sinh học, là những việc nghiêng về sở thích riêng của từng người, việc đọc cuốn Lịch sử Y học, nên là nhu cầu của tất cả con người có khát khao sống khỏe mạnh và có ý nghĩa.<br/><br/>Đọc cuốn sách này, bạn sẽ thôi cho rằng phó mặc hoàn toàn sức khỏe của bạn cho bác sĩ là một điều khôn ngoan. Bạn cũng sẽ hiểu rằng mặc dù có những tiến bộ vượt bậc và thần kỳ trong hiểu biết của con người về vấn đề sức khỏe trong hai thế kỷ qua, chúng ta vẫn đang thất bại trước những căn bệnh hoặc vấn đề từng là cơn đau đầu của những thầy thuốc thời cổ đại và cận đại, ví dụ như ung thư, các bệnh truyền nhiễm, các bệnh tâm thần và bệnh thoái hóa. Và cuối cùng, bạn sẽ nhận ra rằng cuộc đời mình cũng chỉ là một phần nhỏ trong lịch sử loài người, và rất có thể con cháu vài chục thế hệ sau của bạn khi được đọc về phần lịch sử Y học ở thế kỷ XXI cũng không thể không lắc đầu cười về những "ấu trĩ" của xã hội hiện hành.<br/><br/>Lịch Sử Y Học cũng là một món ăn tinh thần rất bổ ích cho các y bác sĩ đang ngày đêm làm công tác chăm sóc sức khỏe cho chúng ta. Giống như nhu cầu tìm hiểu về cuộc sống thời thơ ấu và quá khứ của người mình yêu thương, những hiểu biết tường tận hơn về quá trình phát triển của Y học như một ngành nghề hiện nay chắc chắn sẽ mang lại luồng sinh khí mới trong công việc, để yêu nghề hơn và để biết cần phải làm gì để tránh biến mình trở thành "lịch sử".<br/><br/>',
'1/9/2019')
insert into Hang
values(5,3,N'PHÒNG VÀ CẤP CỨU ĐUỐI NƯỚC',909,24000,'image\hang\642017133856376.jpg',
N'Phòng Và Cấp Cứu Đuối Nước<br/><br/>Sách trình bày những phương pháp cơ bản, dễ thực hiện với thiết bị sẵn có trong đời sống hàng ngày để phòng và cấp cứu người bị đuối nước.',
'1/10/2019')
insert into Hang
values(2,4,N'VẮNG MẶT: TIỂU THUYẾT',910,69010,'image\hang\1752017171627529.jpg',
N'Vắng Mặt<br/><br/>Vắng mặt là câu chuyện của cuộc sống đương đại, là "nỗi niềm của những người như chúng mình ngày một thêm vắng mặt ở ngay chính nơi mình sinh ra và lớn lên, ở ngay chính công việc mà mình được đào tạo."<br/><br/>Dường như những câu chuyện thật của cuộc đời được sắp xếp vào đây thành nên tác phẩm. Vì thế có thể nhìn thấy chính ta trong những dích dắc của chuyển động trong cuốn sách.<br/><br/>Nhân vật chính là họa sĩ Vũ.  Đa tài và đa tình.  Bao trùm lên trên tất cả những phố phường và các câu chuyện đô thị, những cuộc tình với thiếu nữ với đàn bà, những phi vụ bạc triệu bạc tỉ... là một nỗi day dứt xót xa, ê chề. Vì chính sự vắng mặt của những thứ gì mơ hồ hay dễ gọi tên... Thiết tha với cuộc sống hay không khi anh đã lạc vào chốn một mình, "cô đơn thường hiện diện".',
'1/11/2019')
insert into Hang
values(2,5,N'RONG CHƠI MIỀN KÝ ỨC',911,50250,'image\hang\642017134510.jpg',
N'Rong Chơi Miền Ký Ức<br/><br/>Rong chơi miền ký ức. Ký ức tha thiết, vui ấm áp, hoặc bàng bạc buồn. Ký ức về một mối tình sâu nặng và nhiều mối tình thoảng qua.<br/><br/>Miền ký ức của người họa sĩ có rất nhiều màu sắc và âm thanh, chi tiết rõ mồn một như một cuốn phim hiện ra trước mắt về thành phố nơi ông sống thuở ấu thơ, thời thanh niên với bao nhiêu hoài bão và mơ mộng.<br/><br/>Cuốn tiểu thuyết được viết theo một cách đặc biệt: rất nhiều những chú thích rất dài. Đọc thì mới hiểu, không chỉ là chú thích, đây cũng là ký ức của đoạn đời ấy, về khoảnh khắc ấy.<br/><br/>Tác giả tâm sự: "Nói ra điều này chắc bạn buồn cười, tôi yêu Hà Nội vì những gì nhôm nhoam vô lối của nó. Không có những nhôm nhoam ấy e rằng tôi cũng mất luôn hai cảm giác phẫn nộ và xót xa."<br/><br/>Nhà văn Nguyễn Việt Hà viết về ông:<br/><br/>"Giống như mọi cậu bé lê la ở mọi vỉa hè phố cũ, và cho đến giờ vẫn là một cao bồi lịch lãm, Đỗ Phấn là một kiểu hiếm hoi của người Hà Nội. So với những chuyện ông từng trải và từng biết về phố phường thì hai chục đầu sách có gì mà ngạc nhiên."',
'1/12/2019')
insert into Hang
values(2,6,N'NGHIỆT SÚC',912,116000,'image\hang\64201713658416.jpg',
N'Nghiệt Súc<br/><br/>Trong suốt cuộc đời làm cảnh sát của mình, Thanh tra Gabriella Versado đã từng chứng kiến nhiều hình thức giết người, nhưng chưa lần nào như lần này: xác chết của các nạn nhân một nửa là người, một nửa là thú, đôi khi các bộ phận được cắt ghép ngẫu nhiên không theo trình tự nào.<br/><br/>Clayton  Bloom  là một  nghệ  sĩ bất đắc chí đã tự tìm cho mình một “đam mê” mới, đó là ghép xác người và xác thú sao cho trông thật nhất có thể.<br/><br/>Detroit là cái xác đang phân hủy của Giấc mơ Mỹ.',
'1/13/2019')
insert into Hang
values(2,7,N'CHO XEM ĐÙI NÀO, LEILA',913,53600,'image\hang\64201713836604.jpg',
N'Cho Xem Đùi Nào, Leila<br/><br/>Tác giả mổ xẻ xã hội Liban đương đại bằng một ngòi bút mạnh mẽ mà hài hước hiếm có, mở một cánh cửa vào cuộc sống nội tâm phức tạp của giới trẻ Liban - đất nước Âu hóa bậc nhất thế giới Hồi giáo.<br/><br/>Trên giường bệnh viện, nhân vật chính hồi dần ký ức, anh nhớ ra rằng mình đã đâm phải cột điện và vào lúc tai nạn xảy ra, anh đang gọi điện cho người tình trẻ Leila. Chiếc xe hơi Nhật mua lại của người bạn liên tục đem tới đủ loại lo âu, khiến anh cảm giác đang lái một chiếc xe bị quỷ ám.<br/><br/>Nhưng rắc rối chỉ thực sự bắt đầu vào cái ngày anh nhận được tin ông bố sáu mươi lăm tuổi của anh sẽ cưới vợ lẽ, và để thỏa mãn cơn đỏng đảnh của cô vợ mới, ông sẽ bán căn hộ gia  đình.  Anh  tìm cách  ngăn  cản  đám  cưới  và  không ngần  ngại  lập  ra  đủ thứ  mưu  mẹo,  ngày  càng  quái  đản, thậm chí đề nghị cả nang Leila dịu dàng và vô tội tới điều tiết cơn khát tình dục của người cha...',
'1/14/2019')
insert into Hang
values(2,1,N'TÌNH LÀM SAO YÊU',914,88440,'image\hang\642017131056650.jpg',
N'Tình Làm Sao Yêu<br/><br/>Cô gái Christine sau khi ly hôn, trong khi bận giải quyết nhiều vấn đề trong cuộc sống cá nhân, thì lại tình cờ cứu được một anh chàng sắp nhảy cầu tự tử. Cô tìm mọi cách để giúp anh vui sống trở lại và nhờ đó chính cô cũng vui trở lại.',
'1/15/2019')
insert into Hang
values(3,2,N'NAM BỘ KHÁNG CHIẾN',915,12000,'image\hang\642017131338484.jpg',
N'Nam Bộ Kháng Chiến<br/><br/>Nam Bộ Kháng Chiến là tập truyện tranh lịch sử tái hiện những tháng ngày sôi sục khí thế cách mạng ở vùng đất Nam bộ chống lại việc Pháp tái chiếm Nam bộ.',
'1/16/2019')
insert into Hang
values(3,3,N'TRUYỆN TRANH DANH NHÂN THẾ GIỚI 01',916,15000,'image\hang\642017131449891.jpg',
N'Từ những trăn trở của bản thân, các nhà khoa học mang đến cho nhân loại một khối lượng đồ sộ các nguyên lí và tri thức khoa học. Hãy cùng cảm nhận sự nhiệt huyết dành cho khoa học và cuộc sống của các nhà khoa học nhằm mục đích thay đổi một cách toàn diện thế giới của chúng ta qua bộ Truyện Tranh Danh Nhân Thế Giới gồm 3 tâp này.<br/><br/>Đó là Copernicus và Galileo đã hi sinh vì khẳng định sự quay của Trái Đất, là Vesalius đã cố gắng kiểm chứng và cung cấp những thông tin về cơ thể người, là Faraday đã mang đến cho nhân loại điện năng, là cha đẻ của ngành hóa học hiện đại – Lavoisier, là Mendeleev với Bảng tuần hoàn các nguyên tố hóa học, chủ nhân của thuyết Tiến hóa - Charles Darwin, người đã phát minh phương pháp tiệt trùng ở nhiệt độ thấp để chúng ta có thể dùng sữa tươi tiệt trùng - Pasteur, Marie Curie – người mẹ của những nghiên cứu về phóng xạ, Einstein - người phát minh thuyết Tương đối, người tạo nên thuyết Di truyền - Mendel và người làm rõ thêm về hình dáng của Trái Đất - Wegener. Đó là những người đã nỗ lực mang đến cho chúng ta một cuộc sống tiện nghi và giàu có hơn.<br/><br/>...<br/><br/>Mời các bạn đón đọc!',
'1/17/2019')
insert into Hang
values(3,4,N'TRUYỆN TRANH DANH NHÂN THẾ GIỚI 02',917,16000,'image\hang\642017131632445.jpg',
N'Từ những trăn trở của bản thân, các nhà khoa học mang đến cho nhân loại một khối lượng đồ sộ các nguyên lí và tri thức khoa học. Hãy cùng cảm nhận sự nhiệt huyết dành cho khoa học và cuộc sống của các nhà khoa học nhằm mục đích thay đổi một cách toàn diện thế giới của chúng ta qua bộ Truyện Tranh Danh Nhân Thế Giới gồm 3 tâp này.<br/><br/>Đó là Copernicus và Galileo đã hi sinh vì khẳng định sự quay của Trái Đất, là Vesalius đã cố gắng kiểm chứng và cung cấp những thông tin về cơ thể người, là Faraday đã mang đến cho nhân loại điện năng, là cha đẻ của ngành hóa học hiện đại – Lavoisier, là Mendeleev với Bảng tuần hoàn các nguyên tố hóa học, chủ nhân của thuyết Tiến hóa - Charles Darwin, người đã phát minh phương pháp tiệt trùng ở nhiệt độ thấp để chúng ta có thể dùng sữa tươi tiệt trùng - Pasteur, Marie Curie – người mẹ của những nghiên cứu về phóng xạ, Einstein - người phát minh thuyết Tương đối, người tạo nên thuyết Di truyền - Mendel và người làm rõ thêm về hình dáng của Trái Đất - Wegener. Đó là những người đã nỗ lực mang đến cho chúng ta một cuộc sống tiện nghi và giàu có hơn.<br/><br/>...<br/><br/>Mời các bạn đón đọc!',
'1/18/2019')
insert into Hang
values(3,5,N'TRUYỆN TRANH DANH NHÂN THẾ GIỚI 03',918,20000,'image\hang\642017131717665.jpg',
N'Từ những trăn trở của bản thân, các nhà khoa học mang đến cho nhân loại một khối lượng đồ sộ các nguyên lí và tri thức khoa học. Hãy cùng cảm nhận sự nhiệt huyết dành cho khoa học và cuộc sống của các nhà khoa học nhằm mục đích thay đổi một cách toàn diện thế giới của chúng ta qua bộ Truyện Tranh Danh Nhân Thế Giới gồm 3 tâp này.<br/><br/>Đó là Copernicus và Galileo đã hi sinh vì khẳng định sự quay của Trái Đất, là Vesalius đã cố gắng kiểm chứng và cung cấp những thông tin về cơ thể người, là Faraday đã mang đến cho nhân loại điện năng, là cha đẻ của ngành hóa học hiện đại – Lavoisier, là Mendeleev với Bảng tuần hoàn các nguyên tố hóa học, chủ nhân của thuyết Tiến hóa - Charles Darwin, người đã phát minh phương pháp tiệt trùng ở nhiệt độ thấp để chúng ta có thể dùng sữa tươi tiệt trùng - Pasteur, Marie Curie – người mẹ của những nghiên cứu về phóng xạ, Einstein - người phát minh thuyết Tương đối, người tạo nên thuyết Di truyền - Mendel và người làm rõ thêm về hình dáng của Trái Đất - Wegener. Đó là những người đã nỗ lực mang đến cho chúng ta một cuộc sống tiện nghi và giàu có hơn.<br/><br/>...<br/><br/>Mời các bạn đón đọc!',
'1/19/2019')
insert into Hang
values(3,6,N'TRUYỆN TRANH CHẠNG VẠNG (Tập 1)',919,25000,'image\hang\642017131851815.jpg',
N'Bạn đã từng mê mẩn với mối tình lãng mạn của cô nữ sinh Bella và chàng trai ma cà rồng Edward qua hàng ngàn trang tiểu thuyểt với các tập Chạng Vạng, Trăng non, Nhật Thực, Hừng Đông của tác giả Stephenie Meyer,(trong đó Chạng vạng và Trăng non đã được dựng thành phim)<br/><br/>Thì nay bạn không nên bỏ qua tập truyện tranh đầu tiên được chuyển thể từ bộ tiểu thuyết này. Với cách vẽ phóng khoáng của Young Kim và sự hỗ trợ hết mình của Stephenie Meyer.<br/><br/>Truyện tranh Chạng Vạng đã đưa người đọc vào thế giới tưởng tượng đầy màu sắc nhưng chân thực – đúng như hình dung của tác giả - trong cách tạo hình mới mẻ đầy sức hấp dẫn này.<br/><br/>Hi vọng với tập truyện tranh đầu tiên này sẽ giúp bạn đọc có thêm một góc nhìn mới về các nhân vật mà mình yêu mến trong bộ tiểu thuyết đầy lãng mạn kể trên.',
'1/20/2019')
insert into Hang
values(6,7,N'CHUYÊN KHẢO VỀ TỈNH BẾN TRE',920,30000,'image\hang\642017135259341.jpg',
N'Chuyên Khảo Về Tỉnh Bến Tre - Địa Lý Học: Tự Nhiên, Kinh Tế & Lịch Sử Nam Kỳ.<br/><br/>Giới thiệu tóm tắt tác phẩm:<br/><br/>Quyển sách là công trình nghiên cứu khá tỉ mỉ và chi tiết về mọi mặt của vùng đất Bến Tre xưa để phục vụ cho công cuộc khai thác thuộc địa của Pháp tại vùng đất Tây Nam bộ có nhiều tiềm năng kinh tế. Dù còn nhiều hạn chế nhưng quyển sách đã giúp ta có cái nhìn khá toàn diện về các tỉnh ở Tây Nam bộ vào đầu thế kỷ 20.',
'1/21/2019')
insert into Hang
values(6,1,N'CHUYÊN KHẢO VỀ TỈNH CHÂU ĐỐC',921,26500,'image\hang\642017135423610.jpg',
N'Chuyên Khảo Về Tỉnh Châu Đốc - Địa Lý Học: Tự Nhiên, Kinh Tế & Lịch Sử Nam Kỳ.<br/><br/>Giới thiệu tóm tắt tác phẩm:<br/><br/>Quyển sách là công trình nghiên cứu khá tỉ mỉ và chi tiết về mọi mặt của vùng đất Châu Đốc xưa để phục vụ cho công cuộc khai thác thuộc địa của Pháp tại vùng đất Tây Nam bộ có nhiều tiềm năng kinh tế. Dù còn nhiều hạn chế nhưng quyển sách đã giúp ta có cái nhìn khá toàn diện về các tỉnh ở Tây Nam bộ vào đầu thế kỷ 20.',
'1/22/2019')
insert into Hang
values(6,2,N'CHUYÊN KHẢO VỀ TỈNH GIA ĐỊNH',922,57000,'image\hang\64201713551840.jpg',
N'Chuyên Khảo Về Tỉnh Gia Định - Địa Lý Học: Tự Nhiên, Kinh Tế & Lịch Sử Nam Kỳ<br/><br/>Giới thiệu tóm tắt tác phẩm:<br/><br/>Đầu thế kỷ XX, Hội nghiên cứu Đông Dương cho ra đời bộ sách “Hình thể địa lý, kinh tế và lịch sử Nam kì” về các tỉnh Nam kì. Quyển sách đều theo khung chung cố định của cả bộ sách, cung cấp cho bạn đọc cái nhìn toàn diện về tỉnh Gia Định lúc bấy giờ, bao gồm các mục lớn:<br/><br/>+ Địa lý hình thể<br/><br/>+ Địa lý kinh tế<br/><br/>+ Địa lý lịch sử và chính trị<br/><br/>+ Thống kê và hành chánh<br/><br/>Quyển sách thể hiện quan điểm và ý kiến của người Pháp về đất nước, con người Việt Nam lúc bấy giờ. Những thông tin trong sách cũng vô cùng quý giá, có thể giúp các nhà nghiên cứu, những người quan tâm về lịch sử tìm hiểu về Nam kì đầu thế kỷ XX.',
'1/23/2019')
insert into Hang
values(4,3,N'LỖ ĐEN: CÁC BÀI DIỄN THUYẾT TRÊN ĐÀI',923,26250,'image\hang\64201713444427.jpg',
N'Lỗ Đen: Các Bài Diễn Thuyết Trên Đài<br/><br/>Sách tập hợp hai bài nói chuyện của nhà vật lý vĩ đại Stephen Hawking trên BBC vào đầu năm 2016. Trong loạt bài giảng trên BBC này, tác giả đã dựng lên thách đố phải tóm lược câu chuyện cả một đời bên trong lỗ đen chỉ trong hai cuộc trò chuyện mười lăm phút.<br/><br/>Đóng góp độc đáo của Stephen Hawking cho nghiên cứu khoa học là dựng lên những phương thức tiếp cận các vấn đề chuyên môn rất đa dạng: nổi tiếng nhất, ông là người đầu tiên đã khảo sát vũ trụ rộng lớn bằng những kỹ thuật khoa học lập ra để nghiên cứu những hạt nhỏ bé bên trong nguyên tử. Các đồng nghiệp của ông trong lĩnh vực cực kỳ phức tạp này có thể lo lắng rằng công trình của họ sẽ chẳng bao giờ trình bày được để công chúng dễ hiểu. Vậy mà việc hướng đến một công chúng rộng rãi hơn lại là một biệt tài của Hawking. Để thêm phần dễ tiếp cận đối với những ai hiếu kỳ nhưng rối trí, bị mê hoặc bởi ý tưởng nhưng lúng túng về mặt khoa học, sách có phần giới thiệu và ghi chú thêm ở các điểm mấu chốt của David Shukman - biên tập viên khoa học của BBC News.',
'1/24/2019')
insert into Hang
values(4,4,N'ĐỊNH LÝ CUỐI CÙNG CỦA FERMAT',924,67890,'image\hang\642017134536609.jpg',
N'Định Lý Cuối Cùng Của Fermat',
'1/25/2019')
insert into Hang
values(4,5,N'TỦ SÁCH TRIẾT HỌC PHƯƠNG ĐÔNG - LÃO TỬ ĐẠO ĐỨC KINH',925,10000,'image\hang\642017134657953.jpg',
N'Tủ Sách Triết Học Phương Đông: Lão Tử Đạo Đức Kinh<br/><br/>Lão Tử là người huyện Khổ, nước Sở, sống trong thời Xuân Thu Chiến Quốc. Tương truyền ông là người viết bộ sách Đạo Đức Kinh, chủ yếu bàn về Đạo học và cách sống để hòa hợp với Đạo.<br/><br/>Ở Việt Nam, có rất nhiều nhà nghiên cứu đã dịch và bình chú về cuốn Đạo Đức Kinh của Lão Tử. Nhờ những cách hiểu và khám phá mới mẻ của mỗi nhà nghiên cứu mà nội dung quyển Đạo Đức Kinh ngày càng trở nên phong phú và nhiều màu sắc. Nhà xuất bản Trẻ xin giới thiệu đến quý độc giả hai cuốn sách Lão Tử Đạo Đức Kinh và Lão Tử Tinh Hoa.<br/><br/>Lão Tử Đạo Đức Kinh được học giả Nguyễn Duy Cần dịch trực tiếp từ bản gốc tiếng Trung Quốc, có kèm theo phần chú giải để độc giả tiện theo dõi. Lão Tử tinh hoa là cuốn sách bàn rộng ra về những nội dung cốt lõi của Đạo Đức Kinh.',
'1/26/2019')
insert into Hang
values(4,6,N'TRIẾT HỌC PHƯƠNG ĐÔNG - PHẬT HỌC TINH HOA',926,57120,'image\hang\64201713483293.jpg',
N'Phật Học Tinh Hoa (Tái Bản 2017)<br/><br/>Phật giáo ra đời từ một trong những cái nôi của nền văn minh nhân loại - Ấn Độ - và nhanh chóng phổ biến tại các nước phương Đông. Trải qua nhiều thế kỷ, với những biến động, thăng trầm, dù bị chia rẽ thành nhiều tông phái với nhiều lập trường giáo lý khác nhau nhưng Phật giáo vẫn giữ vững tinh thần chủ đạo của mình: từ bi, hỷ xả, khoan dung, đại lượng. Có lẽ vì thế mà Phật giáo luôn có chỗ đứng trong cộng đồng và tồn tại dưới nhiều hình thức khác nhau (kết hợp với tín ngưỡng dân gian, hoặc với Nho giáo và Đạo giáo.v.v). Tại Việt Nam, việc nghiên cứu Phật học không chỉ giới hạn trong phạm vi các trường Đại học, các hội đoàn chuyên môn, mà đã lan ra đến nhiều tầng lớp trong xã hội. Nhiều cuốn sách về Phật học đã ra đời, với nhiều trình độ khác nhau để đáp ứng nhu cầu tìm hiểu Phật giáo. Phật học tinh hoa của Thu Giang Nguyễn Duy Cần là một cuốn sách dành cho những người bước đầu tìm hiểu Phật giáo. Có thể coi đây là một cuốn sách đại cương triết học Phật giáo hoặc nhập môn Phật học đều được.',
'1/27/2019')
insert into Hang
values(4,7,N'BÍ ẨN MÃI MÃI LÀ BÍ ẨN 03',927,26800,'image\hang\642017135041176.jpg',
N'Bí Ẩn Mãi Mãi Là Bí Ẩn 03<br/><br/>Bí ẩn mãi mãi là bí ẩn 03 tiếp tục giới thiệu đến các bạn những điều bí ẩn đã và đang tồn tại xung quanh cuộc sống của chúng ta; những điều mà khoa học còn chưa có lời giải thích.',
'1/28/2019')