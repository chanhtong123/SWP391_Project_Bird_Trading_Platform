DROP DATABASE Bird_Trading

create database Bird_Trading

use Bird_Trading



CREATE TABLE [User] (
  [user_id] INT IDENTITY(1, 1) PRIMARY KEY,
  [username] VARCHAR(50) UNIQUE,
  [fullname] VARCHAR(50) NOT NULL,
  [password] VARCHAR(50) NOT NULL,
  [email] VARCHAR(100) NOT NULL UNIQUE,
  [address] NVARCHAR(100),
  [phone_number] VARCHAR(10) NOT NULL UNIQUE,
  [role] VARCHAR(20) NOT NULL ,
);

INSERT INTO [User] ([username], [fullname], [password], [email], [address], [phone_number], [role])
VALUES ('chanh',  'Nguyen Hong Chanh', '123', 'admin@gmail.com', N'51a Lang Tang Phu, Phuong Tang Nhon Phu A, Thanh Pho Thu Duc', '0962842531', 'Admin');
INSERT INTO [User] ([username], [fullname], [password], [email], [address], [phone_number], [role])

VALUES ('binh',  'Dao Xuan Binh', '123', 'user1@gmail.com', N'2 Hàn Thuyên, Bình Thọ, Thủ Đức, Thành phố Hồ Chí Minh', '0962951847', 'User');
INSERT INTO [User] ([username], [fullname], [password], [email], [address], [phone_number], [role])
VALUES ('Duc anh',  'Nguyen Duc Anh', '123', 'user2@gmail.com', N'102 Đ. Hồ Văn Tư, Trường Thọ, Thủ Đức, Thành phố Hồ Chí Minh', '0977827822', 'User');

INSERT INTO [User] ([username], [fullname], [password], [email], [address], [phone_number], [role])
VALUES ('phu', 'Do Xuan Phu', '123', 'staff@gmail.com', N'18 Đường Ụ Ghe, Tam Phú, Thủ Đức, Thành phố Hồ Chí Minh', '0979927436', 'Staff');
INSERT INTO [User] ([username], [fullname], [password], [email], [address], [phone_number], [role])
VALUES ('vinh',  'Bui Quang Vinh', '123', 'store1@gmail.com', N'164 Đ. Tam Bình, Khu phố 2, Thủ Đức, Thành phố Hồ Chí Minh', '0973876582', 
'Store Manager');
INSERT INTO [User] ([username], [fullname], [password], [email], [address], [phone_number], [role])
VALUES ('hoang',  'Vu Huy Hoang', '123', 'store2@gmail.com', N'151 QL1A, Bình Chiểu, Thủ Đức, Thành phố Hồ Chí Minh', '0973276982', 'Store Manager');
INSERT INTO [User] ([username], [fullname], [password], [email], [address], [phone_number], [role])
VALUES ('Linh',  'Nguyen Khanh Linh', '123', 'store3@gmail.com', N'25a Đ. Bình Chiểu, Bình Chiểu, Thủ Đức, Thành phố Hồ Chí Minh ', 
'097387864', 'Store Manager');



	
CREATE TABLE Store (
  store_id INT IDENTITY(1, 1) PRIMARY KEY,
  store_name NVARCHAR(100) NOT NULL UNIQUE,
  address NVARCHAR(200),
  phone_number VARCHAR(11),
  user_id INT UNIQUE,
  image varchar(500),
  FOREIGN KEY (user_id) REFERENCES [User](user_id)
);

CREATE TABLE StoreRegister (
  store_register_id INT IDENTITY(1, 1) PRIMARY KEY,
  store_name NVARCHAR(100) NOT NULL UNIQUE,
  address NVARCHAR(200),
  phone_number VARCHAR(11),
  user_id INT UNIQUE,
  FOREIGN KEY (user_id) REFERENCES [User](user_id)
);




INSERT INTO Store ( store_name, address, phone_number, user_id, image)
VALUES ( 'The Vintage Emporium', N'806/19 Hà Huy Giáp, Thạnh Lộc, Quận 12, Thành phố Hồ Chí Minh', '0855856420	', 5, 'images/images (1).jpg');

INSERT INTO Store ( store_name, address, phone_number, user_id, image)
VALUES ( 'Urban Chic Boutique', N'DT 750 Xã Cây Trường II, Bàu Bàng, Bình Dương', '0854315918', 6, 'images/wing-galaxy-logo-350x265.jpeg');

INSERT INTO Store ( store_name, address, phone_number, user_id, image)
VALUES ('Nature Haven Shop', N'TL 240 Xã, Long Hoà, Dầu Tiếng, Bình Dương', '0856872540', 7, 'images/images.jpg');




CREATE TABLE Product (
  STT_PT INT IDENTITY(1, 1) PRIMARY KEY,
  product_id AS 'PT' + RIGHT('00000' + CAST(STT_PT AS VARCHAR(10)), 5) PERSISTED,
  store_id INT,
  product_name NVARCHAR(100) NOT NULL,
  [description] NVARCHAR(MAX),
  price DECIMAL(10, 3) NOT NULL,
  quantity INT NOT NULL,
  image_url VARCHAR(2000),
  categoryName NVARCHAR(50) CHECK (categoryName IN ('Bird', 'Food', 'Accessory', 'Bird cage')) NOT NULL,
  status VARCHAR(20) CHECK (status IN ('Available', 'Out of stock', 'Hidden')) NOT NULL
  FOREIGN KEY (store_id) REFERENCES [Store](store_id)
);



INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (1, N'Vẹt xám Châu Phi', N'Vẹt xám châu Phi có tên tiếng Anh là African Grey Parrot. Nó bắt đầu tập nói từ trước 1 tuổi và khả năng nói trọn vẹn khi vẹt đạt 1 tuổi. Giống vẹt này có thể đạt đến tuổi thọ từ 50 – 80 năm trong môi trường được nuôi dưỡng, chăm sóc (so với mức tối đa 23 tuổi khi sống trong môi trường hoang dã).
Vẹt xám Châu Phi được coi là thông minh nhất trong số các loài vẹt, thực tế sẽ trở nên rõ ràng hơn khi bạn quan sát hành vi của chúng. Nhiều con trở nên cực kỳ ngọt ngào và tình cảm đối với chủ nhân của chúng, và loài này được biết đến là khá hòa đồng. Nhưng khi vẹt xám cảm thấy bị bỏ rơi hoặc buồn chán, chúng sẽ không ngần ngại bộc lộ sự than trách của mình khi có cơ hội.'
, 500.000, 50, 'images/African_Grey-768x576.jpg', 'Bird', 'Available');

INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (1, N'Vẹt Sun Conure', N'Giống vẹt này có danh hiệu “chú hề của thế giới” nhờ vào tập tính bay nhảy của chúng. Vẹt Sun Conure thường bay và treo ngược người, lắc lư trông rất vui mắt. Thuộc các loại biết nói ở Việt Nam nên tính xã hội hóa khá cao, sống tình cảm và dễ nuôi dạy. Người ta tìm thấy loài này chủ yếu Đông Bắc Nam Mỹ.Vẹt Sun Conure có thân hình dài khoảng 30 cm tính cả phần đuôi, cân nặng 120 – 130 gram nên thích hợp để nuôi trong nhà. Lông các giống vẹt ở Việt Nam thường sặc sỡ, loài Sun Conure này có lông theo tông vàng, cam, phần đuôi sẽ có một số khác biệt về màu sắc tùy con.
', 400.000, 25, 'images/sun-conure-2.jpg', 'Bird', 'Available');

INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (1, N'Vẹt Yến Phụng', N'Loài vẹt này mình đã nói qua trong bài viết các loài chim cảnh nhỏ. Giống vẹt này có sức khỏe tốt, dễ nuôi, tính cách thân thiện và có thể sinh sản dễ nên được dân chơi chim yêu thích. Tuy nhiên loài vẹt này không được nhanh nhẹn như các giống vẹt ở Việt Nam hay thế giới khác.
Lông vẹt Yến Phụng vô cùng đa dạng, có thể là vàng, xanh lá, xanh da trời, xám nhạt, đỏ,… Khi các màu sắc pha với nhau tạo nên một màu lông rất rực rỡ, hài hòa. Các loại vẹt Yến Phụng còn được biết đến với cái tên vẹt đuôi dài cho phần đuôi dài gần bằng thân trên.',
350.000, 50, 'images/sun-conure-3.jpg', 'Bird', 'Available');



INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (1, N'Vẹt Mào', N'Giống vẹt thân thiện nhất chắc chắn thuộc về vẹt mào. Bạn sẽ dễ dàng nhận ra một chú vẹt mào nhờ vào chiếc mào to và nổi bật trên đầu. Chiếc mào này được nhận xét là khá nữ tính. Loài vẹt này có giá thành khoảng vài triệu đồng, khá cao so với một chú chim cảnh.
Nuôi một chú vẹt mào trong nhà bạn sẽ cảm thấy không khí vui vẻ hơn. Loài vẹt này thích lắc lư theo tiếng nhạc, hay nói và thân thiện. Chính bởi vậy nhiều người đã chọn vẹt mào làm người bạn thú cưng bên mình.',
450.000, 30, 'images/vet-mao-1.jpg', 'Bird', 'Available');

INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (1, N'Vẹt Uyên Ương', N'Còn có tên gọi khác là vẹt Mẫu Đơn, vẹt Lovebird, các loại vẹt Uyên Ương có màu lông đa dạng, thường là màu xanh lá pha với đỏ, cam hoặc có thể là màu xám. trong các loài vẹt biết nói ở Việt Nam thì khả năng nói của loài vẹt này khá tốt và nói nhiều, có thể gây ồn ào nhưng nhìn chung thân thiện và trung thành.',
700.000, 50, 'images/vet-uyen-uong.jpg', 'Bird', 'Available');


INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (1, N'Vẹt Đuôi Dài Mặt Trời', N'Có lẽ danh hiệu loài vẹt rực rỡ nhất chắc sẽ thuộc về vẹt đuôi dài mặt trời. Sở hữu màu lông đỏ và vàng hệt như ánh mặt trời chói chang, phần đuôi dài rủ xuống vô cùng đẹp mắt. Vẹt đuôi dài mặt trời có tính hài hước, độ trung thành cao nên rất nổi bật trong các giống vẹt ở Việt Nam.
Loài vẹt này không nói được nhiều, đôi khi còn phát ra những âm thanh khó nghe, chói tai nhưng nhờ khả năng bay lượn tốt nên vẫn được giới chơi chim ưa chuộng. Hơn nữa tuy không thuộc các loại vẹt giá rẻ nhưng giá thành so với vẹt nhập khẩu thì rất tốt, phù hợp với túi tiền.',
250.000, 15, 'images/vet-duoi-dai-mat-troi-2.jpg', 'Bird', 'Available');


INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (1, N'Vẹt Lùn', N'Nghe cái tên chắc bạn cũng đoán được kích thước nhỏ bé của loài vẹt này đúng không? Chỉ dài khoảng 14 cm nên có thể lọt thỏm trong lòng bàn tay. Cho vẹt ăn gì sẽ không quá khó khăn, thức ăn của loài này bao gồm trái cây, hạt, hoa, chồi hoa,… đặc biệt những loài quả ngọt.
Màu lông của loài này thường là màu xanh lá toàn thân. Các con trống có cổ màu xanh lá cây trong khi con mái lại có miếng vá màu xanh da trời. Vẹt lùn rất năng động và hay bay nhảy, nhào lộn trên không trung. Nuôi một chú vẹt lùn trong nhà là một ý kiến hay cho một không gian sống động hơn.',
300.000, 50, 'images/vet-lun-1.jpg', 'Bird', 'Available');

INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (2, N'Chim Sơn Ca', N'Là một trong các loại chim sâu ở Việt Nam nên chim Sơn Ca có thân hình nhỏ bé, chỉ to ngang một nắm tay của người lớn. Chim thường có màu lông đa sắc, vàng ở trên đầu, nâu, đen ở thân trên và có màu trắng ở phần bụng.
Tùy vào đặc điểm khí hậu của mỗi vùng miền mà lông của chim Sơn Ca sẽ có sự khác biệt đôi chút. Nếu như ở Huế lông chim có màu vàng hơn bình thường và có hình vảy cả trên trán thì Sơn Ca Đà Nẵng lại có vân khía ở trán.',
600.000, 30, 'images/chim-son-ca.jpg', 'Bird', 'Available');

INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (2, N'Chim Họa Mi', N'Có tên khoa học là Garrulux Canorus, chim Họa Mi thường sinh sống ở các khu rừng, vườn cây, công viên,… Loài chim cảnh Việt Nam này khá nhỏ bé, chỉ ngang hoặc bé hơn chim Sơn Ca nhưng bù lại chúng là một trong các loại chim hót hay nhất. Bởi vậy mà người ta thường ví các ca sĩ có giọng hát cao là những chú chim họa mi.
Chim Họa Mi thường có màu lông vàng hoặc hạt dẻ tùy từng loại, vùng miền sinh sống. Để nhận biết loài chim cảnh Việt Nam này thì bạn hãy nhìn vào mắt chúng. Chim Họa Mi dù có màu lông như thế nào nhưng luôn có một đường viền trắng nhỏ quanh mắt.',
800.000, 20, 'images/chim-hoa-mi-1.jpg', 'Bird', 'Available');


INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (2, N'Chim Chào Mào', N'Chào Mào cũng là một trong các loại chim cảnh thường nuôi trong nhà được nhiều người yêu thích. Loài chim này sống theo bầy đàn, ăn các loại côn trung nhỏ và hoa quả. Khi làm tổ chúng sẽ quấn các sợi rơm, cảnh cây nhỏ thành hình cái cốc nhỏ.
Đặc điểm nhận dạng dễ nhất của loài chim cảnh Việt Nam này là phần mào hình tam giác nhô hẳn lên trên đầu. Có lẽ chính vì vậy mà cái tên Chào Mào ra đời. Lông chim có màu nâu nhạt, đậm nhất ở phần đầu và mào.',
300.000, 50, 'images/chim-chao-mao.png', 'Bird', 'Available');


INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (2, N'Chim Chích Chòe', N'Là một trong các loài chim cảnh nhỏ được nuôi phổ biến tại Việt Nam, chim Chích Chòe có thân hình nhỏ nhắn cùng đôi chân nhảy thoăn thoắt trên các cảnh cây. Loài chim này thường hót vào lúc giữa trưa hoặc tối muộn nên thường được nuôi ở các nơi công cộng như quán cafe, vườn chim,…
Ở Việt Nam có hai loài Chích Chòe phổ biến là Chích Chòe Than và Chích Chòe Lửa. Hai loài nhỏ này khá giống nhau nhưng vẫn có một vài điểm khác biệt nhỏ.Chích Chòe Than có màu đen gần như toàn thân, chỉ có hai vệt dài trên cánh và phần bụng là màu trắng. Còn Chích Chòe Lửa thì khác một chút ở phần bụng màu vàng, còn đâu phần lông trên thân chỉ nhạt màu hơn đối với con cái.',
550.000, 50, 'images/chim-chich-choe-1.jpg', 'Bird', 'Available');


INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (2, N'Chim Vàng Anh', N'Chắc hẳn ai cũng biết đến loài chim cảnh “Vàng Ảnh Vàng Anh” trong câu chuyện cổ tích Tấm Cám. Thuộc các loài chim hót hay nhất, chim Vàng Anh còn được gọi là chim Hoàng Anh, có giọng hót thánh thót rất dễ vào lòng người.
Chim Vàng Anh luôn nổi bật với màu lông vàng rực. Chim mái và chim trống sẽ có ánh màu khác nhau đôi chút. Chim Vàng Anh cũng thuộc các loại chim sâu ở Việt Nam nên thường được nuôi để diệt sâu và trang trí.Khi nuôi bạn nên chú ý thức ăn cho Vàng An để tránh chim không thân thiện với chủ. Loài chim cảnh này thường lảng tránh và tỏ ra nhút nhát nếu không được cho ăn ngon.',
100.000, 50, 'images/chim-vang-anh.jpg', 'Bird', 'Available');


INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (2, N'Chim Sáo', N'Chim Sáo là loài chim thông minh và có thể bắt chước tiếng người. Tuy nhiên các loại chim Sáo ở Việt Nam thường khá hung dữ, bởi vậy để thuần được một con chim Sáo phải là người yêu chim, có đam mê và lòng kiên nhẫn.Thuộc các loại chim cảnh đẹp nên không khó để thấy loài chim này trong nhà người nuôi chim tại Việt Nam. Thức ăn dành cho chim Sáo cũng khá dễ tìm như sâu bọ, cào cào, cơm,… Nếu bạn nuôi trong lồng thì nên cho ăn chuối, lạc trộn trứng, cơm,… thì sẽ hợp lý.',
300.000, 50, 'images/chim-sao.jpg', 'Bird', 'Available');


INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (2, N'Chim Khướu', N'Các loại chim cảnh ở Việt Nam thường có thân hình nhỏ bé, chim Khướu cũng nằm trong số đó. Loài chim này có phần mào nhô lên khá rõ, trong khi đó phần mắt và mào lại có màu đen nối liền với nhau nhìn khá huyền bí. Lông chim Khướu thường có mài nâu cánh gián hoặc đậm, nhạt hơn tùy theo các chi trong loài.
Loài chim cảnh Việt Nam này hay sống theo đàn nhỏ ở các vùng núi, làm tổ trong các bụi cây, có mái che hoặc hình cái chén. Ở Việt Nam phổ biến hai loại Khướu là Khướu Mun và Khướu Ô.',
120.000, 50, 'images/chim-khuou-1.jpg', 'Bird', 'Available');

INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (2, N'Chim Khuyên', N'Chim Khuyên là một trong các loài chim cảnh nhỏ được nuôi nhiều nhất ở Việt Nam nhờ màu lông đẹp và tiếng hót hay. Thân hình của chim Khuyên nhỏ nhắn, lọt thỏm trong bàn tay của người trưởng thành. Đầu chim khá to so với phần thân, trán rộng và cao, mắt hơi xếch nhẹ, có viền trắng xung quanh mắt.Phần lông chim Khuyên thường có màu vàng rực hoặc pha xám xanh ở cánh. Đặc biệt loài chim hót hay này còn có khả năng bắt chước giọng hót của một số loài chim khác như chim Chích Chòe. Thức ăn của loài chim này chủ yếu là côn trùng, mật hoa, quả nhỏ,…',
70.000, 50, 'images/chim-khuyen-1.jpg', 'Bird', 'Available');

INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (3, N'Lồng Chích Choè Lửa, Choè Than hàng tre già kỹ đục full lồng', 
N'Lồng chim Chòe, Chòe than, Chòe lửa , chim Ấc là  chất liệu trúc già dũi chỉ là một chiếc lồng đẹp, tinh tế và mang tính thẩm mỹ cao. Chân , của và gối cầu của lồng đều được đục họa tiết, tạo nên tổng thể của một chiếc lồng được hài hòa, tạo điểm nhấn đặc biệt lên chiếc lồng.
      Lồng chim Chòe thường có 2 kích cỡ là 64 nan và 68 nan tùy thuộc vào sở thích mỗi người Thiết kế gối cầu, cóng được căn chỉnh để tăng tính thẩm mỹ và hơn hết là thích hợp với chú chim Chòe than Không gian lồng cao, rộng, thoải mái giúp chim bay nhảy, không lo bị yếu chim và tránh được các tật lỗi Một chiếc lồng tròn sẽ tôn lên được dáng vẻ của chú chim, tinh tế và tỉ mỉ Vì vậy mà lồng tròn là sự lựa chọn vô cùng hợp lý với những ai đam mê loài chim Chích Chòe 
      Đối với người chơi chim thì việc chọn cho chú chim của mình một chiếc lồng đẹp là một điều vô cùng quan trọng. Chọn lồng cho chim như chọn nhà cho chúng vậy. Việc chọn chiếc lồng phù hợp không chỉ giúp nuôi chim dễ dàng hơn mà còn tôn lên dáng vẻ của chú chim
      Việc chọn lồng cũng tùy vào sở thích, có người thích lồng tròn, có người thích lồng vuông, nan mau hay nan thưa. Điều đó còn phù thuộc vào từng chú chim mà người chơi sẽ chọn những chiếc lồng phù hợp Với loại chim Chích Chòe thì việc sử dụng lồng tròn được rất nhiều nghệ nhân khuyên dùng',
1700.000, 50, 'images/long-chim-chao-mao-vuong-cao-bang-sung.jpg', 'Bird cage', 'Available');


INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (3, N'Lồng Chào Mào Vuông Cao,Tre già. Báng Súng 23 Nan.',
N'Giới thiệu đến các bạn lồng chim chào mào form cao với 23 nan kiểu báng súng, chân thẳng, tang trơn, hàng kỹ được làm hoàn toàn từ tre già, lên màu tự nhiên. Anh em sẽ nhận đầy đủ phụ kiện đi kèm: 2 cầu thẳng, 2 cầu góc, cóng, áo lồng, nậm, móc.

Mẫu lồng này hiện đã được bàn giao cho khách hàng, anh em quan tâm liên hệ với mình để biết thêm chi tiết – có thể tùy chọn kích thước, móc nậm theo ý của anh em.',
570.000, 50, 'images/2094567168.jpg', 'Bird cage', 'Available');


INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (3, N'Lồng Choè Cao Chất Liệu Inox Không Gỉ Sét',
N'Lồng chim chòe cao bằng inox phù hợp để nuôi các loại chim như chim chích chòe, chạch chọe, họa mi, vạc khuyên... Lồng được làm bằng Inox rất đẹp chắc chắn, dễ dàng vệ sinh và lau chùi không sợ bị rỉ sét hay mục mọt như lồng tre. Với kiểu dáng thiết kế mới lạ, độc đáo, cùng kích thước các nan khá dày giúp chim không bị lọt ra ngoài. Các mối hàn được đúo mài một cách cẩn thận để không làm tổn thương đến những chú chim đáng yêu của bạn.',
10.99, 50, 'images/5f61b5f63422f-16092020135134.jpg', 'Bird cage', 'Available');


INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (3, N'Lồng inox vuông 50x50', 
N'Lồng inox vuông kích thước 50x50 được coi là lựa chọn phổ biến và thích hợp để nuôi các loại chim. Inox là một loại vật liệu chống gỉ, chịu được điều kiện thời tiết khắc nghiệt, và có khả năng chống ăn mòn cao, do đó lồng inox vuông có thể được sử dụng trong môi trường nuôi chim trong nhà hoặc ngoài trời.

Kích thước 50x50 của lồng inox vuông cung cấp không gian đủ rộng cho chim di chuyển và vận động tự nhiên bên trong lồng. Ngoài ra, kích thước này cũng phù hợp cho việc đặt các ngăn chia bên trong lồng để tách các loại chim riêng biệt hoặc để tạo ra không gian ấp trứng và nuôi con.

Lồng inox vuông có lợi thế là dễ dàng để vệ sinh và bảo quản. Inox không thấm nước, không mục nát và không bị tác động bởi vi khuẩn hoặc mối mọt. Điều này giúp giảm nguy cơ lây nhiễm và bệnh tật cho chim. Hơn nữa, vật liệu inox có tính chất không thấm mùi, không làm biến đổi mùi tự nhiên của chim, tạo môi trường sống thoáng đãng và trong lành cho chim nuôi.
',
800.000, 50, 'images/58c19f9039621065c601c3a51d716ed7-2821468968881112001.jpg', 'Bird cage', 'Available');

INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (3, N'Cóng ăn uống tự động ', 
N'Cóng lồng chim là phụ kiện không thể thiếu trong 1 chiếc lồng. 1 chú chim hay 1 chiếc lồng chim đẹp cũng cần có 1 bộ cóng để làm nổi bật lên đồng thời cũng giúp chim dễ dàng lấy nước cũng như thức ăn.Cóng chim thường được đánh giá xem xét về mặt giá trị dựa trên những yếu tố chủ yếu',
85.000, 50, 'images/94354205ce5ff4eeec5478c77c417d91.jpg', 'Accessory', 'Available');


INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (3, N'Bộ 7 món đồ chơi bằng gỗ', 
N'Đặc điểm:
Đồ chơi con vẹt được làm thủ công từ 100% gỗ thật và vật liệu ABS không độc hại, an toàn và bền.
Tất cả các loại chim cảnh đều thích mổ và nhai. Cung cấp cho chim cảnh một nơi trên cao thú vị để leo nhai và đứng.
Tất cả đồ chơi phụ kiện lồng chim đều đi kèm với một móc hoạt động, dễ dàng kết nối móc thép với đầu lồng thú cưng của bạn.
7 món các loại võng treo, chuông, thang leo, cá rô bằng gỗ thật đáp ứng các nhu cầu vui chơi khác nhau cho chim hoặc vẹt, kích thước hoàn hảo cho vẹt đuôi dài nhỏ, vẹt màu xám, vẹt đuôi dài, vẹt, chim uyên ương, chim sẻ.
',
780.000, 50, 'images/download.jpg', 'Accessory', 'Available');

INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (3, N'Dụng Cụ Cho Chim Serbery Ăn Ngoài Trời', 
N'
Dụng cụ cho chim Serbery ăn ngoài trời là một bộ trang thiết bị đa dạng và hữu ích giúp bạn tạo môi trường tự nhiên và thoải mái cho các l
oại chim Serbery trong khu vườn hoặc nơi sống ngoài trời.
Bộ dụng cụ này được thiết kế đặc biệt để cung cấp thức ăn, nước và môi trường thích hợp cho chim, giúp chúng cảm thấy an toàn và hạnh phúc.
',
780.000, 50, 'images/dungcu1.jpg', 'Accessory', 'Available');

INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (3, N'Lồng Tổ Chim Hoàng Yến Bằng Nhựa, Trang Trí Lồng, Chảo Tổ Trứng Chim Dụng Cụ Nuôi Chim Thú Cưng', 
N'
Hàng mới 100% và chất lượng cao

Các tính năng:

Vật liệu chất lượng cao.

Dễ lắp đặt.

',
780.000, 50, 'images/dungcu2.jpg', 'Accessory', 'Available');




INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (3, N'Cám Hút Mật, Ốc Mít Lê Thịnh 100gr - Cám Lê Thịnh Cao Cấp', 
N'Thành phần: Trứng gà, đậu xanh, đậu đỏ, ngũ cốc, phấn hoa, mật ong, côn trùng, vitamin,...
Công dụng:
- Cung cấp dinh dưỡng tốt cho chim, lông bóng mượt.
- Khi chim dùng cám từ 2 tuần đến 1 tháng sẽ căng lửa, bền lực.
Bảo quản: Để nơi thoáng mát, tránh ánh sáng trực tiếp.
HSD: 45 ngày kể từ ngày mở gói.
Chuyên sỉ, lẻ cho anh em nghệ nhân !!!
',
780.000, 50, 'images/cam1.jpg', 'Food', 'Available');


INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (3, N'Thức ăn cho chim hoang dã Kaytee Hỗn hợp hạt giống cơ bản', 
N'Đóng gói lại và bảo quản ở nơi khô mát, tốt nhất là trong hộp kín. Điều này sẽ bảo vệ chống lại sự phá hoại của côn trùng
có thể xảy ra một cách tự nhiên với bất kỳ sản phẩm hạt nguyên hạt nào.. Luôn chứa đầy thức ăn tươi trong máng ăn. 
Vứt bỏ thức ăn cũ trước khi đổ đầy lại và vệ sinh máng ăn thường xuyên để giảm thiểu nấm mốc và vi khuẩn. 
Sản phẩm này chỉ dành cho chim hoang dã ăn.
',
780.000, 50, 'images/cam2.jpg', 'Food', 'Available');



INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (3, N'Thức ăn cho chim Sẻ và Hoàng Yến ZuPreem FruitBlend with Natural Fruit Flavors Extra Small Bird', 
N'Thức ăn cho chim Sẻ và Hoàng Yến ZuPreem FruitBlend with Natural Fruit Flavors Extra Small Bird. ZuPreem FruitBlend 
với hương vị trái cây tự nhiên Extra Small Bird Food đưa ra phỏng đoán về việc đáp ứng nhu cầu dinh dưỡng của chú chim nhỏ 
của bạn với chế độ ăn uống đầy đủ, lành mạnh. Sự pha trộn ngon miệng này đang bùng nổ với hương vị trái cây cho trải nghiệm
ăn uống thú vị mang đến cho chú chim cưng của bạn một nguồn dinh dưỡng cân bằng đáng tin cậy. Nó chứa đầy trái cây như cam, táo, 
nho và chuối cộng với tất cả các chất dinh dưỡng cần thiết mà chim bạn cần mỗi ngày để có sức khỏe tốt. ZuPreem FruitBlend là tuyệt
vời cho chim hoàng yến, chim sẻ và những con vẹt rất nhỏ khác thích kích thước viên nhỏ hơn.
',
780.000, 50, 'images/cam3.jpg', 'Food', 'Available');



INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (3, N'Zupreem Pure Fun Size S Thức Ăn Cho Chim Vẹt Cỡ Vừa', 
N'Zupreem Pure Fun – Đây là loại thức ăn có sự pha trộn cao cấp của trái cây như: 
Cam, táo, nho, chuối, dứa cùng với các loại hạt khô như: Hạt dẻ cười, đậu hòa lan, đậu phộng. 
Và thêm vào đó còn có: Cà rốt, tinh bột gạo. Nhất là không thể thiếu các loại Vitamin và các khoáng chất thiết yếu dành cho loài vẹt. 
Tạo nên một bữa ăn cực kì đầy đủ dinh dưỡng cho vẹt cưng của bạn.
',
780.000, 50, 'images/cam4.jpg', 'Food', 'Available');

INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (3, N'Thức ăn cho vẹt ZuPreem AvianBreeder FruitBlend with Natural Fruit Flavors Cockatiel', 
N'Thức ăn cho vẹt ZuPreem AvianBreeder FruitBlend with Natural Fruit Flavors Cockatiel.
Trái cây ZuPreem FruitBlend với hương vị trái cây tự nhiên này đưa ra phỏng đoán đáp ứng nhu cầu dinh dưỡng của cockatiel,
lovebird, conure hoặc quaker của bạn. Hỗn hợp trái cây này được sản xuất tại Hoa Kỳ và được thiết kế đặc biệt để giúp hỗ trợ sức 
khỏe sinh sản của các loài chim sinh sản trung bình. Mỗi miếng cắn đều bùng nổ với hương vị trái cây tự nhiên từ cam, táo,
nho và chuối thật. Và bạn sẽ rất vui khi biết rằng những viên thông minh giòn này được chế tạo với các vitamin và khoáng chất để
giúp người bạn lông vũ của bạn có được tất cả các chất dinh dưỡng cần thiết để hỗ trợ sức khỏe tổng thể và sức khỏe của cô ấy!
',
780.000, 50, 'images/cam5.jpg', 'Food', 'Available');


INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (3, N'Zupreem NuBlend Size S Thức Ăn Cho Chim Vẹt Nhỏ', 
N'Zupreem NuBlend – Đây là sự kết hợp của các loại như: Bắp, lúa mạch, đậu nành mang hương vị của các loại hạt cùng với các Vitamin,
khoáng chất thiết yếu dành cho vẹt, mang lại một bữa ăn đầy chất dinh dưỡng cho vẹt cưng của bạn.
Dinh dưỡng cần thiết hàng ngày cho vẹt vừa với màu sắc và hương vị của hạt, bổ sung thêm sự đa dạng cho bữa ăn hàng ngày của vẹt.
',
780.000, 50, 'images/cam6.jpg', 'Food', 'Available');


INSERT INTO Product (store_id, product_name, [description], price, quantity, image_url, categoryName, status)
VALUES (3, N'Zupreem Natural Size M Thức Ăn Cho Chim Vẹt Cỡ Vừa Đến Lớn', 
N'Zupreem Natural Size M – Thức ăn dành cho chim cỡ vừa tới lớn, cung cấp cho chim của bạn các chất dinh dưỡng cần thiết cho một chế độ ăn uống lành mạnh và cân bằng.
Zupreem Natural – Đây là sự kết hợp độc đáo giữa các loại thực phẩm như: Bắp, yến mạch, lúa mạch, 
đậu nành cùng với các loại rau, củ, quả như: Mùi tây, cần tây, củ cải đường, cà rốt, quả nam việt quốc.
Kèm theo đó là các chất như: Canxi cacbonat, biotin và các khoáng chất có lợi cho vẹt gồm: Ô-xít manga, 
ô-xít kẽm, đồng sunfat, tạo nên một sản phẩm giàu dưỡng chất nhất cho vẹt cưng của bạn.
',
780.000, 50, 'images/cam7.jpg', 'Food', 'Available');






CREATE TABLE [CartItem] (
  cart_item_id INT IDENTITY(1, 1) PRIMARY KEY,
  STT_PT INT NOT NULL,
  product_name NVARCHAR(100) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  quantity INT NOT NULL,
  image_url VARCHAR(2000),
  store_name nvarchar(500),
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES [User](user_id),
  FOREIGN KEY (STT_PT) REFERENCES Product(STT_PT)
);





CREATE TABLE [Order] (
  order_id INT IDENTITY(1, 1) PRIMARY KEY,
  user_id INT,
  total_amount DECIMAL(10, 3),
  order_status VARCHAR(20), 
  order_date DATETIME,
  FOREIGN KEY (user_id) REFERENCES [User](user_id),
);





CREATE TABLE OrderItem (
  order_item_id INT IDENTITY(1, 1) PRIMARY KEY,
  order_id INT NOT NULL,
  STT_PT INT NOT NULL,
  store_id INT,
  quantity INT NOT NULL,
  price DECIMAL(10, 3),
  product_name NVARCHAR(100) NOT NULL, 
  image_url VARCHAR(2000),
  categoryName NVARCHAR(50),
  orderItem_date DATETIME,
  status_orderItem NVARCHAR(100) ,
  FOREIGN KEY (order_id) REFERENCES [Order](order_id),
  FOREIGN KEY (store_id) REFERENCES [Store](store_id)
);



CREATE TABLE Province (
  province_id INT IDENTITY(1, 1) PRIMARY KEY,
  province_name NVARCHAR(100) NOT NULL,
  shipping_cost DECIMAL(10, 3) NOT NULL,
);

CREATE TABLE Delivery (
  delivery_id INT IDENTITY(1, 1) PRIMARY KEY,
  province_id INT NOT NULL,
  user_id INT NOT NULL,
  total_amount DECIMAL(10, 3) NOT NULL,
  shipping_cost DECIMAL(10, 3) NOT NULL,
  address NVARCHAR(100) NOT NULL,
  province_name NVARCHAR(100) NOT NULL,
  receiver_name NVARCHAR(100) NOT NULL,
  phone_number NVARCHAR(20) NOT NULL,
  FOREIGN KEY (province_id) REFERENCES Province(province_id),
  FOREIGN KEY (user_id) REFERENCES [User](user_id)
);


CREATE TABLE Feedback ( 
feedback_id INT IDENTITY(1, 1) PRIMARY KEY,
order_item_id INT,
[user_id] INT,
rating INT,
comment VARCHAR(255),
timestamp DATETIME DEFAULT GETDATE(),
FOREIGN KEY ([user_id]) REFERENCES [User]([user_id]) 
);




INSERT INTO Province (province_name, shipping_cost)
VALUES (N'TP HCM', 22.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Ha Noi', 22.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Da Nang', 30.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'An Giang', 40.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Ba Ria - Vung Tau', 45.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Bac Liêu', 40.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Bac Kan', 40.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Bac Giang', 40.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Bac Ninh', 40.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Ben Tre', 33.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Binh Duong', 22.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Binh Dinh', 45.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Binh Phuoc', 35.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Binh Thuan', 35.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Ca Mau', 34.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Cao Bang', 45.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Dak Lak', 42.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Dak Nong', 42.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Dien Bien', 37.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Dong Nai', 27.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Dong Thap', 30.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Gia Lai', 40.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Ha Giang', 45.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Ha Nam', 40.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Ha Tinh', 40.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Hai Duong', 45.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Hai Phong', 45.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Hoa Binh', 42.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Hung Yen', 40.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Khanh Hoa', 50.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Kien Giang', 37.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Kon Tum', 32.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Lai Chau', 40.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Lam Dong', 32.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Lang Son', 45.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Lao Cai', 45.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Long An', 27.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Nam Dinh', 40.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Nghe An', 40.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Ninh Binh', 40.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Ninh Thuan', 45.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Phu Tho', 42.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Phu Yen', 35.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Quang Binh', 35.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Quang Nam', 35.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Quang Ngai', 37.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Quang Ninh', 38.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Quang Tri', 40.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Soc Trang', 39.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Son La', 43.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Tay Ninh', 42.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Thai Binh', 36.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Thai Nguyen', 42.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Thanh Hoa', 45.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Tien Giang', 45.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Tra Vinh', 40.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Tuyen Quang', 45.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Vinh Long', 38.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Vinh Phuc', 41.000);

INSERT INTO Province (province_name, shipping_cost)
VALUES (N'Yen Bai', 40.000);





